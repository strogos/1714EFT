/* -*- mode: c++ -*-
** 
** consumer.h
** 
** Made by Kjetil Svarstad
** 
*/

#ifndef   	__CONSUMER_H_
# define   	__CONSUMER_H_

#include "if.h"

// Data consumer class, inherits standard SystemC module (supporting
// threads)
class consumer : public sc_module, public fifo_callback_if
{
private:
	bool request_read_ ;
 public:
  
	 // need a port to the fifo's read interface
	 sc_port < fifo_read_cb_if<char> > readp;
  
	// constructor
	consumer (sc_module_name name) : sc_module(name)
	{
		request_read_ = false;
		// connect module to the systemC simulator since we don't use the
		// pre-made SC_MODULE declaration macro
		SC_HAS_PROCESS(consumer);
  
		// setter bare prosess-tråd til main-funksjon. Ikke sensitiv for
		// noen eksterne "events", dvs. må startes manuelt etter
		// suspendering (som med wait (tid))
		//
		// one process thread for the main function. Not sensitive for any
		// external events, starts at time 0 and runs until simulation stops
		SC_THREAD(main); 
  } 
  
	void ack(bool c)
	{
	  request_read_ = c;
	}
  // definition of the process main thread
  void main() 
  {
	  // local char variable for storing read byte
		char c;

	// thread needs to run indefinitely until simulator itself stops
    while (true) 
	{
		while (!request_read_)
		{
			readp->req_r(true);
			wait(short_time);
		}
      
      c = readp->read ();
	  readp->req_r(false);
      wait (long_time);
    }
  }
};


#endif 	    /* !__CONSUMER_H_ */
