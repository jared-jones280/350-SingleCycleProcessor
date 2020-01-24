module ALUControl(ALUCtrl, ALUop, Opcode); 
     input [1:0] ALUop; 
     input [10:0] Opcode; 
     output reg[3:0] ALUCtrl; 
     /* write your code here */
     always @(*)begin 
     if(ALUop == 2'b00)begin
        ALUCtrl <= #2 4'b0010;end
     if(ALUop == 2'b01)begin   
        ALUCtrl <= #2 4'b0111;end
     if(ALUop == 2'b10)begin
        if(Opcode == 11'b10001011000)
            ALUCtrl <= #2 4'b0010;
        if(Opcode == 11'b11001011000)
            ALUCtrl <= #2 4'b0110;
        if(Opcode == 11'b10001010000)
            ALUCtrl <= #2 4'b0000;
        if(Opcode == 11'b10101010000)
            ALUCtrl <= #2 4'b0001;
     end
    end 
endmodule