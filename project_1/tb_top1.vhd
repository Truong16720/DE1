library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
entity tb_top is
    -- Entity of testbench is always empty
end entity tb_top;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------
architecture testbench of tb_top is

    constant c_CLK_100MHZ_PERIOD : time := 10 ns;

    --Local signals
    signal s_clk_100MHz : std_logic;
    signal s_rst        : std_logic;
    signal s_input2_i     : std_logic;
    signal s_input1_i     : std_logic;
    signal s_switch_i     : std_logic;
    signal s_rise       : std_logic;
    signal s_fall       : std_logic;
    signal s_seconds_h    : std_logic_vector(3 - 1 downto 0);
    signal s_seconds_l    : std_logic_vector(4 - 1 downto 0);
    signal s_hundredths_h : std_logic_vector(4 - 1 downto 0);
    signal s_hundredths_l : std_logic_vector(4 - 1 downto 0);
    signal s_seconds_h2    : std_logic_vector(3 - 1 downto 0);
    signal s_seconds_l2    : std_logic_vector(4 - 1 downto 0);
    signal s_hundredths_h2 : std_logic_vector(4 - 1 downto 0);
    signal s_hundredths_l2 : std_logic_vector(4 - 1 downto 0);
    signal s_dot   : std_logic;
    signal s_dash        : std_logic;
    signal s_char        : std_logic;
    signal s_word        : std_logic;
    signal s_en        : std_logic;
    signal s_num : std_logic;
    signal s_dec_reset : std_logic;
begin
    -- Connecting testbench signals with d_ff_rst entity
    -- (Unit Under Test)
    
    
        
    uut_edge_detect : entity work.edge_detect
        port map(
            clk       => s_clk_100MHz,
            reset     => s_rst,
            input1_i  => s_input1_i,
            input2_i  => s_input2_i,
            switch_i  => s_switch_i,
            rise_o    => s_rise,
            fall_o    => s_fall
             
        );
        
     uut_stopwatch : entity work.stopwatch
        port map(
            clk            => s_clk_100MHz,
            reset          => s_rst,
            start        => s_rise,
            pause        => s_fall,
            seconds_h_o    => s_seconds_h,
            seconds_l_o    => s_seconds_l,
            hundredths_h_o => s_hundredths_h,
            hundredths_l_o => s_hundredths_l
        );
        
      uut_stopwatch2 : entity work.stopwatch2
        port map(
            clk            => s_clk_100MHz,
            reset          => s_rst,
            start        => s_fall,
            
            pause        => s_rise,
            seconds_h_o    => s_seconds_h2,
            seconds_l_o    => s_seconds_l2,
            hundredths_h_o => s_hundredths_h2,
            hundredths_l_o => s_hundredths_l2,
            dec_reset => s_dec_reset
        ); 
       uut_decoder_1 : entity work.decoder_1
        port map(
            clk            => s_clk_100MHz,
            rst          => s_rst,
            rise => s_rise,
            fall => s_fall,
            time_dot    => s_seconds_h,
            time_dash    => s_seconds_l,
            bin_dot => s_hundredths_h,
            bin_dash => s_hundredths_l, 
            dot  => s_dot,
            dash => s_dash,
            enbl   => s_en
        ); 
      uut_decoder2 : entity work.decoder_2
        port map(
            clk            => s_clk_100MHz,
            rst          => s_rst,
            rise => s_rise,
            fall => s_fall,
            enbl   => s_en,
            dot  => s_dot,
            dash => s_dash,
            time_dot    => s_seconds_h2,
            time_dash    => s_seconds_l2,
            bin_dot => s_hundredths_h2,
            bin_dash => s_hundredths_l2,
            char => s_char,
            intgr => s_word,
            reset => s_dec_reset
            
        );  
    --------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 1000000 ns loop -- 20 periods of 100MHz clock
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
        s_rst <= '1'; wait for 18 ns;
        s_rst <= '0';

        wait;
    end process p_reset_gen;

    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;
       s_input1_i <='0'; wait for 170 ns;
       s_input1_i <='1'; wait for 120 ns;
       s_input1_i <='0'; wait for 200 ns;
       s_input1_i <='1'; wait for 300 ns;
       s_input1_i <='0'; wait for 500 ns;
       s_input1_i <='1'; wait for 89 ns;
       s_input1_i <='0'; wait for 100 ns;
       s_input1_i <='1'; wait for 220 ns;
       s_input1_i <='0'; wait for 200 ns;
       s_input1_i <='1'; wait for 89 ns;
       s_input2_i <='0'; wait for 100 ns;
       s_input2_i <='1'; wait for 220 ns;
       s_input2_i <='0'; wait for 200 ns;
       s_input1_i <='1'; wait for 89 ns;
       s_input1_i <='0'; wait for 100 ns;
       s_input1_i <='1'; wait for 220 ns;
       s_input1_i <='0'; wait for 200 ns;
       s_input1_i <='1';

        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end architecture testbench;