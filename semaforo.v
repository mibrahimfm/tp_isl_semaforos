module semaforo(input clk, input rst, input bt,
	output reg [2:0] A, output reg [2:0] B);

	reg[4:0] state;
	localparam S0 = 5'b00001,
						  S1 = 5'b00010,
						  S2 = 5'b00100,
						  S3 = 5'b01000,
						  S4 = 5'b10000;

	reg[3:0] count;

	localparam SEC5 = 4'd5,
						  SEC1 = 4'd1;

	always @(posedge clk or posedge rst)
				if(rst == 1)
					begin
						state <= S0;
						count <= 0;
					end
				else
					case(state)
						S0: if(count < SEC5)
									begin
										state <= S0;
										count <= count + 1;
									end
								else
									begin
										state <= S1;
										count <= 0;
									end

	//Insira seu codigo aqui
endmodule
