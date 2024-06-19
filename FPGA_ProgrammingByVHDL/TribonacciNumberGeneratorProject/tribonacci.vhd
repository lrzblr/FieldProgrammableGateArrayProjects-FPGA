library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith;

ENTITY tribonacci IS
GENERIC (N: INTEGER := 16);
PORT (clk, rst : IN BIT;
tribo_series : OUT INTEGER RANGE 0 TO 2**N-1);
END tribonacci;

ARCHITECTURE tribonacci OF tribonacci IS
SIGNAL a,b,c,d: INTEGER RANGE 0 TO 2**N-1;
BEGIN
PROCESS (clk,rst)
BEGIN
IF (rst='1') THEN
   b <= 1;
   c <= 1;
   d <= 0;
ELSIF (clk'EVENT AND clk='1') THEN
d <= c;
c <= b;
b <= a;

END IF;
a <= b +c +d ;
END PROCESS;
tribo_series <= d;

end tribonacci;
