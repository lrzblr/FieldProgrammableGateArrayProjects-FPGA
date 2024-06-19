library ieee;
use ieee.std_logic_1164.all;

entity xor_g is
  port (
    input1 : in std_logic;
    input2 : in std_logic;
    output : out std_logic
  );
end entity xor_g;

architecture Behavioral of xor_g is
begin
  output <= input1 xor input2;
end architecture Behavioral;
