library ieee;
use ieee.std_logic_1164.all;

entity xor_test is
end entity xor_test;

architecture Behavioral of xor_test is
  component xor_g is
    port (
      input1 : in std_logic;
      input2 : in std_logic;
      output : out std_logic
    );
  end component xor_g;
  
  signal input1_s : std_logic := '0';
  signal input2_s : std_logic := '0';
  signal output_s : std_logic;
  

begin

  dut: xor_g
    port map (
      input1 => input1_s,
      input2 => input2_s,
      output => output_s
    );
    
  stimulus: process
  begin
    input1_s <= '0';
    input2_s <= '0';
    wait for 5ns;
    
    input1_s <= '1';
    input2_s <= '1';
    wait for 5ns;
    
    input1_s <= '1';
    input2_s <= '0';
    wait for 5ns;
    
    input1_s <= '0';
    input2_s <= '1';
    wait for 5ns;
    
    wait;
  end process stimulus;

end architecture Behavioral;