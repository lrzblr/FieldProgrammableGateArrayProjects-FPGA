----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:26:25 04/17/2020 
-- Design Name: 
-- Module Name:    led_active - Behavioral 
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity led_active is
    Port ( clock_100Mhz : in    std_logic;
			  reset :in    std_logic;
			  displayed_number : in  STD_LOGIC_VECTOR (15 downto 0);
			  Anode_Activate : out STD_LOGIC_VECTOR (7 downto 0);
           LED_BCD : out  STD_LOGIC_VECTOR (3 downto 0));
end led_active;

architecture Behavioral of led_active is

signal refresh_counter: STD_LOGIC_VECTOR (19 downto 0);
signal LED_activating_counter: std_logic_vector(1 downto 0);

begin

process(clock_100Mhz,reset)
begin 
    if(reset='1') then
        refresh_counter <= (others => '0');
    elsif(rising_edge(clock_100Mhz)) then
        refresh_counter <= refresh_counter + 1;
    end if;
end process;
 LED_activating_counter <= refresh_counter(19 downto 18);
-- 4-to-1 MUX to generate anode activating signals for 4 LEDs 
Anode_Activate(7 downto 4) <= "1111";
process(LED_activating_counter)
begin
    case LED_activating_counter is
    when "00" =>
        Anode_Activate(3 downto 0) <= "0111"; 
        -- activate LED1 and Deactivate LED2, LED3, LED4
        LED_BCD <= displayed_number(15 downto 12);
        -- the first hex digit of the 16-bit number
    when "01" =>
        Anode_Activate(3 downto 0) <= "1011"; 
        -- activate LED2 and Deactivate LED1, LED3, LED4
        LED_BCD <= displayed_number(11 downto 8);
        -- the second hex digit of the 16-bit number
    when "10" =>
        Anode_Activate(3 downto 0) <= "1101"; 
        -- activate LED3 and Deactivate LED2, LED1, LED4
        LED_BCD <= displayed_number(7 downto 4);
        -- the third hex digit of the 16-bit number
    when "11" =>
        Anode_Activate(3 downto 0) <= "1110"; 
        -- activate LED4 and Deactivate LED2, LED3, LED1
        LED_BCD <= displayed_number(3 downto 0);
        -- the fourth hex digit of the 16-bit number    
	     when others =>
        Anode_Activate(3 downto 0) <= "0111"; 
        -- activate LED4 and Deactivate LED2, LED3, LED1
        LED_BCD <= "0000";
        -- the fourth hex digit of the 16-bit number    
    end case;
end process;

end Behavioral;

