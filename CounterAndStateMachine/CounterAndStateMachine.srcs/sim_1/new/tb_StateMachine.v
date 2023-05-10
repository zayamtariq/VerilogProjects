`timescale 1ns / 1ps

module tb_StateMachine();

// define inputs as registers 
// why does this make sense to do? 
reg X; 
reg clk; 

// and define outputs as wires
wire S; 
wire V; 

initial begin 
    clk = 0; 
    X = 1;
    forever 
    #5 clk = ~clk; 
end 

StateMachine inst_StateMachine( 
    .X(X), 
    .CLK(clk), 
    .S(S), 
    .V(V) 
); 

endmodule
