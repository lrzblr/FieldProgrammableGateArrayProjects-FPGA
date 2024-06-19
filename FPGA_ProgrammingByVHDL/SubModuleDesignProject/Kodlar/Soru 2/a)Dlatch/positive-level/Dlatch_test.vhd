library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Dlatch_test is
end Dlatch_test;

architecture Behavioral of Dlatch_test is

  component Dlatch is
    port (
      D, Clk : in STD_LOGIC;
      Q : out STD_LOGIC
    );
  end component;

  signal D_s, Clk_s : STD_LOGIC := '0';
  signal Q_s : STD_LOGIC;

  constant clk_period : time := 2 ns;

begin

  uut : Dlatch
    port map (
      D => D_s,
      Clk => Clk_s,
      Q => Q_s
    );

  clock_process : process
  begin
    Clk_s <= '1';
    wait for clk_period/2;
    Clk_s <= '0';
    wait for clk_period/2;
  end process clock_process;

  stimulus_process : process
  begin
    D_s <= '0';
    wait for clk_period;
    D_s <= '1';
    wait for clk_period;
    D_s <= '1';
    wait for clk_period;
    D_s <= '0';
    wait for clk_period;
    wait for clk_period;
    D_s <= '1';
    wait for clk_period;
    wait;
  end process stimulus_process;

end Behavioral;
