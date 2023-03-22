----------------------------------------------------------
--
-- Testbench for D flip-flop.
-- Nexys A7-50T, xc7a50ticsg324-1L
-- TerosHDL, Vivado v2020.2, EDA Playground
--
-- Copyright (c) 2021 Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
----------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------

entity tb_t_ff is
  -- Entity of testbench is always empty
end entity tb_t_ff;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------

architecture testbench of tb_t_ff is

  constant c_CLK_100MHZ_PERIOD : time := 10 ns;

  -- Local signals
  signal sig_clk_100mhz : std_logic;
  signal sig_rst        : std_logic;
  signal sig_data       : std_logic;
  signal sig_dq         : std_logic;
  signal sig_dq_bar     : std_logic;
  signal sig_tq         : std_logic;
  signal sig_tq_bar     : std_logic;

begin

  -- Connecting testbench signals with d_ff entity
  -- (Unit Under Test)
  uut_d_ff_rst : entity work.d_ff_rst
    port map (
      clk   => sig_clk_100mhz,
      rst   => sig_rst,
      d     => sig_data,
      q     => sig_dq,
      q_bar => sig_dq_bar   
    );

  uut_t_ff_rst : entity work.t_ff_rst
    port map (
      clk   => sig_clk_100mhz,
      rst   => sig_rst,
      t     => sig_data,
      q     => sig_tq,
      q_bar => sig_tq_bar    
    );
    

  --------------------------------------------------------
  -- Clock generation process
  --------------------------------------------------------
  p_clk_gen : process is
  begin

    while now < 300 ns loop             -- 30 periods of 100MHz clock

      sig_clk_100mhz <= '0';
      wait for c_CLK_100MHZ_PERIOD / 2;
      sig_clk_100mhz <= '1';
      wait for c_CLK_100MHZ_PERIOD / 2;

    end loop;
    wait;                               -- Process is suspended forever

  end process p_clk_gen;

  --------------------------------------------------------
  -- Reset generation process
  --------------------------------------------------------
  p_reset_gen : process is
  begin

    sig_rst <= '0';
    wait for 5 ns;

    -- Reset activated
    sig_rst <= '1';
    wait for 15 ns;

    -- Reset deactivated
    sig_rst <= '0';

    wait;

  end process p_reset_gen;

  --------------------------------------------------------
  -- Data generation process
  --------------------------------------------------------
  p_stimulus : process is
  begin

    report "Stimulus process started";

    sig_data <= '0';
    wait for 15 ns;

    sig_data <= '1';
    wait for 30 ns;

    sig_data <= '0';
    wait for 15 ns;

    sig_data <= '1';
    wait for 15 ns;
  

    report "Stimulus process finished";
    wait;

  end process p_stimulus;
end architecture testbench;