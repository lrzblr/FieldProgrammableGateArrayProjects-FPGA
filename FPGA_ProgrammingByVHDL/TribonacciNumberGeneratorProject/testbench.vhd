library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY tribonacci_tb IS
END tribonacci_tb;

ARCHITECTURE tb_arch OF tribonacci_tb IS
    COMPONENT tribonacci
    GENERIC (N: INTEGER := 16);
    PORT (clk, rst : IN BIT;
          tribo_series : OUT INTEGER RANGE 0 TO 2**N-1);
    END COMPONENT;
    
    SIGNAL clk_tb : BIT := '0';
    SIGNAL rst_tb : BIT := '1';
    SIGNAL tribo_series_tb : INTEGER RANGE 0 TO 2**16-1;
    
    BEGIN
    
    dut : tribonacci
    GENERIC MAP (N => 16)
    PORT MAP (clk => clk_tb,
              rst => rst_tb,
              tribo_series => tribo_series_tb);
              
    
    clk_process: PROCESS
    BEGIN
        wait for 5 ns;
        
        while now < 1000 ns loop 
            clk_tb <= '0';
            wait for 10 ns;
            
            clk_tb <= '1';
            wait for 10 ns;
        end loop;
        
        wait;
    END PROCESS;
    
    reset_process: PROCESS
    BEGIN
        rst_tb <= '1';
        wait for 2 ns;
        
        rst_tb <= '0';
        wait;
    END PROCESS;
    
END tb_arch;

