`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2023 05:48:28 PM
// Design Name: 
// Module Name: tb_BCDCounter
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


module tb_BCDCounter();

// define inputs as registers 
reg enable; 
reg load; 
reg up; 
reg clr; 
reg [3:0] D; 
reg clk; 

// define outputs as wires 
wire CO; 
wire [3:0] Q; 

initial begin 
    clk = 0; 
    clr = 1; 
    D = 6; 
    enable = 0; 
    load = 0; 
    up = 0; 
    
    forever begin 
        #5 clk = ~clk; 
    end 
    
    // lets load the value 6 in  
    load = 1; 
    enable = 1;  
    
    #10 
    
    // then lets increment the counter four times 
    load = 0; 
    enable = 1; 
    up = 1; 
    
    #40 // wait 40 ns because we're incrementing 4 times, clk rises every 10 ns 
    
    // then lets decrement the counter once 
    load = 0; 
    enable = 1; 
    up = 0; 
    
    #10 
    
    // finally, clear the counter 
    clr = 0; 
    
end 

BCDCounter inst_BCDCounter( 
    .enable(enable), 
    .load(load), 
    .up(up), 
    .clr(clr), 
    .D(D), 
    .CLK(clk), 
    .CO(CO), 
    .Q(Q) 
);

endmodule
