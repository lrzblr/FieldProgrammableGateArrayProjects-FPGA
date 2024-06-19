library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DFF is
    Port (
        d : in  STD_LOGIC;
        clk : in  STD_LOGIC;
        rst : in  STD_LOGIC;
        q : out STD_LOGIC
    );
end DFF ;

architecture Behavioral of DFF is
    signal s1, s2, s3 : std_logic;

    component nand_g is
        port (
            a, b : in STD_LOGIC;
            c : out STD_LOGIC
        );
    end component;

    component xor_g is
        port (
            input1, input2 : in STD_LOGIC;
            output : out STD_LOGIC
        );
    end component;

    component nor_g is
        port (
            input1, input2 : in STD_LOGIC;
            output1 : out STD_LOGIC
        );
    end component;

    component inverter is
        port (
            input : in STD_LOGIC;
            output : out STD_LOGIC
        );
    end component;

begin

    n1 : nand_g port map(d, rst, s1);

    n2 : nand_g port map(s1, clk, s2);

    x1 : xor_g port map(s1, s2, s3);

    n3 : nor_g port map(s2, s3, q);

    i1 : inverter port map(s1, q);

end Behavioral;
