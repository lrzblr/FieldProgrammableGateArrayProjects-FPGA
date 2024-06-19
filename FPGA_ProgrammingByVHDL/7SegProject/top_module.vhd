----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.03.2023 12:50:45
-- Design Name: 
-- Module Name: top_module - Behavioral
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

entity top_module is
    Port ( clock_100Mhz : in STD_LOGIC;
           reset : in STD_LOGIC;
           Anode_Activate : out STD_LOGIC_VECTOR (7 downto 0);
           seven_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
end top_module;

architecture Behavioral of top_module is

component counter is
    Port ( clock_100Mhz : in STD_LOGIC;-- 100Mhz clock on Basys 3 FPGA board
           reset : in STD_LOGIC; -- reset
           count_out: out STD_LOGIC_VECTOR (15 downto 0));
end component;

component bcd_to_sevenseg is
port (
clock_100Mhz : in STD_LOGIC;-- 100Mhz clock
reset : in STD_LOGIC; -- reset
displayed_number: in STD_LOGIC_VECTOR (15 downto 0);
Anode_Activate : out STD_LOGIC_VECTOR (7 downto 0);-- 4 Anode signals
seven_seg_o	: out std_logic_vector (7 downto 0)
);
end component;

signal count_out : STD_LOGIC_VECTOR (15 downto 0);
begin

count : counter
port map( 
clock_100Mhz => clock_100Mhz,
reset => reset,
count_out =>  count_out 
);

seven_s : bcd_to_sevenseg
port map( 
clock_100Mhz => clock_100Mhz,
reset => reset,
displayed_number=> count_out,
Anode_Activate =>  Anode_Activate, 
seven_seg_o => seven_seg_o
);

end Behavioral;
