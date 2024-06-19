library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test is
end test ;

architecture Behavioral of test is
  -- Component declaration
  component main_design is
    Port ( 
      a : in std_logic_vector(15 downto 0);
      b : in std_logic_vector(15 downto 0);
      c : in std_logic_vector(7 downto 0);
      d : in std_logic_vector(7 downto 0);
      e : out std_logic_vector(15 downto 0);
      s1 : out std_logic_vector(7 downto 0);
      s2 : out std_logic_vector(7 downto 0);
      f : out std_logic_vector(7 downto 0)
    );
  end component;

  -- Signal declarations
  signal a_tb : std_logic_vector(15 downto 0) := (others => '0');
  signal b_tb : std_logic_vector(15 downto 0) := (others => '0');
  signal c_tb : std_logic_vector(7 downto 0) := (others => '0');
  signal d_tb : std_logic_vector(7 downto 0) := (others => '0');
  signal e_tb : std_logic_vector(15 downto 0);
  signal s1_tb : std_logic_vector(7 downto 0);
  signal s2_tb : std_logic_vector(7 downto 0);
  signal f_tb : std_logic_vector(7 downto 0);

begin
  -- Instantiate the main_design module
  dut: main_design
    port map (
      a => a_tb,
      b => b_tb,
      c => c_tb,
      d => d_tb,
      e => e_tb,
      s1 => s1_tb,
      s2 => s2_tb,
      f => f_tb
    );

  -- Stimulus process
  stimulus_proc: process
  begin
    -- Test case 1
    a_tb <= "0011001100110011";
    b_tb <= "0101010101010101";
    c_tb <= "11001100";
    d_tb <= "00110011";
    wait for 10 ns;

    -- Test case 2
    a_tb <= "1111111111111111";
    b_tb <= "0000000000000000";
    c_tb <= "10101010";
    d_tb <= "01010101";
    wait for 10 ns;

    -- Test case 3
    a_tb <= "0000000000000000";
    b_tb <= "1111111111111111";
    c_tb <= "01010101";
    d_tb <= "10101010";
    wait for 10 ns;

    -- Add more test cases as needed

    -- End the simulation
    wait;
  end process stimulus_proc;

end Behavioral;
