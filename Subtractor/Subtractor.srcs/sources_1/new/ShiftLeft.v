`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2023 03:37:57 AM
// Design Name: 
// Module Name: ShiftLeft
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


module ShiftLeft(
        input [3:0] A, 
        input [3:0] B, 
        input b_in, 
        output [3:0] out, 
        output c_out
    );
    
    assign out[3] = A[2]; 
    assign out[2] = A[1]; 
    assign out[1] = A[0]; 
    assign out[0] = 0; 
    
    assign c_out = 0; 
    
endmodule
