module semaforo(input clk, input rst, input bt,
	output reg [2:0] A, output reg [2:0] B);

	localparam Red = 3'b001, Yellow = 3'b010, Green = 3'b100;
	
	reg[3:0] count;
	reg aux = 0;

	always @(posedge bt) begin
		aux <= 1;
	end


	always @(posedge clk or posedge rst)
		if(rst == 1)
			begin
				count <= 0;
			end
		else
				begin
				case(A)
					A2: if(count < `VERDE)
								begin
									A <= Green;
									B <= Green;
									count <= count + 1;
								end
							else
								begin
									A <= Yellow;
									if(aux == 1) begin
										B <= Yellow;
										aux <= 0;
									end
									else begin
										B <= Green;
									end
									count <= 0;
								end
					A1: if(count < `AMARELO)
								begin
									A <= Yellow;
									if(A == B) begin
										B <= Yellow;
									end
									else begin
									B <= Green;
									end
									count <= count + 1;
								end
							else
								begin
									if(A == B) begin
										B <= Red;
									end
									else begin
									B <= Green;				
									A <= Red;
									count <= 0;
								end								
					A0: if(count < `VERMELHO)
									A <= Red
									if(A == B) begin
										B <= Red;
									end
									else begin
									B <= Green;
									end
									count <= count + 1;
								end
							else
								begin
									A <= Green;
									B <= Green;
									count <= 0;
								end
					
					default:
					begin
						A <= Green;
						B <= Green;
					end
				endcase

				end
			

endmodule