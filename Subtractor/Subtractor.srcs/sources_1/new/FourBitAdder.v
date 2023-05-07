`timescale 1ns / 1ps

module FourBitAdder(
    input [3:0] A,
    input [3:0] B, 
    input Bin, 
    output [3:0] Sum, 
    output Bout 
    );
    
    wire b_out_1; 
    wire b_out_2; 
    wire b_out_3;  
    
    adder one (A[0], B[0], Bin, Sum[0], b_out_1); 
    adder two (A[1], B[1], b_out_1, Sum[1], b_out_2); 
    adder three (A[2], B[2], b_out_2, Sum[2], b_out_3); 
    adder four (A[3], B[3], b_out_3, Sum[3], Bout); 
    
endmodule
