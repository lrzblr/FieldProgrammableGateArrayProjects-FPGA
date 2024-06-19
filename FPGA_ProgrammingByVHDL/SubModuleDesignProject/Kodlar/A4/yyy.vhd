library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity yyy is
    port (
        A, B, C, D: in STD_LOGIC;
        Cikis: out STD_LOGIC
    );
end entity yyy;

architecture Behavioral of yyy is
begin
    Cikis <= (A and B) or (C and D);
end architecture Behavioral;
