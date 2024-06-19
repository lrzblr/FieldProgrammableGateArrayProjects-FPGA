library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity inverter is
    port (
        input : in std_logic;
        output : out std_logic
    );
end entity inverter;

architecture Behavioral of Inverter is
begin
    output <= not input after 2ns;
end architecture Behavioral;
