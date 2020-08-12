`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.09.2018 14:04:33
// Design Name: 
// Module Name: DataMemory
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


module DataMemory(
    input [31:0] addr,
    input [31:0] writedata,
    output reg [31:0] readdata,
    input clk,
    input reset,
    input MemRead,
    input MemWrite
    );
    
       reg  [31:0] mem [0:255];       // For simulation
       integer i;           // Temporary variable
    
       initial
       begin
       //   Initial read-out
       readdata <= 0;
       //   Initial memory content for testing purpose
       for ( i = 0; i <= 255; i = i+1) begin
            mem[i] = i;
            end
       end
    
      //      Memory content is always fetched with positive edge clock
      always @(posedge clk)
      begin
      if(reset)
            for(i=0;i<32;i=i+1)
             mem[i] <=0;
      if(MemWrite==1)
            mem[addr] <= writedata;
      if(MemRead==1)
            readdata <= mem[addr];
      end
    
endmodule
