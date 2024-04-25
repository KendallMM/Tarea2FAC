module myFirstModule_tb();

	logic p;
	logic q;
	logic r;
	logic a;
	logic b;
	logic c;
	logic motor;
	logic [2:0] binario;
	logic [2:0] sensor;
	logic [2:0] exceso3;
	logic [6:0] excess3_seg7;
	logic [6:0] gray_seg7;
	logic [6:0] binary_seg7;
	
	myFirstModule dut(
	.a(a),
	.b(b),
	.c(c),
	.p(p),
	.q(q),
	.r(r),
	.motor(motor),
	.sensor(sensor),
	.exceso3(exceso3),
	.binario(binario),
	.binary_seg7(binary_seg7),
	.gray_seg7(gray_seg7),
	.excess3_seg7(excess3_seg7));
	
	initial begin
		p = 0; // Sensor en 0
		q = 0;
		r = 0;
		#10; // Esperar 10 unidades de tiempo
		p = 0; // Cambiar sensor a 3
		q = 1;
		r = 1;
		#10; // Esperar 10 unidades de tiempo
		p = 1; // Cambiar sensor a 6
		q = 1;
		r = 0;
		#10; // Esperar 10 unidades de tiempo
		p = 1; // Cambiar sensor a 1
		q = 0;
		r = 0;
		#10; // Esperar 10 unidades de tiempo
		p = 1; // Cambiar sensor a 7
		q = 1;
		r = 1;
		#10; // Esperar 10 unidades de tiempo
		$finish; // Finalizar la simulación
end
endmodule
