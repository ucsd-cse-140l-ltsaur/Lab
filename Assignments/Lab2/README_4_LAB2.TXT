In this assignment, you are asked to implement a module, named Lab2_140L with the following interface. Lab2_140L module is referred by UART Wrapper module that provides the input signals.  UART Wrapper module also reads the output signals from Lab2_140L.  User is using terminal software running on PC to type in the instructions to the HW logic.  The syntax is Number1 Number2 + or Number1 Number2 -, e.g. 1+9 is represented as 19+ and 3-8 is represented as 38-.  Both Number1 and Number2 are 4-bit binary numbers chosen between 0000 and 1111.  The letters input by the terminal software is translated to the 4-bit binary numbers based on the following mapping table.
0000 <= '0'
0001 <= '1'
0010 <= '2'
0011 <= '3'
0100 <= '4'
0101 <= '5'
0110 <= '6'
0111 <= '7'
1000 <= '8'
1001 <= '9'
1010 <= ':'
1011 <= ';'
1100 <= '<'
1101 <= '='
1110 <= '>'
1111 <= '?'

From Number1 and Number2 and operator, the digital hardware logic gnerates a 4-bit sum and a 1-bit carry.  The 4-bit sum, (sum[3], sum[2] sum[1], sum[0]) is displayed by LED4, LED3, LED2, LED1 on the iCEstick Dev. Kit.  If sum[x] is a binary 1, LEDx will be turned on; otherwise LEDx will be turned off.  In addition, the hardwar logic can generate a pulse when the result is ready and UART wrapper module will output the result to the terminal software's screen.  The 5-bit results (1-bit carry and sum[3:0]) is mapped to letters based on the following table
00000 <= '0'
00001 <= '1'
00010 <= '2'
00011 <= '3'
00100 <= '4'
00101 <= '5'
00110 <= '6'
00111 <= '7'
01000 <= '8'
01001 <= '9'
01010 <= ':'
01011 <= ';'
01100 <= '<'
01101 <= '='
01110 <= '>'
01111 <= '?'
10000 <= '0'
10001 <= '1'
10010 <= '2'
10011 <= '3'
10100 <= '4'
10101 <= '5'
10110 <= '6'
10111 <= '7'
11000 <= '8'
11001 <= '9'
11010 <= ':'
11011 <= ';'
11100 <= '<'
11101 <= '='
11110 <= '>'
11111 <= '?'


This assignment contributes 10 points toward the final grade.  The distribution of 10 points is based on the complexity of thw code implemented and is distributed as the following: 
  60% -- Add 4 bits i_r1[3:0] and i_r2[3:0] and store the 4-bit sum to o_sum[3:0] and 1-bit carry to o_cout. AND use o_debug_led [3:0] to displace o_sum[3:0]; AND use o_debug_led[4] to displace o_cout.
  20% -- When i_substrate_signal is high,  o_sum[3:0]  = i_r1[3:0] - i_r2[3:0]. AND use o_debug_led [3:0] to displace o_sum[3:0]; AND use o_debug_led[4] to displace o_cout.  Otherwise, o_sum[3:0]  = i_r1[3:0] + i_r2[3:0].
  10% -- Generate a pulse when the result is ready to signal the wrapper module to output the 4-bit sum and 1-bit carry to terminal screen on PC.
  10% -- define 

module Lab2_140L (
 input wire i_rst           , // reset signal (active high)
 input wire i_clk_in          , //for internal state machine
 input wire i_data_rdy        , //r1, r2, OP are ready  
 input wire i_ctrl_signal     , 
 input wire i_substrate_signal,
 input wire [7:0] i_r1           , // 8bit number 1
 input wire [7:0] i_r2           , // 8bit number 1
 input wire i_cin           , // carry in
 input wire [7:0] i_ctrl         , // input ctrl char
 output wire [3:0] o_sum    ,
 output wire o_cout         ,
 output wire o_rdy          , //pulse
 output wire o_debug_test1  ,
 output wire o_debug_test2  ,
 output wire o_debug_test3  ,
 output wire [7:0] o_debug_led   
);
