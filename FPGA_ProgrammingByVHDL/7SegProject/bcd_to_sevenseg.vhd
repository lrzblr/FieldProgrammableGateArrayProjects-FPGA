----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.04.2023 15:13:42
-- Design Name: 
-- Module Name: bcd_to_sevenseg - Behavioral
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

entity bcd_to_sevenseg is
port (
        clock_100Mhz : in STD_LOGIC;-- 100Mhz clock
        reset : in STD_LOGIC; -- reset
        displayed_number: in STD_LOGIC_VECTOR (15 downto 0);
        Anode_Activate : out STD_LOGIC_VECTOR (7 downto 0);-- 4 Anode signals
        seven_seg_o: out std_logic_vector (7 downto 0)
);
end bcd_to_sevenseg;

architecture Behavioral of bcd_to_sevenseg is
signal LED_activating_counter: std_logic_vector(1 downto 0);
signal LED_BCD: STD_LOGIC_VECTOR (3 downto 0);
signal refresh_counter: STD_LOGIC_VECTOR (19 downto 0);

begin

process (LED_BCD) begin

	case LED_BCD is
		
		when "0000" =>			
			seven_seg_o	<= "00000011"; -- CACBCCCDCECFCGDP --0
			
		when "0001" =>		
			seven_seg_o	<= "10011111"; --1
			
		when "0010" =>		
			seven_seg_o	<= "00100101"; --2
			
		when "0011" =>
			seven_seg_o	<= "00001101"; --3
			
		when "0100" =>
			seven_seg_o	<= "10011001"; 
			
		when "0101" =>
			seven_seg_o	<= "01001001"; 
			
		when "0110" =>
			seven_seg_o	<= "01000001"; 
			
		when "0111" =>
			seven_seg_o	<= "00011111"; 
			
		when "1000" =>
			seven_seg_o	<= "00000001"; 
			
		when "1001" =>
			seven_seg_o	<= "00001001"; --9
		
		when "1010" => 
		    seven_seg_o <= "00000101"; -- a
        
        when "1011" => 
             seven_seg_o <= "11000001"; -- b
        
        when "1100" => 
             seven_seg_o <= "01100011"; -- C
        
        when "1101" => 
             seven_seg_o <= "10000101"; -- d
        
        when "1110" => 
             seven_seg_o <= "01100001"; -- E
        
        when "1111" => 
             seven_seg_o <= "01110001"; -- F
			
		when others =>
			seven_seg_o	<= "11111111"; 
		
	end case;

end process;

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
    end case;
end process;

process(clock_100Mhz,reset)
begin 
    if(reset='1') then
        refresh_counter <= (others => '0');
    elsif(rising_edge(clock_100Mhz)) then
        refresh_counter <= refresh_counter + 1;
    end if;
end process;

 LED_activating_counter <= refresh_counter(19 downto 18);

end Behavioral;
