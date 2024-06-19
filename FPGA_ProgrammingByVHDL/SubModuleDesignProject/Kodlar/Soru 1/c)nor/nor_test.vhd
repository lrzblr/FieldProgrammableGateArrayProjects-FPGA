library ieee;
use ieee.std_logic_1164.all;

entity nor_test is
end entity nor_test;

architecture Behavioral of nor_test is

    -- Component declaration
    component nor_g is
        port (
            input1, input2 : in std_logic;
            output1 : out std_logic
        );
    end component nor_g;

    -- Signal declarations
    signal input1_s, input2_s : std_logic := '0';
    signal output1_s : std_logic;

begin

    -- Instantiate the nor_gate component
    uut: nor_g port map (
        input1 => input1_s,
        input2 => input2_s,
        output1 => output1_s
    );

    -- Stimulus process
    stimulus_process: process
    begin
        -- Apply inputs
        input1_s <= '1';
        input2_s <= '1';
        wait for 3ns;
        
        input1_s <= '0';
        input2_s <= '1';
        wait for 3ns;
        
        input1_s <= '1';
        input2_s <= '0';
        wait for 3ns;
        
        input1_s <= '0';
        input2_s<= '0';
        wait for 3ns;
        
        -- End simulation
        wait;
    end process stimulus_process;

end architecture Behavioral;
