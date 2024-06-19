library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DNlatch_test is
end DNlatch_test;

architecture Behavioral of DNlatch_test is
  component DNlatch is
    port (
      d, en : in STD_LOGIC;
      q, nq : out STD_LOGIC
    );
  end component;

  signal d_s, en_s, q_s, nq_s : STD_LOGIC;

begin
    uut: DNlatch
    port map (
      d => d_s,
      en => en_s,
      q => q_s,
      nq => nq_s
    );
  stimulus: process
  begin
    d_s <= '0';
    en_s <= '0';
    wait for 2 ns;
    d_s <= '1';
    en_s <= '1';
    wait for 2 ns;
    d_s <= '1';
    en_s <= '0';
    wait for 2 ns;
    d_s <= '0';
    en_s <= '0';
    wait for 2 ns;
    d_s <= '1';
    en_s <= '0';
    wait for 2 ns;
    d_s <= '0';
    en_s <= '1';
    wait for 2 ns;
    d_s <= '1';
    en_s <= '1';
    wait for 2 ns;
    wait;
  end process;
  assert_process: process
  begin
    wait for 20 ns;
    wait;
  end process;
end Behavioral;
