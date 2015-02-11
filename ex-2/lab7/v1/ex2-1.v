/*
 * ex2_1
 * 
 * Purpose:
 * - Reset on rst=1
 * - When validi=1 three clk's in a row, compute data_out=a*b+c
 *   where a is data_in on the first clk, b on the second and c
 *   on the third. Also set valido=1. Else valido=0 which means
 *   data_out is not valid.
 */

module ex2_1 (
	      input 		 clk, rst, validi,
	      input [31:0] 	 data_in,
	      output logic 	 valido, 
	      output logic [31:0] data_out
	      );
   
   enum 			 {S0, S1, S2} state, next;
   
   logic [31:0]  		 a1, a2, a3;
   logic [31:0]			 counter;

   initial begin
      state = S0;
   end
   
   always_ff @(posedge clk or posedge rst) begin
      if (rst) begin
	 data_out <= 32'b0;
	 valido <= 1'b0;
	 state = S0;
	 counter = 0;
	 a1 = 0;
	 a2 = 0;
	 a3 = 0;
      end
   
      else begin
	 case (state)

	   // S0
	   S0: begin
	      //valido <= 1'b0;
	      if (validi) 
		  	begin
		  		a1 = data_in;
		  		a2 += data_in;
		  		a3 *= data_in;
		  		data_out <= a2;
		 		if(counter > 2 && (counter % 3 == 0)) 
					begin
	 	 				valido <= 1'b1;
		 			end
		 		next = S1;
		 		counter += 1;
		  	end
		  else 
		  	begin
		 		next = S0;
		 		counter = 0;
				valido <= 1'b0;
	      	end
	   end

	   // S1
	   S1: begin
	      if (validi) 
		  	begin
		 		a1 *= data_in;
		 		a2 = data_in;
		 		a3 += data_in;
		 		data_out <= a3;
		 		if(counter > 2 && (counter % 3 == 1)) 
					begin
	 	 				valido <= 1'b1;
		 			end
		 		next = S2;
		 		counter += 1;
			end	      
		  else 
		  	begin
				next = S0;
				counter = 0;
				valido <= 1'b0;
		  	end
	   end

	   // S2
	   S2: begin
	      if (validi) 
		  	begin
		 		a1 += data_in;
		 		a2 *= data_in;
		 		a3 = data_in;
		 		data_out <= a1;
		 		if(counter % 3 == 2) 
					begin
		 				valido <= 1'b1;
		  			end
	      		next = S0;
		  		counter += 1;
			end
		  else 
		  	begin
				next = S0;
		 		counter = 0;
				valido <= 1'b0;
			end
	   end
	       
	 endcase
	 state = next;
	 
      end
   end
endmodule
