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
module fourbit_adder (
sum           , // Output of the adder
carry         , // Carry output of adder
r1            , // first input
r2            , // second input
ci              // carry input
);

// Input Port Declarations       
input    [3:0]   r1         ;
input    [3:0]   r2         ;
input            ci         ;

// Output Port Declarations
output   [3:0]  sum         ;
output          carry       ;

// Port Wires
wire     [3:0]    r1        ;
wire     [3:0]    r2        ;
wire              ci        ;
wire     [3:0]    sum       ;
wire              carry     ;

// Internal variables
wire              c1        ;
wire              c2        ;
wire              c3        ;

// Code Starts Here
full_adder u0 (.a (r1[0]), .b (r2[0]), .c (ci), .sum (sum[0]), .carry (c1));
full_adder u1 (.a (r1[1]), .b (r2[1]), .c (c1), .sum (sum[1]), .carry (c2));
full_adder u2 (.a (r1[2]), .b (r2[2]), .c (c2), .sum (sum[2]), .carry (c3));
full_adder u3 (.a (r1[3]), .b (r2[3]), .c (c3), .sum (sum[3]), .carry (carry));

endmodule // End Of Module adder