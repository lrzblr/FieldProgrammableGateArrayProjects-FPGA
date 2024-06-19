library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_mouse_led is
end tb_mouse_led;

architecture test of tb_mouse_led is
    -- Component declaration of the unit under test (UUT)
    component mouse_led
        port (
            clk    : in  std_logic;
            reset  : in  std_logic;
            ps2d   : inout std_logic;
            ps2c   : inout std_logic;
            led    : out std_logic_vector(15 downto 0)
        );
    end component;

    -- Signal declarations
    signal clk     : std_logic := '0';
    signal reset   : std_logic := '1';
    signal ps2d    : std_logic := 'Z';
    signal ps2c    : std_logic := 'Z';
    signal led     : std_logic_vector(15 downto 0);
    signal xm      : std_logic_vector(8 downto 0) := (others => '0');
    signal btnm    : std_logic_vector(2 downto 0) := (others => '0');
    signal m_done_tick : std_logic := '0';

    -- Clock generation
    constant clk_period : time := 10 ns;

begin

    -- UUT instantiation
    uut: mouse_led
        port map (
            clk => clk,
            reset => reset,
            ps2d => ps2d,
            ps2c => ps2c,
            led => led
        );

    -- Clock process definitions
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period / 2;
        clk <= '1';
        wait for clk_period / 2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Initialize Inputs
        reset <= '1';
        ps2d <= 'Z';
        ps2c <= 'Z';
        wait for 100 ns;

        reset <= '0';
        wait for 100 ns;

        -- Simulate PS/2 data and clock signals for mouse movements
        -- and button presses

        -- Example: Move mouse to the right (increase xm)
        xm <= "000000001"; -- Example movement data
        btnm <= "010"; -- Right button press
        m_done_tick <= '1'; -- Simulate done tick
        wait for 20 ns;
        m_done_tick <= '0';
        wait for 100 ns;

        -- Example: Move mouse to the left (decrease xm)
        xm <= "111111111"; -- Example movement data (representing -1 if interpreted as signed)
        btnm <= "010"; -- Right button press
        m_done_tick <= '1'; -- Simulate done tick
        wait for 20 ns;
        m_done_tick <= '0';
        wait for 100 ns;

        -- Example: Move mouse upwards (increase xm by 2)
        xm <= "000000010"; -- Example movement data
        btnm <= "010"; -- Right button press
        m_done_tick <= '1'; -- Simulate done tick
        wait for 20 ns;
        m_done_tick <= '0';
        wait for 100 ns;

        -- Example: Move mouse downwards (decrease xm by 2)
        xm <= "111111110"; -- Example movement data (representing -2 if interpreted as signed)
        btnm <= "010"; -- Right button press
        m_done_tick <= '1'; -- Simulate done tick
        wait for 20 ns;
        m_done_tick <= '0';
        wait for 100 ns;

        -- Example: Random mouse movement
        xm <= "101010101"; -- Random movement data
        btnm <= "010"; -- Right button press
        m_done_tick <= '1'; -- Simulate done tick
        wait for 20 ns;
        m_done_tick <= '0';
        wait for 100 ns;

        -- Example: No button press, no movement
        xm <= "000000000"; -- No movement
        btnm <= "000"; -- No button press
        m_done_tick <= '1'; -- Simulate done tick
        wait for 20 ns;
        m_done_tick <= '0';
        wait for 100 ns;

        -- Finish the simulation
        wait;
    end process;

end architecture test;
