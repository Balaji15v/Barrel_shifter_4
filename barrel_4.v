module barrel_4(input [3:0] in,
                input [1:0] shift_amt,mode,
                output reg [3:0] out
    );
    always @(mode)begin
           case(mode)
                2'b00: case(shift_amt)//LLS
                           2'b00:out=in;
                           2'b01:out={in[2:0],1'b0};
                           2'b10:out={in[1:0],2'b00};
                           2'b11:out={in[0],3'b000};
                        endcase
                2'b01: case(shift_amt)//LRS
                           2'b00:out=in;
                           2'b01:out={1'b0,in[3:1]};
                           2'b10:out={2'b00,in[3:2]};
                           2'b11:out={3'b000,in[3]};
                        endcase
               2'b10: case(shift_amt)//RL
                           2'b00:out=in;
                           2'b01:out={in[2:0],in[3]};
                           2'b10:out={in[1:0],in[3:2]};
                           2'b11:out={in[0],in[3:1]};
                        endcase
              2'b11: case(shift_amt)//RR
                           2'b00:out=in;
                           2'b01:out={in[0],in[3:1]};
                           2'b10:out={in[1:0],in[3:2]};
                           2'b11:out={in[2:0],in[3]};
                        endcase
                        default:out=in;
           endcase
        end
endmodule
