`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.11.2025 02:17:47
// Design Name: 
// Module Name: reg_fd
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


module reg_fd (
    // Inputs
    input wire clk,
    input wire reset,
    input wire en,
    input wire clr,
    input wire [31:0] rd,
    input wire [31:0] pc_f,
    input wire [31:0] pcplus4_f,
    
    // Outputs
    output reg [31:0] instr_d,
    output reg [31:0] pc_d,
    output reg [31:0] pcplus4_d
);

    // Initialize outputs
    initial begin
        instr_d = 32'h00000013;    // NOP instruction (addi x0, x0, 0)
        pc_d = 32'h00000000;
        pcplus4_d = 32'h00000004;
    end

    always @(posedge clk) begin
        if (reset == 1'b1) begin
            // full reset of FD register
            instr_d   <= 32'b0;
            pc_d      <= 32'b0;
            pcplus4_d <= 32'b0;
        end
        else if (en == 1'b1) begin
            if (clr == 1'b1) begin
                // flush FD stage
                instr_d   <= 32'b0;
                pc_d      <= 32'b0;
                pcplus4_d <= 32'b0;
            end
            else begin
                // normal operation
                instr_d   <= rd;
                pc_d      <= pc_f;
                pcplus4_d <= pcplus4_f;
            end
        end
    end


endmodule