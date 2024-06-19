library ieee;
use ieee.std_logic_1164.all;
entity nor_g is
    port (
        input1, input2 : in std_logic;
        output1 : out std_logic
    );
end entity nor_g;
architecture Behavioral of nor_g is
begin
    output1 <= not (input1 or input2) after 3ns;
end architecture Behavioral;
