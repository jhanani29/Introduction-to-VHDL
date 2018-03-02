----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2018 06:33:38 PM
-- Design Name: 
-- Module Name: regi - Behavioral
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

entity regi is
 Port (D: in std_logic_vector(15 downto 0);
       clk:in std_logic;
       rst:in std_logic;
        Q : out std_logic_vector(15 downto 0)
        );
end regi;

architecture Behavioral of regi is
 signal state: std_logic_vector(15 downto 0);
begin
 process(clk)
  begin
  if rising_edge(clk) then   
   if rst = '1' then 
    state <= x"0000";
   else 
     state <= D;
   end if;
  end if;  
 Q <= state;
 end process;
end Behavioral;
