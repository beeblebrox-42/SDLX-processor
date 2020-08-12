`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.09.2018 18:12:01
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile(
    input [4:0] readaddr1,
    input [4:0] readaddr2,
    input [4:0] writeaddr,
    output reg [31:0] readdata1,
    output reg [31:0] readdata2,
    input [31:0] writedata,
    input RegWrite,
    input clk,
    input reset
    );
    
    reg [31:0] mem[0:31];   // 32 32-bit registers
    integer i;
    
    initial
    begin
        //  Initial registers for testing purpose
        for ( i = 0; i <= 31; i = i+1)
            mem[i] = 0;
        //  Initial start-up
        readdata1 = 0;
        readdata2 = 0;
    end
    
    //      Data from register is always fetched with positive edge clock
    always @(posedge clk)
    begin
        if(reset)
        begin
        for(i=0;i<32;i=i+1)
               mem[i] <=0;
        end
        if (RegWrite == 0)
        begin
        #1 readdata1 = mem[readaddr1];
        #1 readdata2 = mem[readaddr2];
        end
        if ( RegWrite == 1)
            #1 mem[writeaddr] <= writedata;
    end
    
endmodule
