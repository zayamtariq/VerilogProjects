`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2023 10:15:57 PM
// Design Name: 
// Module Name: FourBitSubtractor
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


module FourBitSubtractor(
    input [3:0] A,
    input [3:0] B, 
    input Bin, 
    output [3:0] Diff, 
    output Bout 
    );
    
    wire b_out_1; 
    wire b_out_2; 
    wire b_out_3; 
    
    subtractor one ( .a(A[0]), .b(B[0]), .b_in(Bin), .diff(Diff[0]), .b_out(b_out_1));
    subtractor two ( .a(A[1]), .b(B[1]), .b_in(b_out_1), .diff(Diff[1]), .b_out(b_out_2));
    subtractor three ( .a(A[2]), .b(B[2]), .b_in(b_out_2), .diff(Diff[2]), .b_out(b_out_3));
    subtractor four ( .a(A[3]), .b(B[3]), .b_in(b_out_3), .diff(Diff[3]), .b_out(Bout));
    
endmodule
