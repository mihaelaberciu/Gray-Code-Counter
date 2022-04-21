module GrayCodeCounter(
input 	                       clk,
input   				               reset_n,
input                          cen,
output    [3:0]                count							//[N-1 : 0 ]  n = width - 4
);


reg [3:0] count_intern;

parameter s0=4'b0000, s1=4'b0001, s2=4'b0011, s3=4'b0010, s4=4'b0110, s5=4'b0111, 
s6=4'b0101, s7=4'b0100, s8=4'b1100, s9=4'b1101, s10=4'b1111,s11=4'b1110, s12=4'b1010,
s13=4'b1011, s14=4'b1001, s15=4'b1000;


always @(posedge clk or negedge reset_n)
begin
	#10;
     if (~reset_n) 
        count_intern     <= s0;      // reset_n
    if ( reset_n && cen)
        case(count_intern)
        s0:  begin count_intern <= s1;  if (~cen)  count_intern <= s0;      end
        s1:  begin count_intern <= s2;  if (~cen)  count_intern <= s1;      end
        s2:  begin count_intern <= s3;  if (~cen)  count_intern <= s2;      end
        s3:  begin count_intern <= s4;  if (~cen)  count_intern <= s3;      end
        s4:  begin count_intern <= s5;  if (~cen)  count_intern <= s4;      end
        s5:  begin count_intern <= s6;  if (~cen)  count_intern <= s5;      end
        s6:  begin count_intern <= s7;  if (~cen)  count_intern <= s6;      end
        s7:  begin count_intern <= s8;  if (~cen)  count_intern <= s7;      end
        s8:  begin count_intern <= s9;  if (~cen)  count_intern <= s8;      end
        s9:  begin count_intern <= s10; if (~cen)  count_intern <= s9;      end
        s10: begin count_intern <= s11; if (~cen)  count_intern <= s10;     end
        s11: begin count_intern <= s12; if (~cen)  count_intern <= s11;     end
        s12: begin count_intern <= s13; if (~cen)  count_intern <= s12;     end
        s13: begin count_intern <= s14; if (~cen)  count_intern <= s13;     end
        s14: begin count_intern <= s15; if (~cen)  count_intern <= s14;     end
        s15: begin count_intern <= s0;  if (~cen)  count_intern <= s15;     end
 endcase	

end

assign count=count_intern;

endmodule
