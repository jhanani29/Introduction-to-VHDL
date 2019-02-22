library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fixed_prio is
port(
 req: in std_logic_vector(9 downto 0); 
 cin : in std_logic;
 g0 :  out std_logic;
 g1 :  out std_logic;
 g2 :  out std_logic;
 g3 :  out std_logic;
 g4 :  out std_logic;
 g5 :  out std_logic;
 g6 :  out std_logic;
 g7 :  out std_logic;
 g8 :  out std_logic;
 g9 :  out std_logic
 );
end fixed_prio;

architecture Behavioral of fixed_prio is
 signal a,b : std_logic;
begin 
   g0 <= req(0) and cin;
   g1 <= (not req(0)) and (req(1)) and cin;
   g2<= req(2) and (not req(1)) and (not req(0)) and cin;
   g3 <=  req(3) and (not req(2)) and (not req(1)) and (not req(0)) and cin;
   g4 <= req(4) and (not req(3)) and (not req(2)) and (not req(1)) and (not req(0)) and cin; 
   g5 <= req(5) and (not req(4)) and (not req(3)) and (not req(2)) and (not req(1)) and (not req(0)) and cin;
   g6 <= req(6) and (not req(5)) and (not req(4)) and (not req(3)) and (not req(2)) and (not req(1)) and (not req(0)) and cin;
   g7 <= req(7) and (not req(6)) and (not req(5)) and (not req(4)) and (not req(3)) and (not req(2)) and (not req(1)) and (not req(0)) and cin; 
   g8 <= req(8) and (not req(7)) and (not req(6)) and (not req(5)) and (not req(4)) and (not req(3)) and (not req(2)) and (not req(1)) and (not req(0)) and cin; 
   g9 <= req(9) and (not req(8)) and (not req(7)) and (not req(6)) and (not req(5)) and (not req(4)) and (not req(3)) and (not req(2)) and (not req(1)) and (not req(0)) and cin; 
end Behavioral;
