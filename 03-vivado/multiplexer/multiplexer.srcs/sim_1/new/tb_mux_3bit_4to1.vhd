----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/22/2023 04:54:58 PM
-- Design Name: 
-- Module Name: tb_mux_3bit_4to1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_mux_3bit_4to1 is
--  Port ( );
end tb_mux_3bit_4to1;

architecture Behavioral of tb_mux_3bit_4to1 is

    signal a_i : std_logic_vector(2 downto 0);
    signal b_i : std_logic_vector(2 downto 0);
    signal c_i : std_logic_vector(2 downto 0);
    signal d_i : std_logic_vector(2 downto 0);
    signal sel_i : std_logic_vector(1 downto 0);
    signal f_o : std_logic_vector(2 downto 0);
    
begin

    -- Testbench local signals
 p_label : process (a_i)
begin


    
end Behavioral;
