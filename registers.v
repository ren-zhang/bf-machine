module PC (clock, in, out, LdPC, reset);
	input clock;
	input [15:0] in;
	input LdPC;
	input reset;
	output [15:0] out;

	reg [15:0] out;
	
	always @(posedge clock)
	begin
		if (reset)
		begin
			out <= 16'b0;
		end
		else if (LdPc)
		begin
			out <= in;
		end
	end
	
endmodule


module BCount (clock, out, BCountDecInc, BCountEnable, reset);
	input clock;
	input BCountDecInc;
	input BCountEnable;
	input reset;
	
	output [7:0] out;
	
	reg [7:0] out;
	
	always @(posedge clock)
	begin
		if (reset)
		begin
			out <= 8'b0;
		end
		else if (BCountEnable & !BCountDecInc)
		begin
			out <= out + 8'b1;
		end
		else if (BCountEnable & BCountDecInc)
		begin
			out <= out - 8'b1;
		end
	end

endmodule