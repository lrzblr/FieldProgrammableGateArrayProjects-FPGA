----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:22:28 04/17/2020 
-- Design Name: 
-- Module Name:    clk_bol - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clk_bol is
    Port ( clk : in  STD_LOGIC;
           clk_in : out  STD_LOGIC);
end clk_bol;

architecture Behavioral of clk_bol is

begin
-- 20 ns periyodlu clocktan 1 sn periyodlu clock elde ediliyor.
process (clk)
    variable cnt: integer range 0 to 100000000;
  begin
  	 
	 if clk='1' and clk'event then
	     if cnt=50000000 then
		     cnt:=0;
			  clk_in <= '1';
		  else 
		     cnt:=cnt+1;
			  clk_in <= '0';
		  
		end if;
	end if;
 end process;
			 
		  
	   

end Behavioral;