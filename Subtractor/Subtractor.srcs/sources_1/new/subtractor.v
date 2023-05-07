`timescale 1ns / 1ps

// the goal is to write a 1 bit full subtractor using LOGIC EQUATIONS 
module subtractor(
        input a, 
        input b, 
        input b_in, 
        output diff, 
        output b_out
    );
    // and now we can write our code here 
    assign diff = (~a & b & ~b_in) | (a & ~b & ~b_in) | (~a & ~b & b_in) | (a & b & b_in); 
    assign b_out = (~a & b) | (~a & b_in) | (b & b_in); 
endmodule
