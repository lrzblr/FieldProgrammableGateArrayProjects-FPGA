library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main_design_tb is
end main_design_tb;

architecture Behavioral of main_design_tb is
    -- Component ports
    component main_design is
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
    end component main_design;

    -- Signal declarations
    signal A_tb, B_tb, CARRYIN_tb, s0_tb, s1_tb, s2_tb, clk_tb : std_logic;
    signal answer_tb : std_logic;

begin
    -- Instantiate the main_design component
    uut : main_design
    port map (
        A => A_tb,
        B => B_tb,
        CARRYIN => CARRYIN_tb,
        s0 => s0_tb,
        s1 => s1_tb,
        s2 => s2_tb,
        clk => clk_tb,
        answer => answer_tb
    );

    -- Stimulus process
    stimulus : process
    begin
        -- Initialize inputs
        A_tb <= '0';
        B_tb <= '0';
        CARRYIN_tb <= '0';
        s0_tb <= '0';
        s1_tb <= '0';
        s2_tb <= '0';
        clk_tb <= '0';

        -- Wait for a few clock cycles
        wait for 10 ns;

        -- Apply test inputs
        A_tb <= '1';
        B_tb <= '0';
        CARRYIN_tb <= '1';
        s0_tb <= '1';
        s1_tb <= '0';
        s2_tb <= '1';

        -- Toggle clock
        clk_tb <= not clk_tb;
        wait for 5 ns;
        clk_tb <= not clk_tb;
        wait for 5 ns;

        -- Apply more test inputs
        A_tb <= '0';
        B_tb <= '1';
        CARRYIN_tb <= '0';
        s0_tb <= '0';
        s1_tb <= '1';
        s2_tb <= '1';

        -- Toggle clock
        clk_tb <= not clk_tb;
        wait for 5 ns;
        clk_tb <= not clk_tb;
        wait for 5 ns;

        -- Apply final test inputs
        A_tb <= '1';
        B_tb <= '1';
        CARRYIN_tb <= '0';
        s0_tb <= '1';
        s1_tb <= '1';
        s2_tb <= '0';

        -- Toggle clock
        clk_tb <= not clk_tb;
        wait for 5 ns;
        clk_tb <= not clk_tb;
        wait for 5 ns;

        -- End simulation
        wait;
    end process stimulus;

end Behavioral;
