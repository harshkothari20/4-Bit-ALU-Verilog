`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2026 22:47:51
// Design Name: 
// Module Name: alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module alu(
    input [3:0] a,
    input [3:0] b,
    input [2:0] opcode,
    output reg [3:0] y,
    output reg carry,
    output zero,
    output reg overflow
);

    reg [4:0] temp;

    always @(*) begin
        y = 4'b0000;
        carry = 1'b0;
        overflow = 1'b0;
        temp = 5'b00000;

        case(opcode)

            3'b000: begin 
                temp = a + b;
                y = temp[3:0];
                carry = temp[4];
                overflow = (a[3] == b[3]) && (y[3] != a[3]);
            end

            3'b001: begin 
                temp = a - b;
                y = temp[3:0];
                carry = (a < b);   
                overflow = (a[3] != b[3]) && (y[3] != a[3]);
            end

            3'b010: begin 
                y = a & b;
            end

            3'b011: begin 
                y = a | b;
            end

            3'b100: begin 
                y = a ^ b;
            end

            3'b101: begin 
                y = ~a;
            end

            3'b110: begin 
                y = {a[2:0], 1'b0};
                carry = a[3];
            end

            3'b111: begin 
                y = {1'b0, a[3:1]};
                carry = a[0];
            end

            default: begin
                y = 4'b0000;
                carry = 1'b0;
                overflow = 1'b0;
            end

        endcase
    end

    assign zero = (y == 4'b0000);

endmodule