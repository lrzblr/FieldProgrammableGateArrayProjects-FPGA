----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.04.2023 14:48:29
-- Design Name: 
-- Module Name: clk_bol - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clk_bol is
    Port ( clock_100Mhz : in STD_LOGIC;
           clock_1sn : out STD_LOGIC);
end clk_bol;

architecture Behavioral of clk_bol is

begin 
  process (clock_100Mhz)
    variable cnt: integer range 0 to 100000000;
  begin
     if clock_100Mhz = '1' and clock_100Mhz'event then
         if cnt = 100000000 then
            cnt := 0;
            clock_1sn <= '1'; 
         else 
            cnt := cnt + 1;
            clock_1sn <= '0';
         end if;
      end if;
end process;

end Behavioral;
