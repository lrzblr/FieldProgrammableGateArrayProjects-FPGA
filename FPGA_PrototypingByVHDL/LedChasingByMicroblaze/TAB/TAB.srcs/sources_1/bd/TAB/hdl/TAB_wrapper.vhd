--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.2 (win64) Build 1909853 Thu Jun 15 18:39:09 MDT 2017
--Date        : Tue Apr 30 14:22:34 2024
--Host        : DESKTOP-8K477JS running 64-bit major release  (build 9200)
--Command     : generate_target TAB_wrapper.bd
--Design      : TAB_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity TAB_wrapper is
  port (
    led_16bits_tri_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    reset : in STD_LOGIC;
    sys_clock : in STD_LOGIC
  );
end TAB_wrapper;

architecture STRUCTURE of TAB_wrapper is
  component TAB is
  port (
    reset : in STD_LOGIC;
    sys_clock : in STD_LOGIC;
    led_16bits_tri_o : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component TAB;
begin
TAB_i: component TAB
     port map (
      led_16bits_tri_o(15 downto 0) => led_16bits_tri_o(15 downto 0),
      reset => reset,
      sys_clock => sys_clock
    );
end STRUCTURE;
