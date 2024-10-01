`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2024 03:07:22 PM
// Design Name: 
// Module Name: multi_seg_drive_tb
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


module multi_seg_drive_tb();
wire[3:0] sseg_a_o;
wire[6:0] sseg_c_o;
reg[15:0] bcd_in;
reg clk;

multi_seg_drive uut(clk, bcd_in, sseg_a_o, sseg_c_o);

    always
    begin
        #5 clk = ~clk;
    end
    
    /*initial begin
        clk = 0;
        
        #10
        bcd_in = 16'b0001100010010010;
        #40;
        bcd_in = 16'b0001100010010000;
        #40;
        bcd_in = 16'b0010100010010001;
        #40;
        bcd_in = 16'b0001100010010010;
        #40;
        
        #100;
        
        $finish;
    end */
    integer i;
    initial 
    begin
        clk = 0;
        bcd_in = 0;
        for(i = 0; i < 16; i=i+1)
        begin
            bcd_in[i] = 1;
            
            if (i>0)
            begin
               bcd_in[i-1] = 0;
            end
            #10;
        end
    end
    
endmodule
