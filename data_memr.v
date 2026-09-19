`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.11.2025 00:14:50
// Design Name: 
// Module Name: data_memr
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


module data_memr #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 32
)(
    input wire clk,
    input wire memwrite_m,
    input wire [ADDR_WIDTH-1:0] rw_addr,
    input wire [DATA_WIDTH-1:0] w_data,
    output reg [DATA_WIDTH-1:0] read_data_m
);

    // RAM array - 1024 words (match instruction memory)
    reg [DATA_WIDTH-1:0] ram [0:1023];

    integer i;
    initial begin
        // Initialize RAM from the .mem file
        $readmemh("hazard_test.mem", ram);

        $display("DATA MEM: [0] = %h", ram[0]);
        $display("DATA MEM: [1] = %h", ram[1]);
        $display("DATA MEM: [2] = %h", ram[2]);
        $display("DATA MEM: [3] = %h", ram[3]);
    end

    // Write on clock
    always @(posedge clk) begin
        if (memwrite_m)
            ram[rw_addr[31:2]] <= w_data;
    end

    // Combinational read
    always @(*) begin
        read_data_m = ram[rw_addr[31:2]];
    end

endmodule
