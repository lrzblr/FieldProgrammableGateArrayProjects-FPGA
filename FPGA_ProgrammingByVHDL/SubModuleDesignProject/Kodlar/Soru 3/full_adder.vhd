library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           ci : in STD_LOGIC;
           s : out STD_LOGIC;
           co : out STD_LOGIC);
end full_adder;

architecture Behavioral of full_adder is

component half_adder is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           s: out STD_LOGIC;
           c : out STD_LOGIC);
end component half_adder;

signal s1, s2, s3 : std_logic := '0';

begin
hf1: half_adder
port map (
a    => a,
b   => b,
s  => s1,
c => s2
);
hf2: half_adder
port map (
a    => ci,
b    => s1,
s  => s,
c => s3
);
co <= s2 or s3;
end Behavioral;
