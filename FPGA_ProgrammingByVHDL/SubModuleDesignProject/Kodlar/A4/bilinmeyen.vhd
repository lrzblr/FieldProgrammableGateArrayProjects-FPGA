library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity bilinmeyen is
    port (
        SEC, A, B: in STD_LOGIC;
        Cikis: out STD_LOGIC
    );
end entity bilinmeyen;

architecture mimari of bilinmeyen is
    component xxx
        port (
            A: in STD_LOGIC;
            Cikis: out STD_LOGIC
        );
    end component xxx;

    component yyy
        port (
            A, B, C, D: in STD_LOGIC;
            Cikis: out STD_LOGIC
        );
    end component yyy;

    signal kablo: STD_LOGIC;
begin
    G1: xxx port map (SEC, kablo);
    G2: yyy port map (SEC, A, kablo, B, Cikis);
end architecture mimari;
