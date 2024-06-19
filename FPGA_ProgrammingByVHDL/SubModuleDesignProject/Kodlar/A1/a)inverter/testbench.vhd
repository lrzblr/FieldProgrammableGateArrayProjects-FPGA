library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end entity testbench;

architecture Behavioral of testbench is

    component inverter
        port (
            input : in std_logic;
            output : out std_logic
        );
    end component inverter;

    signal input_signal : std_logic := '0';
    signal output_signal : std_logic;

begin
    UUT: inverter
        port map (
            input => input_signal,
            output => output_signal
        );
    stimulus_process: process
    begin
        input_signal <= '1';
        wait for 2ns;
        input_signal <= '0';
        wait for 2ns;
        input_signal <= '1';
        wait for 2ns;
        wait;
    end process stimulus_process;

end architecture Behavioral;