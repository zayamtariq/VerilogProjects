`timescale 1ns / 1ps

module StateMachine(
        input X,
        input CLK, 
        output reg S, 
        output reg V 
    );
    
    reg [2:0] State; 
    reg [2:0] NextState; 
    
    initial 
    begin 
        State = 0;
        NextState = 0; 
    end
    
    always @(State or X) // we're saying update Z/NS whenever CS or X changes 
    begin 
    // switch between state, and then from there two cases of X == 0 and X == 1 
    case(State) 
    0: 
    begin 
                if(X == 1'b0)
                begin 
                    S = 1; 
                    V = 0; 
                    NextState = 1; 
                end 
                else 
                begin 
                    S = 0; 
                    V = 0; 
                    NextState = 2; 
                end 
    end 
    1: 
    begin 
                if(X == 1'b0)
                begin 
                    S = 1; 
                    V = 0; 
                    NextState = 3; 
                end 
                else 
                begin 
                    S = 0; 
                    V = 0; 
                    NextState = 4; 
                end 
    end
    2: 
    begin 
                if(X == 1'b0)
                begin 
                    S = 0; 
                    V = 0; 
                    NextState = 4; 
                end 
                else 
                begin 
                    S = 1; 
                    V = 0; 
                    NextState = 4; 
                end 
    end
    3: 
    begin 
                if(X == 1'b0)
                begin 
                    S = 0; 
                    V = 0; 
                    NextState = 5; 
                end 
                else 
                begin 
                    S = 1; 
                    V = 0; 
                    NextState = 5; 
                end 
    end 
    4: 
    begin 
                if(X == 1'b0)
                begin 
                    S = 1; 
                    V = 0; 
                    NextState = 6; 
                end 
                else 
                begin 
                    S = 0; 
                    V = 0; 
                    NextState = 6; 
                end 
    end
    5: 
    begin 
                if(X == 1'b0)
                begin 
                    S = 0; 
                    V = 0; 
                    NextState = 0; 
                end 
                else 
                begin 
                    S = 1; 
                    V = 0; 
                    NextState = 0; 
                end 
    end
    6: 
    begin 
                if(X == 1'b0)
                begin 
                    S = 1; 
                    V = 0; 
                    NextState = 0; 
                end 
                else 
                begin 
                    S = 0; 
                    V = 1; 
                    NextState = 0; 
                end 
    end
    default: begin 
    // should never happen, if fsm implemented correctly 
    end 
    endcase 
    end 
    
    always @(negedge CLK) // state register 
    begin 
        State <= NextState; // the state register is the thing affected by the changing of the clock
    end 
    
    
endmodule
