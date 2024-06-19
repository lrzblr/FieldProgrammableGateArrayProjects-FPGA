----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.05.2023 16:01:19
-- Design Name: 
-- Module Name: de_cir - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity de_cir is
Port ( pld : in  STD_LOGIC;
        clk : in  STD_LOGIC;
        reset : in  STD_LOGIC;
	   pulse :out std_logic);
end de_cir;

architecture Behavioral of de_cir is
--  Provides a one-shot pulse from a non-clock input, with reset
--**Insert the following between the 'architecture' and
---'begin' keywords**
signal Q1, Q2, Q3 : std_logic;

--**Insert the following after the 'begin' keyword**

begin
process(clk, reset)
begin
   if (clk'event and clk = '1') then
      if (reset = '1') then
         Q1 <= '0';
         Q2 <= '0';
         Q3 <= '0';
      else
         Q1 <= pld;
         Q2 <= Q1;
         Q3 <= Q2;
      end if;
   end if;
end process;

pulse <= Q1 and Q2 and (not Q3);

end Behavioral;
