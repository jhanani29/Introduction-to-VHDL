

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity gates is
  Port (
  A : in std_logic;
  B : in std_logic;
  C : in std_logic;
  D : in std_logic;
  L1 : out std_logic;
  L2 : out std_logic;
  L3 : out std_logic;
  L4 : out std_logic
   );
end gates;

architecture Behavioral of gates is

begin
L1 <= not A;
L2 <= B and (not C);
L3 <= ((B and (not C)) or ( C and D ) );
L4 <= C and D;

end Behavioral;
