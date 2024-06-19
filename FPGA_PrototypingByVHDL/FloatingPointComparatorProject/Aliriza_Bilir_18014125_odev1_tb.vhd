library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Floating_Point_Comparator_TB is
end Floating_Point_Comparator_TB;

architecture Behavioral of Floating_Point_Comparator_TB is

    signal A : std_logic_vector(31 downto 0);
    signal B : std_logic_vector(31 downto 0);
    signal Result : std_logic_vector(31 downto 0);
    signal Clock : std_logic := '0';

    constant Clock_Period : time := 4 ns;
    constant Total_Periods : natural := 4;

begin

    dut : entity work.Floating_Point_Comparator
        port map (
            A => A,
            B => B,
            Result => Result
        );

    Clock_Process : process
    begin
        for i in 1 to Total_Periods loop
            Clock <= '0';
            wait for Clock_Period / 2;
            Clock <= '1';
            wait for Clock_Period / 2;
        end loop;
        wait;
    end process Clock_Process;

    Stimulus_Process : process
    begin
        for i in 1 to Total_Periods loop
            -- Test Case 1: A = -2.8307, B = -2.7115
            A <= "11000000001001111111101110111000"; -- -2.8307
            B <= "11000000001001111111100001110100"; -- -2.7115
            wait until rising_edge(Clock);

            -- Test Case 2: A = 3.9123, B = 1.4847
            A <= "01000000111011111111000101010110"; -- 3.9123
            B <= "01000000100111111011111001111000"; -- 1.4847
            wait until rising_edge(Clock);
            
            -- Test Case 3: A = -1.7181, B = 6.7894
            A <= "10111111111101101110111110011100"; -- -1.7181
            B <= "01000000110110111011001101001100"; -- 6.7894
            wait until rising_edge(Clock);
        end loop;
        wait;
    end process Stimulus_Process;

end Behavioral;
