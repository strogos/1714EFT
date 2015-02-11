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
   
   enum 			 {S0, S1, S2, S3} state, next;
   
   logic [31:0] 			 a;  
   
   logic[31:0] data_out_buff;//[];why not dynamic???
   int buff[3];
   int count_valid_inputs; 
   initial begin
      state = S0;
   end
   
   always_ff @(posedge clk or posedge rst) begin
      if (rst) begin
		 data_out <= 32'b0;
		 valido <= 1'b0;
		 state = S0;
		 count_valid_inputs=0;
      end
   
      else begin
	 case (state)
	   
	   // S0
	   S0: begin
	      
	      if (validi) begin
			 a = data_in;
			 buff[0]=a;		 
			 next = S1;
			 count_valid_inputs+=1;
			  if (count_valid_inputs==3) begin
				 valido <= 1'b1;
		         count_valid_inputs=0;
		      end
		  end
	      else begin
		    valido <= 1'b0;
			count_valid_inputs=0;		  
		  end
	   end

	   // S1
	   S1: begin
	      if (validi) begin
			 a *= data_in;
			 buff[1]=a;
			 next = S2;
			 count_valid_inputs+=1;
			  if (count_valid_inputs==3) begin
				  valido <= 1'b1;
				  count_valid_inputs=0;
			  end
		  end
	      else
			next = S0;
	   end

	   // S2
	   S2: begin
	      if (validi) begin
			 a += data_in;
			 buff[2]=a;
			 data_out <= a;
			 count_valid_inputs+=1;
			if (count_valid_inputs==3) begin
				valido <= 1'b1;
				count_valid_inputs=0;
			end

	      end
	      next = S0;
	   end
	   

	 endcase
	 state = next;
	 
      end
   end
endmodule
      



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
/*
module ex2_1 (
	      input 		 clk, rst, validi,
	      input [31:0] 	 data_in,
	      output logic 	 valido, 
	      output logic [31:0] data_out
	      );
   
   enum 			 {S0, S1, S2} state, next;
   
   logic [31:0] 			 a;

   initial begin
      state = S0;
   end
   
   always_ff @(posedge clk or posedge rst) begin
      if (rst) begin
	 data_out <= 32'b0;
	 valido <= 1'b0;
	 state = S0;
      end
   
      else begin
	 case (state)
	   
	   // S0
	   S0: begin
	      valido <= 1'b0;
	      if (validi) begin
		 a = data_in;
		 next = S1;
	      end
	   end

	   // S1
	   S1: begin
	      if (validi) begin
		 a *= data_in;
		 next = S2;
	      end
	      else
		next = S0;
	   end

	   // S2
	   S2: begin
	      if (validi) begin
		 a += data_in;
		 data_out <= a;
		 valido <= 1'b1;
	      end
	      next = S0;
	   end
	       
	 endcase
	 state = next;
	 
      end
   end
endmodule
*/
