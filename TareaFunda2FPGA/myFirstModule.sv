module myFirstModule(input logic p, q, r,
	output logic a, b, c, motor,
	output [2:0] binario, 
	output [2:0] sensor,
	output [2:0] exceso3,
	output reg [6:0] gray_seg7,
	output reg [6:0] excess3_seg7,
	output reg [6:0] binary_seg7);

	assign a = (~p && r)||(q && ~r);

	assign b = ~r;

	assign c = ~((p ^ (q ^ r)));
	
	assign motor = ~(c ^ b) ;
	
	assign sensor = {p,q,r};
	assign exceso3 = {a,b,c};
	
	
	gray_to_binary binary (
        .gray_input(sensor),
        .binary_output(binario)
    );
	
	// Lógica para convertir el sensor binario en segmentos 7-segmento
	seg7_decoder seg7d_binary(binario, binary_seg7);
	seg7_decoder seg7d_gray(sensor, gray_seg7);
	seg7_decoder seg7d_exceso3(exceso3, excess3_seg7);


endmodule 