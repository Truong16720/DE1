library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
entity tb_edge_detect is
    -- Entity of testbench is always empty
end entity tb_edge_detect;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------
architecture testbench of tb_edge_detect is

    constant c_CLK_100MHZ_PERIOD : time := 10 ns;

    --Local signals
    signal s_clk_100MHz : std_logic;
    signal s_rst        : std_logic;
    signal s_input1_i   : std_logic;
    signal s_input2_i   : std_logic;
    signal s_switch_i   : std_logic;
    signal s_rise       : std_logic;
    signal s_fall       : std_logic;

begin
    -- Connecting testbench signals with d_ff_rst entity
    -- (Unit Under Test)
        
    uut_edge_detect : entity work.edge_detect
        port map(
            clk     => s_clk_100MHz,
            reset     => s_rst,
            input1_i   => s_input1_i,
            switch_i => s_switch_i ,
            input2_i => s_input2_i,
            rise_o => s_rise,
            fall_o => s_fall
             
        );
    --------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 1000 ns loop -- 20 periods of 100MHz clock
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;                -- Process is suspended forever
    end process p_clk_gen;

    --------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------
    p_reset_gen : process
    begin
        s_rst <= '1'; wait for 150 ns;
        s_rst <= '0';

        wait;
    end process p_reset_gen;

    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        s_input1_i <='0'; wait for 18 ns;
       s_input1_i <='1'; wait for 80 ns;
       s_input1_i <='0';
       
         s_input2_i <='0'; wait for 50 ns;
       s_input2_i <='1'; wait for 30 ns;
       s_input2_i <='0'; wait for 50 ns;
       s_input2_i <='1'; wait for 50 ns;
        s_input2_i <='0'; wait for 70 ns;
         s_input2_i <='1'; wait for 50 ns;
           s_input2_i <='0'; wait for 50 ns;
       s_input2_i <='1'; wait for 30 ns;
       s_input2_i <='0'; wait for 50 ns;
       s_input2_i <='1'; wait for 50 ns;
        s_input2_i <='0'; wait for 70 ns;
       s_input2_i <='1';
       
         

        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end architecture testbench;