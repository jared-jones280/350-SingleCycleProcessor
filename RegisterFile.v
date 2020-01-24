module RegisterFile(BusA, BusB, BusW, RA, RB, RW, RegWr, Clk);
    output [63:0] BusA;
    output [63:0] BusB;
    input [63:0] BusW;
    input [4:0] RA, RB, RW;
    input RegWr;
    input Clk;
    reg [31:0] registers [63:0];
    
    initial begin
    registers[31] <= 64'b0;
    end
    
    assign #2 BusA = registers[RA];
    assign #2 BusB = registers[RB];
    
    always @ (negedge Clk) begin
    //register 31 is always 0
    registers[31] <= 64'b0;
    //on neg edge if RegWr is 1 then set BusW data in register[Rw]
    if((RegWr) & (RW!=5'd31))
            registers[RW] <= #3 BusW;
    end
endmodule