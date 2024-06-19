----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.05.2023 15:24:08
-- Design Name: 
-- Module Name: ger_say - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ger_say is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           start : in STD_LOGIC;
           yuk : in STD_LOGIC;
           r1 : in STD_LOGIC;
           giris : in STD_LOGIC_VECTOR (1 downto 0);
           dr : out STD_LOGIC_VECTOR (7 downto 0);
           sayc : out STD_LOGIC_VECTOR (7 downto 0));
end ger_say;

architecture Behavioral of ger_say is
----- type decleration and signal declaration
type durum_tipi is (bos, sayma, bekle, bitti, deger);
signal durum, gdurum :durum_tipi;

signal say_d : std_logic_vector (7 downto 0) := x"64";
signal clk_in: std_logic;

component clk_bol is
    Port ( clk : in  STD_LOGIC;
           clk_in : out  STD_LOGIC);
end component;

begin

saat: clk_bol port map (clk, clk_in);

---- bu süreçte durum makinesi kontrol ediliyor
process (clk, reset)
   begin
     if reset = '1' then
        durum <= bos;
    elsif rising_edge (clk) then
        durum <= gdurum;
     end if;
end process;

----- Bu süreçte durumlar arasý geçiþler tanýmlanýyor
  process (durum, gdurum, start, yuk, r1, say_d)
      begin
      
       case durum is
           when bos => dr <= x"01";
                if yuk = '1' then
                   gdurum <= deger;
                else
                   gdurum <= bos;
                end if;
           when deger => dr <= x"02";
                if start = '1' then
                   gdurum <= sayma;
                else
                   gdurum <= deger;
                end if;
           when sayma => dr <= x"03";
                if start = '1' then 
                   gdurum <= bekle;
                 elsif say_d = x"00" then
                   gdurum <= bitti;
                 else
                   gdurum <= sayma;
                end if;
           when bekle => dr <= x"04";
               if start = '1' then
				  gdurum <= sayma;
				else
				 gdurum <= bekle;
			   end if;
		   when bitti => dr <= x"05";
		      if r1 = '1' then
				  gdurum <= deger;
			  else
				  gdurum <= bitti;
			  end if;
				  
			when others =>
               gdurum <= bos;
          end case;
      end process;		

----- durumlar içerisindeki iþlemler
  process (clk_in, reset, durum, giris)
     begin
       if reset = '1' then 
          say_d <= x"32";
       elsif clk_in = '1' and clk_in'event then
          if durum = deger then
                 if giris = "00" then
                   say_d <= x"32";
                 elsif giris = "01" then				 
                   say_d <= x"64";
                 elsif giris = "10" then				 
                   say_d <= x"96";
                 elsif giris = "11" then				 
                   say_d <= x"C8";
                 end if; 
		   elsif durum = sayma then
		       say_d <= say_d - 1;
		   elsif durum = bekle then
		       say_d <= say_d;
		   else
		      say_d <= x"00";
		  end if;
      end if;
 end process;
  sayc <= say_d;



end Behavioral;
