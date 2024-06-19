----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.04.2023 14:18:17
-- Design Name: 
-- Module Name: counter - Behavioral
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
    Port ( clock_100Mhz : in STD_LOGIC;
           reset : in STD_LOGIC;
           count_out : out STD_LOGIC_VECTOR (15 downto 0));
end counter;

architecture Behavioral of counter is

component clk_bol is
    Port ( clock_100Mhz : in STD_LOGIC;
           clock_1sn : out STD_LOGIC);
end component;

signal display_number: std_logic_vector(15 downto 0);
signal clock_1sn : std_logic;

begin

zaman: clk_bol
port map (
clock_100Mhz => clock_100Mhz,
clock_1sn => clock_1sn
);


cnt: process (clock_1sn, reset)
     begin
       if(reset ='1') then
           display_number <= (others => '0');
       elsif(rising_edge(clock_1sn)) then
           display_number <= display_number + x"0001"; 
       end if;
end process;

count_out <= display_number;

end Behavioral;
