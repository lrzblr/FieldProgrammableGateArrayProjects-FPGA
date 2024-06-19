----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.04.2023 15:18:52
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
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           clear_count : in STD_LOGIC;
           enable : in STD_LOGIC;
           counter_out : out STD_LOGIC_VECTOR (9 downto 0));
end counter;

architecture Behavioral of counter is

signal s_count : unsigned (9 downto 0); 

begin

  say: process (clock, reset, enable)
       begin
--            if reset = '1' then
--               s_count <= (others => '0');
--            elsif rising_edge(clock) then
--                if clear_count = '1' then
--                   s_count <= (others => '0');
--                elsif enable = '1' then
--                   s_count <= s_count + 1;
--                end if;
--             end if;

if rising_edge(clock) then
            if (reset = '1') or (clear_count = '1') then
                s_count <= (others => '0');
            elsif enable = '1' then
                s_count <= s_count + 1;
            end if; 
        end if;       
       end process;
       
counter_out <= std_logic_vector(s_count); 
 
end Behavioral;
