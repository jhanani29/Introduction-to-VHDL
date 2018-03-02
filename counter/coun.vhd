
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
Port ( clk: in std_logic;
reset: in std_logic;
q: inout std_logic_vector(3 downto 0) );
end counter;

architecture Behavioral of counter is
signal up: std_logic_vector(3 downto 0) := "0011";

begin
process(clk,reset)
begin
if (reset = '1') then 
up <= "0011";
elsif (clk = '1') then
if up = "1100" then up <= "0011";
else
up <= up + 1;
end if;
end if;

--logic

end process; 
q <= up;



end Behavioral;