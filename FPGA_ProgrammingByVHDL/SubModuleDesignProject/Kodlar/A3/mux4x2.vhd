library IEEE;
use IEEE.std_logic_1164.all;
entity mux4x2 is
port(
  a0      : in  std_logic;
  a1      : in  std_logic;
  a2      : in  std_logic;
  a3      : in  std_logic;
  sel0     : in  std_logic;
  sel1      :in std_logic;
  b       : out std_logic);
end mux4x2;
architecture behavioral of mux4x2 is

begin
  b <= a0 when (sel0 = '0' and sel1 ='0') else
       a1 when (sel0 = '1' and sel1 ='0') else
       a2 when (sel0 = '0' and sel1 ='1') else
       a3 when (sel0 = '1' and sel1 ='1') ;
end behavioral;