library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DFF_test is
end DFF_test;

architecture Behavioral of DFF_test is
    component DFF is
        Port (
            d : in  STD_LOGIC;
            clk : in  STD_LOGIC;
            rst : in  STD_LOGIC;
            q : out STD_LOGIC
        );
    end component;
    
    signal clk_s, rst_s, d_s, q_s : std_logic;
    
begin

    uut: DFF port map(d_s, clk_s, rst_s, q_s);
    
    -- Clock process
    process
    begin
        clk_s <= '0';
        wait for 5 ns;
        clk_s <= '1';
        wait for 5 ns;
    end process;

    -- Stimulus process
    process
    begin
        -- Reset initial values
        rst_s <= '1';
        d_s <= '0';
        wait for 10 ns;
        
        rst_s <= '0';
        wait for 5 ns;
        
        -- Test case 1: Set D to '1'
        d_s <= '1';
        wait for 10 ns;
        
        -- Test case 2: Set D to '0'
        d_s <= '0';
        wait for 10 ns;
        
        -- Test case 3: Set D to '1'
        d_s <= '1';
        wait for 10 ns;
        
        -- End simulation
        wait;
    end process;

end Behavioral;
