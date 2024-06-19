----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:57:53 04/17/2020 
-- Design Name: 
-- Module Name:    ana_modul - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ana_modul is
    Port ( clock_100Mhz : in  STD_LOGIC;
           --uclk : in  STD_LOGIC;
			  sel  : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           start : in  STD_LOGIC;
           yuk : in  STD_LOGIC;
			  dp : out  STD_LOGIC;
           r1 : in  STD_LOGIC;
           giris : in  STD_LOGIC_VECTOR (1 downto 0);
           dr : in  STD_LOGIC_VECTOR (1 downto 0);
           seg : out  STD_LOGIC_VECTOR (6 downto 0);
           Anode_Activate : out  STD_LOGIC_VECTOR (7 downto 0));
end ana_modul;

architecture Behavioral of ana_modul is

--signal clock_100Mhz      : std_logic;
signal LED_BCD: STD_LOGIC_VECTOR (3 downto 0);
signal displayed_number: STD_LOGIC_VECTOR (15 downto 0);
signal sayc, drm : STD_LOGIC_VECTOR (7 downto 0);
signal start1,yuk1,r2, clk: std_logic;



	
	
		COMPONENT ger_say
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		start : IN std_logic;
		yuk : IN std_logic;
		r1 : IN std_logic;
		giris : IN std_logic_vector(1 downto 0);          
		dr : OUT std_logic_vector(7 downto 0);
		sayc : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	COMPONENT led_active
	PORT(
		clock_100Mhz : IN std_logic;
		reset : IN std_logic;
		displayed_number : IN std_logic_vector(15 downto 0);          
		Anode_Activate : OUT std_logic_vector(7 downto 0);
		LED_BCD : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
		COMPONENT led_bcd_conv
	PORT(
		led_bcd : IN std_logic_vector(3 downto 0);          
		seg : OUT std_logic_vector(6 downto 0)
		);
	END COMPONENT;
	
		COMPONENT de_cir
	PORT(
		pld : IN std_logic;
		clk : IN std_logic;
		reset : IN std_logic;          
		pulse : OUT std_logic
		);
	END COMPONENT;

begin
  dp <= '1';
  
  displayed_number(7 downto 0) <= sayc;
  displayed_number (15 downto 8) <= drm;

					 
	Inst_de_cir1: de_cir PORT MAP(
		pld => start,
		clk => clock_100Mhz ,
		reset => reset,
		pulse => start1
	);


	Inst_de_cir2: de_cir PORT MAP(
		pld => yuk,
		clk => clock_100Mhz ,
		reset => reset,
		pulse => yuk1
	);

	Inst_de_cir3: de_cir PORT MAP(
		pld => r1,
		clk => clock_100Mhz ,
		reset => reset,
		pulse => r2
	);

					 
	Inst_ger_say: ger_say PORT MAP(
		clk => clock_100Mhz,
		reset => reset,
		start => start1,
		yuk => yuk1,
		r1 => r2,
		giris => giris,
		dr => drm,
		sayc => sayc
	);

	Inst_led_active: led_active PORT MAP(
		clock_100Mhz => clock_100Mhz,
		reset => reset,
		displayed_number => displayed_number,
		Anode_Activate => Anode_Activate,
		LED_BCD => LED_BCD
	);

	Inst_led_bcd_conv: led_bcd_conv PORT MAP(
		led_bcd => LED_BCD,
		seg => seg
	);


end Behavioral;

