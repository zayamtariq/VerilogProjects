`timescale 1ns / 1ps

module ALU(
        input [3:0] A, 
        input [3:0] B, 
        input b_in,
        input [2:0] control,  
        output [3:0] out, 
        output c_out
    );
    
    always @* begin // the @* indicates that block updates whenever any input (signal) changes 
    case (control)
        3'b000: FourBitAdder(A, B, b_in, out, c_out); 
        3'b001: FourBitSubtractor(A, B, b_in, out, c_out); 
        3'b010: FourBitBitwiseOr(A, B, b_in, out, c_out); 
        3'b011: FourBitBitwiseAnd(A, B, b_in, out, c_out); 
        3'b100: ShiftLeft(A, B, b_in, out, c_out); 
        3'b101: ShiftRight(A, B, b_in, out, c_out); 
        3'b110: RollShiftLeft(A, B, b_in, out, c_out); 
        3'b111: RollShiftRight(A, B, b_in, out, c_out); 
    endcase 
    end
endmodule
