----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/10/2018 01:09:02 AM
-- Design Name: 
-- Module Name: twocomp - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity twocomp is
  Port ( a : in std_logic_vector(1 downto 0);
         b : in std_logic_vector(1 downto 0); 
         sum: out std_logic_vector(1 downto 0);
         over : out std_logic;
         --under : out std_logic;       
         carry : out std_logic
         );
end twocomp;

architecture Behavioral of twocomp is

component half_add
 port(     a0 : in STD_LOGIC;
           b0 : in STD_LOGIC;
           sum0 : out STD_LOGIC;
           c0 : out STD_LOGIC);
 end component;          

component full_add
 Port ( a1 : in STD_LOGIC;
          b1 : in STD_LOGIC;
          cin : in STD_LOGIC;
          cout: out STD_LOGIC;
          sum1 : out STD_LOGIC);
  end component;
 component nor3
   Port ( a : in STD_LOGIC;
          b : in STD_LOGIC;
          c : in STD_LOGIC;
          out1 : out STD_LOGIC);
    end component;
    
  
 signal c : std_logic_vector(1 downto 0); 
 signal c1,a1,b1 : std_logic;
begin

 half_1: half_add port map(a(0),b(0),sum(0),c(0));
 full_1: full_add port map(a(1),b(1),c(0),carry,sum(1));
 --full_2: full_add port map(a(2),b(2),c(1),c(2),sum(2));
 --full_3: full_add port map(a(3),b(3),c(2),carry,sum(3));
c1<= not c(0);
 nor_1:  nor3 port map(a(1),b(1),c1,over);
 --a1 <= not a(3);
 --b1 <= not b(3);
 --nor_2:  nor3 port map(a1,b1,c(2),under);
 end Behavioral;
