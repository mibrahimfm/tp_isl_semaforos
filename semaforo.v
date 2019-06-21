module semaforo(input clk, input rst, input bt,
	output reg [2:0] A, output reg [2:0] B);

	`define VERDE 8'd1
	`define AMARELO 8'd3
	`define VERMELHO 8'd2

	localparam A0 = 3'b001,
						  A1 = 3'b010,
						  A2 = 3'b100,
	localparam B0 = 3'b001,
						  B1 = 3'b010,
						  B2 = 3'b100,	
						  

	reg[3:0] count;

	always @(posedge clk or posedge rst)
				if(rst == 1)
					begin
						A <= A0;

						count <= 0;
					end
				else
					if(bt == 1)
						begin
						case(A)
							A0: if(count < VERDE)
										begin
											A <= A0;
											B <= B0;
											count <= count + 1;
										end
									else
										begin
											A <= A1;
											B <= B1
											count <= 0;
										end
							A1: if(count < AMARELO)
										begin
											A <= A1;
											B <= B1;
											count <= count + 1;
										end
									else
										begin
											A <= A2;
											B <= B2;
											count <= 0;
										end								
							S2: if(count < VERMELHO)
										begin
											A <= A2;
											B  <= B2;
											count <= count + 1;
										end
									else
										begin
											A <= A0;
											B <= B0;
											count <= 0;
										end
							default A <= A0; B <= B0;
						endcase							
						end
					else
						case(A)
							A0: if(count < VERDE)
										begin
											A <= A0;
											B <= B0;
											count <= count + 1;
										end
									else
										begin
											A <= A1;
											b <= B0;
											count <= 0;
										end
							A1: if(count < AMARELO)
										begin
											A <= A1;
											B <= B0;
											count <= count + 1;
										end
									else
										begin
											A <= A2;
											B <= B0;
											count <= 0;
										end								
							S2: if(count < VERMELHO)
										begin
											A <= A2;
											B  <= B0;
											count <= count + 1;
										end
									else
										begin
											A <= A0;
											B <= B0;
											count <= 0;
										end
							
							default A <= A0; B <= B0;
						endcase

endmodule
