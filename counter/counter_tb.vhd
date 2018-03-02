----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2018 06:07:55 PM
-- Design Name: 
-- Module Name: simu - Behavioral
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

entity test is
--  Port ( );
end test;

architecture Behavioral of test is
signal clk,reset: std_logic := '0';
signal q:std_logic_vector (3 downto 0 );
constant clk_period : time := 50 ns;
begin
uut : entity work.counter(Behavioral)
port map( clk => clk, reset =>reset, q=>q);
clk_process :process
begin
clk <= '0';
wait for clk_period/2;
clk <= '1';
wait for clk_period/2;
end process;
reset_process: process
begin
wait for 480 ns;
reset <= '1';
wait for 20 ns; 
reset <= '0';
wait for 30 ns;
reset <= '1';
wait for 20 ns;
reset <= '0';
end process;

end Behavioral;