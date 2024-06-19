library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main_design is
    port (
        A : in std_logic;
        B : in std_logic;
        CARRYIN : in std_logic;
        s0 : in std_logic;
        s1 : in std_logic;
        s2 : in std_logic;
        clk : in std_logic;
        answer : out std_logic
    );
end main_design;

architecture Behavioral of main_design is
    component full_adder is
        Port (
            a : in std_logic;
            b : in std_logic;
            ci : in std_logic;
            s : out std_logic;
            co : out std_logic
        );
    end component full_adder;

    component mux8x3 is
        port (
            b0 : in std_logic;
            b1 : in std_logic;
            b2 : in std_logic;
            b3 : in std_logic;
            b4 : in std_logic;
            b5 : in std_logic;
            b6 : in std_logic;
            b7 : in std_logic;
            sel0 : in std_logic;
            sel1 : in std_logic;
            sel2 : in std_logic;
            m_out : out std_logic
        );
    end component mux8x3;

    component mux4x2 is
        port (
            a0 : in std_logic;
            a1 : in std_logic;
            a2 : in std_logic;
            a3 : in std_logic;
            sel0 : in std_logic;
            sel1 : in std_logic;
            b : out std_logic
        );
    end component mux4x2;

    signal x1, x2, x3, x4, x5, x6, x7, x8 : std_logic := '0';

begin

    x2 <= CARRYIN or s0;
    x5 <= A and B;
    x6 <= A or B;
    x7 <= A xor B;
    x8 <= not A;

    fulladder1 : full_adder
    port map (
        a => A,
        b => x1,
        ci => x2,
        s => x3,
        co => x4
    );

    firstmux : mux4x2
    port map (
        a0 => B,
        a1 => not B,
        a2 => clk,
        a3 => not clk,
        sel0 => s0,
        sel1 => s1,
        b => x1
    );

    mux2 : mux8x3
    port map (
        b0 => x3,
        b1 => x3,
        b2 => x3,
        b3 => x4,
        b4 => x5,
        b5 => x6,
        b6 => x8,
        b7 => x7,
        sel0 => s0,
        sel1 => s1,
        sel2 => s2,
        m_out => answer
    );

end Behavioral;
