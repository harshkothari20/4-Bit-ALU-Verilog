`timescale 1ns / 1ps

module alu_tb;
    reg [3:0] a, b;
    reg [2:0] opcode;
    wire [3:0] y;
    wire carry;
    wire zero;
    wire overflow;

    alu uut (
        .a(a),
        .b(b),
        .opcode(opcode),
        .y(y),
        .carry(carry),
        .zero(zero),
        .overflow(overflow)
    );

    initial begin
        a = 4'b0101; b = 4'b0011; opcode = 3'b000;
        #10;
        a = 4'b1111; b = 4'b0001; opcode = 3'b000;
        #10;
        a = 4'b0101; b = 4'b0101; opcode = 3'b001;
        #10;
        a = 4'b0010; b = 4'b0101; opcode = 3'b001;
        #10;
        a = 4'b1010; b = 4'b1100; opcode = 3'b010;
        #10;
        a = 4'b1010; b = 4'b1100; opcode = 3'b011;
        #10;
        a = 4'b1010; b = 4'b1100; opcode = 3'b100;
        #10;
        a = 4'b1010; b = 4'b0000; opcode = 3'b101;
        #10;
        a = 4'b0011; b = 4'b0000; opcode = 3'b110;
        #10;
        a = 4'b1000; b = 4'b0000; opcode = 3'b111;
        #10;
        a = 4'b0111; b = 4'b0011; opcode = 3'b000;
        #10;
        a = 4'b0111; b = 4'b1001; opcode = 3'b001;
        #10;

        $stop;
    end

endmodule
