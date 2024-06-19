library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Dlatch is
  port (
    D, Clk : in STD_LOGIC;
    Q : out STD_LOGIC
  );
end Dlatch;

architecture Behavioral of Dlatch is
  signal NQ : STD_LOGIC;
begin
  NAND1: entity work.nand_g
    port map (
      a => D,
      b => Clk,
      c => NQ
    );

  NAND2: entity work.nand_g
    port map (
      a => NQ,
      b => Clk,
      c => Q
    );
end Behavioral;
