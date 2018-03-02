----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/29/2018 06:42:02 PM
-- Design Name: 
-- Module Name: gates_tb - Behavioral
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

entity gates_tb is
--  Port ( );
end gates_tb;

architecture Behavioral of gates_tb is
 signal A :  std_logic;
 signal B :  std_logic;
 signal C :  std_logic;
 signal D :  std_logic;
 signal L1 :  std_logic;
 signal L2 :  std_logic;
 signal L3 :  std_logic;
 signal L4 :  std_logic;

begin
p0 : entity work.gates(Behavioral) port map(
A => A,
B => B, 
C => C,
D => D,
L1 => L1,
L2 => L2,
L3 => L3,
L4 => L4);

process
begin

  wait for 100 ns;
  A <= '0';
  B <= '0';
  C <= '0';
  D <= '0';
  wait for 20 ns;
  A <= '0';
  B <= '0';
  C <= '0';
  D <= '1';    
  wait for 20 ns;
  A <= '0';
  B <= '0';
  C <= '1';
  D <= '0';
  wait for 20 ns;
  A <= '0';
  B <= '0';
  C <= '1';
  D <= '1';
  wait for 20 ns;
    A <= '0';
    B <= '1';
    C <= '0';
    D <= '0';
  
  wait for 20 ns;
      A <= '0';
      B <= '1';
      C <= '0';
      D <= '0';
  
  wait for 20 ns;
        A <= '0';
        B <= '1';
        C <= '0';
        D <= '1';
  
  wait for 20 ns;
          A <= '0';
          B <= '1';
          C <= '1';
          D <= '1';
          
          
  end process;
  
end Behavioral;
