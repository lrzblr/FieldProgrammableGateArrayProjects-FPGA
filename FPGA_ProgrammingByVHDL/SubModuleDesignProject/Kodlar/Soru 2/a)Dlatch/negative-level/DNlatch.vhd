library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DNlatch is
  port (
    d, en : in STD_LOGIC;
    q, nq : out STD_LOGIC
  );
end DNlatch;

architecture Behavioral of DNlatch is
  component nand_g is
    port (
      a, b : in STD_LOGIC;
      c : out STD_LOGIC
    );
  end component;

  signal nand1_out, nand2_out : STD_LOGIC;
begin
  nand1 : nand_g
    port map (
      a => d,
      b => en,
      c => nand1_out
    );

  nand2 : nand_g
    port map (
      a => nand1_out,
      b => not en,
      c => nand2_out
    );

  q <= nand2_out;
  nq <= not nand2_out;
end Behavioral;
