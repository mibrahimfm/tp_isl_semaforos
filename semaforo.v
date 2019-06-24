module semaforo(input clk, input rst, input bt,
	output reg [2:0] A, output reg [2:0] B);

	localparam A0 = 3'b001, A1 = 3'b010, A2 = 3'b100;
	localparam B0 = 3'b001, B1 = 3'b010, B2 = 3'b100;	

	reg[3:0] count;
	reg aux = 0;

	always @(posedge clk or posedge rst)
		if(rst == 1)
			begin
				count <= 0;
			end
		else
		if(bt == 1)
		begin
			aux <= 1;
		end

		else
			if(aux == 0 || (A == A0 && count == `VERMELHO))
				begin
				case(A)
					A2: if(count < `VERDE)
								begin
									A <= A2;
									B <= B2;
									count <= count + 1;
								end
							else
								begin
									A <= A1;
									B <= B2;
									count <= 0;
								end
					A1: if(count < `AMARELO)
								begin
									A <= A1;
									B <= B2;
									count <= count + 1;
								end
							else
								begin
									A <= A0;
									B <= B2;
									count <= 0;
								end								
					A0: if(count < `VERMELHO)
								begin
									A <= A0;
									B <= B2;
									count <= count + 1;
								end
							else
								begin
									A <= A2;
									B <= B2;
									count <= 0;
								end
					
					default:
					begin
						A <= A2;
						B <= B2;
					end
				endcase

				end
				else begin
					case(A)
						A2: if(count < `VERDE)
									begin
										A <= A2;
										B <= B2;
										count <= count + 1;
									end
								else
									begin
										A <= A1;
										B <= B1;
										count <= 0;
									end
						A1: if(count < `AMARELO)
									begin
										A <= A1;
										B <= B1;
										count <= count + 1;
									end
								else
									begin
										A <= A0;
										B = B0;
										count <= 0;
									end								
						A0: if(count < `VERMELHO)
									begin
										A <= A0;
										B = B0;
										count <= count + 1;
									end
								else
									begin
										A <= A2;
										B <= B2;
										count <= 0;
										aux = 0;
									end
						default: 
						begin
							A <= A2; 
							B <= B2;
						end
					endcase									
		end
					
		// always @(*)
		// begin
		// 	if(bt == 1)
		// 		begin
		// 			case(A)
		// 				A0: begin A <= 3'b001; B <= 3'b001; end
		// 				A1: begin A <= 3'b010; B <= 3'b010; end
		// 				A2: begin A <= 3'b100; B <= 3'b100; end
		// 				//default: begin A <=  3'b100; B <= 3'b100; end
		// 			endcase
		// 		end
		// 	else
		// 			begin
		// 			case(A)
		// 				A0: begin A <= 3'b001; B <= 3'b100; end
		// 				A1: begin A <= 3'b010; B <= 3'b100; end
		// 				A2: begin A <= 3'b100; B <= 3'b100; end
		// 				//default: begin A <=  3'b100; B <= 3'b001; end
		// 			endcase
		// 			end
		// 		end
			

endmodule