`timescale 1ns / 1ps

module pc (
    input wire [31:0] PCNext,
    input wire clk,
    input wire reset,
    input wire en,
    output reg [31:0] PC_cur
);

    always @(posedge clk or posedge reset) begin
        if (reset == 1'b1) begin
            PC_cur <= 32'b0;
            $display("PC: reset asserted -> PC_cur <= 0 at time=%0t", $time);
        end
        else if (en == 1'b1) begin
            PC_cur <= PCNext;
                    $display("PC: posedge -> en=1 PCNext=%h -> PC_cur <= %h at time=%0t", PCNext, PCNext, $time);
         end
        else  begin
            $display("PC: posedge -> en=0, PC_cur remains %h at time=%0t", PC_cur, $time);
        end
        
    end

endmodule