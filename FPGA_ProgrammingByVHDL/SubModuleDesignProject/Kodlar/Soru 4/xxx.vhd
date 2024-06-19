library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity xxx is
    port (
        A: in STD_LOGIC;
        Cikis: out STD_LOGIC
    );
end entity xxx;

architecture Behavioral of xxx is
begin
    Cikis <= A;
end architecture Behavioral;
