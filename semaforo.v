module semaforo(input clk, input rst, input bt,
	output reg [2:0] A, output reg [2:0] B);

	localparam Red = 3'b001, Yellow = 3'b010, Green = 3'b100;
	
	reg[3:0] count;
	reg aux = 0;

	always @(posedge bt) begin
		aux <= 1;
	end
	always @(negedge rst)
	begin
		A <= Green;
		B <= Green;
		count <= 0;
		aux <=0;
	end

	always @(posedge clk)
				begin
				case(A)
					Green: if(count < `VERDE)
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
					Yellow: if(count < `AMARELO)
								begin
									A <= Yellow;
									if(A == B) begin
										B <= Yellow;
										aux <= 0;
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
										aux <= 0;
									end
									else begin
									B <= Green;				
									end
									A <= Red;
									count <= 0;
								end								
					Red: if(count < `VERMELHO) begin
									A <= Red;
									if(A == B) begin
										B <= Red;
										aux <= 0;
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