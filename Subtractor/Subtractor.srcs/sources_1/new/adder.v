`timescale 1ns / 1ps

module adder(
        input a, 
        input b, 
        input b_in, 
        output sum, 
        output c_out
    );
    
    assign sum = a ^ b ^ b_in; 
    assign c_out = (a & b) | (b & b_in) | (a & b_in); 
    
endmodule
