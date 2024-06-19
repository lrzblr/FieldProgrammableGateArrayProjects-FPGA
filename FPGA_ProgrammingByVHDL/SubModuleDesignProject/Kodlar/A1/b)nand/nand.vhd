library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nand_g is
  port (
    a, b : in STD_LOGIC;
    c : out STD_LOGIC
  );
end nand_g;

architecture Behavioral of nand_g is
begin
  c <= not (a and b);
end Behavioral;