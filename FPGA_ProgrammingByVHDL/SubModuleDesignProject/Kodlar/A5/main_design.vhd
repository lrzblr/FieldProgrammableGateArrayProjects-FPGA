library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main_design is
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
end main_design;

architecture Structural of main_design is
  component full_adder is
    Port ( 
      a_i : in std_logic;
      b_i : in std_logic;
      carry_i : in std_logic;
      sum_o : out std_logic;
      carry_o : out std_logic
    );
  end component;

  component mux2x1 is
    Port ( 
      a_i : in std_logic;
      b_i : in std_logic;
      s_i : in std_logic;
      q_o : out std_logic
    );
  end component;

  signal s1_temp, s2_temp : std_logic_vector(7 downto 0);
  signal f_temp : std_logic_vector(7 downto 0);
  signal co1, co2 : std_logic;
  signal e_temp : std_logic_vector(15 downto 0);

begin
  -- Ýlk tam toplayýcý
  adder1 : full_adder port map (
    a_i => a(15),
    b_i => b(15),
    carry_i => '0',
    sum_o => s1_temp(7),
    carry_o => co1
  );

  -- Ýkinci tam toplayýcý
  adder2 : full_adder port map (
    a_i => c(7),
    b_i => d(7),
    carry_i => '0',
    sum_o => s2_temp(7),
    carry_o => co2
  );

  -- Ýlk mux
  mux1 : mux2x1 port map (
    a_i => a(15),
    b_i => b(15),
    s_i => co1,
    q_o => e_temp(7)
  );

  -- Ýkinci mux
  mux2 : mux2x1 port map (
    a_i => c(7),
    b_i => d(7),
    s_i => co2,
    q_o => f_temp(7)
  );

  -- Çýkýþlarý atama
  e <= e_temp;
  s1 <= s1_temp;
  s2 <= s2_temp;
  f <= f_temp;

end Structural;
