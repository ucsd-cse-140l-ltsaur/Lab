//
// Disclaimer:
//
//   This Verilog source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  
//
// --------------------------------------------------------------------
//           
//                     Lih-Feng Tsaur
//                     UCSD CSE Department
//                     9500 Gilman Dr, La Jolla, CA 92093
//                     U.S.A
//
// --------------------------------------------------------------------
//
// Revision History : 0.0
//---------------------------------------------------------------------
module fourbit_adder_tb();

reg [3:0] r1,r2;
reg  ci;
wire [3:0] result;
wire  carry;

// Drive the inputs
initial begin
  r1 = 0;
  r2 = 0;
  ci = 0;
  #10 r1 = 10;
  #10 r2 = 2;
  #10 ci = 1;
  #10 $display("+--------------------------------------------------------+");
  $finish;
end

// Connect the lower module
fourbit_adder UUT (result,carry,r1,r2,ci);

// Hier demo here
initial begin
  $display("+--------------------------------------------------------+");
  $display("|  r1  |  r2  |  ci  | u0.sum | u1.sum | u2.sum | u3.sum |");
  $display("+--------------------------------------------------------+");
  $monitor("|  %h   |  %h   |  %h   |    %h    |   %h   |   %h    |   %h    |",
  r1,r2,ci, fourbit_adder_tb.UUT.u0.sum, 
  fourbit_adder_tb.UUT.u1.sum, fourbit_adder_tb.UUT.u2.sum, 
  fourbit_adder_tb.UUT.u3.sum); 
end

endmodule