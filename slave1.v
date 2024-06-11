`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2024 16:58:33
// Design Name: 
// Module Name: slave1
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


module slave1(
         input PCLK,PRESETn,
         input PSEL,PENABLE,PWRITE,
         input [7:0]PADDR,PWDATA,
        output [7:0]PRDATA1,
        output reg PREADY );
    
     reg [7:0]reg_addr;
     reg [7:0] mem [0:63];

    assign PRDATA1 =  mem[reg_addr];

    always @(*)
       begin
         if(!PRESETn)
              PREADY = 0;
          else
	  if(PSEL && !PENABLE && !PWRITE)
	     begin PREADY = 0; end
	         
	  else if(PSEL && PENABLE && !PWRITE)
	     begin  PREADY = 1;
                    reg_addr =  PADDR; 
	       end
          else if(PSEL && !PENABLE && PWRITE)
	     begin  PREADY = 0; end

	  else if(PSEL && PENABLE && PWRITE)
	     begin  PREADY = 1;
	            mem[PADDR] = PWDATA; end

           else PREADY = 0;
        end
    endmodule
