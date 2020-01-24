module NextPClogic(NextPC, CurrentPC, SignExtImm64, Branch, ALUZero, Uncondbranch); 
       input [63:0] CurrentPC;
       input [63:0] SignExtImm64; 
       input Branch, ALUZero, Uncondbranch; 
       output reg [63:0] NextPC; 
       /* write your code here */
       //addition has delay of 2
       //mux / if statements have delay of 1
       always @(*)begin
       /* using the textbook cpu design always just +4 to PC
       unless the following statement is true, if so then just
       add sign extended shifted left 2
       (ALUZero & Branch) | Uncondbranch */
       //SignExtImm64 = #1 SignExtImm64<<2; DOES NOT DO THIS AT ALL CHECK IF THIS IS NEEDED IN NEXT LAB
      #1 if((ALUZero & Branch) | (Uncondbranch))begin
            NextPC = #2 CurrentPC + SignExtImm64;
       end
       else begin
            NextPC = #1 CurrentPC +4;
       end
       
       end
        
endmodule