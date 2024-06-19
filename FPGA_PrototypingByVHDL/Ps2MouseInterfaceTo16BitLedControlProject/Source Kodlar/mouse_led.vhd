library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity mouse_led is
   port (
      clk, reset: in  std_logic;
      ps2d, ps2c: inout std_logic;
      led: out std_logic_vector(15 downto 0)
   );
end mouse_led;

architecture arch of mouse_led is
   signal p_reg, p_next: unsigned(10 downto 0);
   signal xm: std_logic_vector(8 downto 0);
   signal btnm: std_logic_vector(2 downto 0);
   signal m_done_tick: std_logic;

begin
   -- instantiation
   mouse_unit: entity work.mouse(arch)
      port map(clk=>clk, reset=>reset,
               ps2d=>ps2d, ps2c=>ps2c,
               xm=>xm, ym=>open, btnm=>btnm,
               m_done_tick=>m_done_tick);
   -- register
   process (clk, reset)
   begin
      if reset='1' then
         p_reg <= (others=>'0');
      elsif (clk'event and clk='1') then
         p_reg <= p_next;
      end if;
   end process;
   -- counter
   p_next <= p_reg when m_done_tick='0' else
             "00000000000" when btnm(0)='1' else --left button
             "11111111111" when btnm(1)='1' else --right button
             p_reg + unsigned(xm(8) & xm);
   with p_reg(10 downto 7) select
      led <= "1000000000000000" when "0000",
             "0100000000000000" when "0001",
             "0010000000000000" when "0010",
             "0001000000000000" when "0011",
             "0000100000000000" when "0100",
             "0000010000000000" when "0101",
             "0000001000000000" when "0110",
             "0000000100000000" when "0111",
             "0000000010000000" when "1000",
             "0000000001000000" when "1001",
             "0000000000100000" when "1010",
             "0000000000010000" when "1011",
             "0000000000001000" when "1100",
             "0000000000000100" when "1101",
             "0000000000000010" when "1110",
             "0000000000000001" when others;
end arch;