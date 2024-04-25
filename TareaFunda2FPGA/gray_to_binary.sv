module gray_to_binary (
    input [2:0] gray_input,
    output reg [2:0] binary_output
);

    always @* begin
        case(gray_input)
            3'b000: binary_output = 3'b000;
            3'b001: binary_output = 3'b001;
            3'b011: binary_output = 3'b010;
            3'b010: binary_output = 3'b011;
            3'b110: binary_output = 3'b100;
            3'b111: binary_output = 3'b101;
            3'b101: binary_output = 3'b110;
            3'b100: binary_output = 3'b111;
            default: binary_output = 3'b000; 
        endcase
    end

endmodule