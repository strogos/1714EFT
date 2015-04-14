/* -*- mode: c++ -*-
** 
** producer.h
** 
** Made by Kjetil Svarstad
** 
*/

#ifndef   	__PRODUCER_H_
# define   	__PRODUCER_H_

#include "if.h"

// Data producer, inherits standard SystemC module (supporting
// threads)

class producer : public sc_module, public fifo_callback_if
{
private:
	bool request_write_;
 public:
  // need a port to he fifo's write interface
  sc_port < fifo_write_cb_if<char> > writep;

  // Constructor
  producer (sc_module_name name) : sc_module (name) 
  {
	  request_write_=false;
    // Connect into systemc simulator backbone since we don't use the
    // SC_MODULE declaration macro
    SC_HAS_PROCESS (producer);

    // som bare deklarerer en prosess-tråd som startes ved tid 0
    // og som ikke er sensitiv for noen "events", dvs. hvis den
    // suspenderes, så må den startes manuelt f.eks. med "wait (tid)"
    // og lignende
    //
    // declaring a main process thread that is not sensitive for any
    // signals, automatically starts at time 0 and runs indefinitely
    // as long as not suspended with a wait
    SC_THREAD(main);
  }
	void ack(bool c)
	{
	  request_write_ = c;
	}

  // defining the wait process thread
  void main() 
  {

    // a few bytes for passing through the fifo
    const char *str =
      "Visit www.systemc.org and see what SystemC can do for you today!";

    // and a pointer for reading bytes from the string
    const char *p = str;

    // The total number of writes we will execute in the performance
    // test
    int total = 100000;

    // en prosess-tråd skal gå i det uendelige (simulatoren tar
    // ansvar for å stoppe alle tråder når f.eks. satt simulerings-tid
    // er nådd eller man "trekker i snora" (sc_stop)
    //
    // the process main thread runs indefinitely until max simulation
    // time or some module calls sc_stop

	
    while (true)
	{
        int i = 1 + rand() % 19;  //  1 <= i <= 19

      // and then we send each byte to the fifo as fast as possible
      while (--i >= 0) 
	  {
		while (!request_write_)
		{
			writep->req_w(true);
			wait(short_time);
		}
		// sends one byte and increments the pointer in one turn
		writep->write (*p++);
		writep->req_w(false);

		// if string end is reached, start at the beginning of the
		// string again
		if (!*p) p = str;

		// decrement the total count
		-- total;
      }

      // Have we sent our total of bytes?
      if (total <= 0) 
	  {
		cout << endl;
		// then we can end the simulation
		sc_stop ();
      }
      wait (very_long_time);
    }
  }
};


#endif 	    /* !PRODUCER_H_ */
