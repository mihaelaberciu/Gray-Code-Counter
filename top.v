module top();


reg      	    clk;
reg       		reset_n;
reg       		cen;
wire  [3:0]     count;


always #5 clk <= ~clk;

initial begin
	cen=0;
	clk=0;
	reset_n=0;
	#25;
	reset_n=1;
	#20;
	cen=1;
	#210;
	$stop;
end


GrayCodeCounter GCC(
.clk(clk),
.reset_n(reset_n),
.cen(cen),
.count(count)
);


endmodule
