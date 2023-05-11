`timescale 1ns / 1ps

module BCDCounter(
        input enable, 
        input load, 
        input up, 
        input clr, 
        input [3:0] D, 
        input CLK, 
        output reg CO, 
        output reg [3:0] Q
    );
    
    always @ (posedge CLK) 
    begin 
        if (load == 1 && enable == 1) 
        begin 
            Q = D; // Q needs to be updated with blocking statements because we need the up-to-date value for CO evaluations
        end 
        else if (load == 0 && enable == 1 && up == 1)
        begin 
            // need to increment Q 
            if (Q == 9) 
            begin 
                Q = 0; 
            end
            else 
            begin 
                Q = Q + 1; 
            end 
        end  
        else if (load == 0 && enable == 1 && up == 0) 
        begin 
            // need to decrement counter 
            if (Q == 0) 
            begin 
                Q = 9; 
            end
            else
            begin
                Q = Q - 1; 
            end
        end 
        // now evaluate carry out, based on new value of Q: 
        if (enable == 1 && up == 1 && Q == 9) 
        begin 
            CO = 1; 
        end
        else if (enable == 1 && up == 0 && Q == 0) 
        begin 
            CO = 1; 
        end
        else 
        begin 
            CO = 0; 
        end
    end
    
    // should clear no matter what
    always @ (~clr)
    begin 
        Q = 4'b0000; 
    end
    
endmodule
