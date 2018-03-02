----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2018 02:53:03 PM
-- Design Name: 
-- Module Name: alu - Behavioral
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

entity alu is
  Port (operand1 : in STD_LOGIC_VECTOR(15 DOWNTO 0);
           operand2 : in STD_LOGIC_VECTOR(15 DOWNTO 0);
           operator : in STD_LOGIC_VECTOR(3 DOWNTO 0);
           result : out STD_LOGIC_VECTOR(15 DOWNTO 0);
           status : out STD_LOGIC_VECTOR(7 DOWNTO 0) );
end alu;

architecture Behavioral of alu is

begin
process(operator)                                                                --For every change in the operator the values are calculated
variable temp1 : std_logic_vector(17 downto 0);
  variable op1, op2 : std_logic_vector(8 downto 0);  
  variable opr1, opr2 : std_logic_vector(17 downto 0);
  variable t1 : std_logic_vector(17 downto 0); 
  variable ch : signed(15 downto 0); 
  begin
   opr1 :=  "00" & operand1 (15 downto 0);                                       --since I declared it as 17 bit I appended 2 zeros
    opr2 :=  "00" & operand2 (15 downto 0);
    op1 := '0' & opr1 (7 downto 0);
    op2 := '0' & opr2 (7 downto 0);  
   
      if operator = "0000" then                                                  --addition 
             temp1 :=  std_logic_Vector(unsigned(opr1) + unsigned(opr2));      
               
      elsif operator = "0001" then                                               --subtraction
             temp1 := std_logic_Vector(unsigned(opr1) - unsigned(opr2));
                                   
      elsif operator = "0010" then                                               --Multiplication
             temp1 :=  std_logic_Vector( unsigned(op1) * unsigned(op2));     
     
      elsif operator = "0011" then                                              --Increment 
             temp1 :=  std_logic_Vector( unsigned(opr1) + 1);
                      
      elsif operator = "0100" then                                              --decrement
             temp1 := std_logic_Vector(unsigned(opr1) - 1);
             
      elsif operator = "0101" then                                              --And
             temp1 :=  "00" & (operand1 and operand2); 
             
      elsif operator = "0110" then                                              --OR
             temp1 := "00" & (operand1 or operand2);
             
      elsif operator = "0111" then                                             --xor
             temp1 := "00" & (operand1 xor operand2);
        
      elsif operator = "1000" then                                             --not
             temp1 := "00" & (not operand1);
             
        
      elsif operator = "1001" then                                            --rotate left 
              temp1 := "00" & to_stdlogicvector(to_bitvector(operand1) rol to_integer(unsigned(operand2)));
                    
      elsif operator = "1010" then                                             --rotate right
              temp1 := "00" & to_stdlogicvector(to_bitvector(operand1) ror to_integer(unsigned(operand2)));
                          
      else
            null;        
          end if ;      

   
  --copying res to result
    result <= temp1(15 downto 0);                                              --I copied 15 bits to result
   
      
    status <= x"00";                                                           --Initialising status bit to 00 hexadecimal 
    ch := signed(temp1(15 downto 0));                                          
    
        --setting zero flag
           if ch = 0 then            
              status(0) <= '1';
           else 
              status(0) <= '0';
           end if;
           
        --Setting carry bit status   
           if temp1(16) = '1' then 
              status(1) <= '1';
           else
              status(1) <= '0';
           end if;
                          
       --setting negative flag         
           if (ch<-1) then 
             status(2) <= '1';
           else              
             status(2) <= '0';
           end if;  
   
       --setting overflow flag 
              if temp1(17) = '1' then 
                status(3) <= '1';
              else 
                status(3) <= '0';
              end if;
   
end process;
end Behavioral;
