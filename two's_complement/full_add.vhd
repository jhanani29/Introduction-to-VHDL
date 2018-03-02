----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/10/2018 12:51:13 AM
-- Design Name: 
-- Module Name: full_add - Behavioral
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

entity full_add is
    Port ( a1 : in STD_LOGIC;
           b1 : in STD_LOGIC;
           cin : in STD_LOGIC;
           cout: out STD_LOGIC;
           sum1 : out STD_LOGIC);
end full_add;

architecture Behavioral of full_add is
component half_add
Port (     a0 : in STD_LOGIC;
           b0 : in STD_LOGIC;           
           c0 : out STD_LOGIC;
           sum0 : out STD_LOGIC);
  end component;       
  signal s1,c1,c2 : STD_LOGIC;  
begin
ha_1: half_add port map(a1,b1,c1,s1);
ha_2: half_add port map(s1,cin,c2,sum1);
cout <= c1 or c2;
end Behavioral;
