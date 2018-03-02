----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/09/2018 11:54:18 PM
-- Design Name: 
-- Module Name: half_add - Behavioral
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

entity half_add is
    Port ( a0 : in STD_LOGIC;
           b0 : in STD_LOGIC;
           sum0 : out STD_LOGIC;
           c0 : out STD_LOGIC);
           
end half_add;

architecture Behavioral of half_add is

component and2 
 Port (   a0 : in STD_LOGIC;
          b0 : in STD_LOGIC;
          c0 : out STD_LOGIC);
end component;

component xor2 
 Port (    a0 : in STD_LOGIC;
           b0 : in STD_LOGIC;
           s0: out STD_LOGIC);
end component;


begin
x1: xor2 port map(a0,b0,sum0);
a1: and2 port map(a0,b0,c0);

end Behavioral;
