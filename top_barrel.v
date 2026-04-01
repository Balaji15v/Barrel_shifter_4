module top_barrel(input[7:0] sw,
                  output[6:0] seg,
                  output [3:0] an
    );
    wire [3:0] result;
    barrel_4 (.in(sw[3:0]),.mode(sw[5:4]),.shift_amt(sw[7:6]),.out(result));
    seg_7 (.hex(result),.seg(seg));
    assign an=4'b1110;
endmodule
