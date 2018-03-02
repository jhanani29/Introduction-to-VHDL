----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/10/2018 01:54:05 AM
-- Design Name: 
-- Module Name: twocom_tb - Behavioral
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

entity twocom_tb is
--  Port ( );
end twocom_tb;

architecture Behavioral of twocom_tb is
  component twocomp
  Port ( a : in std_logic_vector(1 downto 0);
       b : in std_logic_vector(1 downto 0); 
       sum: out std_logic_vector(1 downto 0);
       over : out std_logic;
     --  under : out std_logic;
       carry : out std_logic
       );
    end component;
    signal a1 :std_logic_vector(1 downto 0);
    signal b1 :std_logic_vector(1 downto 0);  
    signal sum1 :std_logic_vector(1 downto 0); 
    signal over1 : std_logic;
   -- signal under1 :  std_logic;
   signal carry :  std_logic;
begin
uut2: twocomp port map(a => a1, b => b1, sum => sum1, over => over1, carry => carry);
sim2: process
 begin
  wait for 100 ns;
  a1 <= "00";
  b1 <=  "11"; 
 
  wait for 100 ns;
   a1 <= "01";
   b1 <=  "11";
 
  wait for 100 ns;
    a1 <= "01";
    b1 <=  "01";
   wait for 100 ns;
     a1 <= "10";
     b1 <=  "11";
  wait for 100 ns;
      a1 <= "11";
      b1 <=  "11";
  wait for 100 ns;
       a1 <= "01";
       b1 <=  "10";
  end process; 
end Behavioral;
