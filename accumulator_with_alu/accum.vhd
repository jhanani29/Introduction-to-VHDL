----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2018 02:59:46 PM
-- Design Name: 
-- Module Name: accum - Behavioral
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
--library UNISIM;
--use UNISIM.VComponents.all;

entity accum is
  Port (  clk,rst : in std_logic;                                    
          operand1 : in STD_LOGIC_VECTOR(15 DOWNTO 0);
          operand2 : in STD_LOGIC_VECTOR(15 DOWNTO 0);
          operator : in STD_LOGIC_VECTOR(3 DOWNTO 0);
          result : out STD_LOGIC_VECTOR(15 DOWNTO 0);
          status : out STD_LOGIC_VECTOR(7 DOWNTO 0)                    
          );
end accum;

architecture Behavioral of accum is
 signal state : std_logic_vector(15 downto 0);                              
 
 component alu is
  Port  (  operand1 : in STD_LOGIC_VECTOR(15 DOWNTO 0);
           operand2 : in STD_LOGIC_VECTOR(15 DOWNTO 0);
           operator : in STD_LOGIC_VECTOR(3 DOWNTO 0);
           result : out STD_LOGIC_VECTOR(15 DOWNTO 0);
           status : out STD_LOGIC_VECTOR(7 DOWNTO 0) );
 end component;
  
 signal acc_next: std_logic_vector(15 downto 0);
 
 begin     
  process(clk)                                                      
   variable st : std_logic_vector(15 downto 0);
   begin        
    if rst = '1' then                                                     --if the reset is one then the initial value is st is operand1 
     st := operand1;                               
    elsif rising_edge(clk) then                                           --For every clock rising edge the acc_next is stored in st
      st := acc_next;
    end if; 
    state<=st;                                                            -- st is stored in state
  end process;
  
  a1: alu port map(state,operand2,operator,acc_next,status);                  --passing input accumulator to ALU and storing the output in the ALU_out
  result<=acc_next;                                                           --The output ALU_out is stored in the result

end Behavioral;
