library IEEE;
use IEEE.std_logic_1164.all;
entity mux8x3 is
port(
  b0      : in  std_logic;
  b1      : in  std_logic;
  b2      : in  std_logic;
  b3      : in  std_logic;
  b4      : in  std_logic;
  b5      : in  std_logic;
  b6      : in  std_logic;
  b7      : in  std_logic;
  sel0    : in  std_logic;
  sel1      :in std_logic;
  sel2      :in std_logic;
  m_out  : out std_logic);
end mux8x3;
architecture behavioral of mux8x3 is
 
begin
  m_out <= b0 when (sel2 = '0' and sel1 ='0' and sel0 ='0') else
            b1 when (sel2 = '0' and sel1 ='0' and sel0 ='1') else
            b2 when (sel2 = '0' and sel1 ='1' and sel0 ='0') else
            b3 when (sel2 = '0' and sel1 ='1' and sel0 ='1') else
            b4 when (sel2 = '1' and sel1 ='0' and sel0 ='0') else
            b5 when (sel2 = '1' and sel1 ='0' and sel0 ='1') else
            b6 when (sel2 = '1' and sel1 ='1' and sel0 ='0') else
            b7 when (sel2 = '1' and sel1 ='1' and sel0 ='1') ;
end behavioral;