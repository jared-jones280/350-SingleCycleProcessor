module Mux21_64(out, in0,in1, sel);
input [63:0] in0 , in1;
input sel;
output reg [63:0] out;

/*wire outI0, outI1, nsel;
not n0(nsel, sel);
and a1(outI0, in[0], nsel);
and a2(outI1, in[1], sel);
or o1(out, outI0, outI1);*/
always @(*)
begin
if(sel)
begin
out <= #2 in1;
end
else
begin
out <= #2 in0;
end
end
endmodule