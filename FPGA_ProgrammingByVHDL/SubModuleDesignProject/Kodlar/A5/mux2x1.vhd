library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2x1 is
  Port (
    a_i : in std_logic;
    b_i : in std_logic;
    s_i : in std_logic;
    q_o : out std_logic
  );
end mux2x1;

architecture Behavioral of mux2x1 is
begin
  process (a_i, b_i, s_i)
  begin
    if (s_i = '0') then
      q_o <= a_i;
    else
      q_o <= b_i;
    end if;
  end process;
end Behavioral;
