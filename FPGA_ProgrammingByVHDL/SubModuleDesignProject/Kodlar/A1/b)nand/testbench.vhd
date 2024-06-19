library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
end testbench;

architecture Behavioral of testbench is

  component nand_g is
    port (
      a, b : in STD_LOGIC;
      c : out STD_LOGIC
    );
  end component;

  signal a_s, b_s : STD_LOGIC := '0';
  signal c_s : STD_LOGIC;
begin

  uut : nand_g
    port map (
      a => a_s,
      b => b_s,
      c => c_s
    );
  stimulus_process : process
  begin
    a_s <= '0';
    b_s <= '0';
    wait for 2 ns;

    a_s <= '1';
    b_s <= '1';
    wait for 2 ns;

    a_s <= '1';
    b_s <= '0';
    wait for 2 ns;

    a_s <= '0';
    b_s <= '1';
    wait for 2 ns;

    wait;
  end process stimulus_process;

end Behavioral;
