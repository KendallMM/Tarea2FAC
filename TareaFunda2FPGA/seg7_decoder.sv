module seg7_decoder (
    input [2:0] number,
    output reg [6:0] segments
);

always @*
    case (number)
        3'b000: segments = 7'b1000000; // 0
        3'b001: segments = 7'b1111001; // 1
        3'b010: segments = 7'b0100100; // 2
        3'b011: segments = 7'b0110000; // 3
        3'b100: segments = 7'b0011001; // 4
        3'b101: segments = 7'b0010010; // 5
        3'b110: segments = 7'b0000010; // 6
        3'b111: segments = 7'b1111000; // 7
        default: segments = 7'b1111111; // No se utiliza, todos los segmentos apagados
    endcase

endmodule