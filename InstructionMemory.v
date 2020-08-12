`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.09.2018 12:42:56
// Design Name: 
// Module Name: InstructionMemory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module InstructionMemory(
    input [31:0] read_addr,
    output reg [31:0] instruction,
    input reset
    );
       integer i;
       reg [ 31 : 0 ] mem[0 :31 ] ;
       initial
       begin
       for(i=0;i<32;i=i+1)
            mem[i]=i;
       end
       always @(read_addr)
       begin
       if(reset)
       begin 
       for(i=0;i<32;i=i+1)
            mem[i] <=0;
       end
       else
       begin
       instruction <= mem[ read_addr ] ;
       end
       end
    
endmodule
