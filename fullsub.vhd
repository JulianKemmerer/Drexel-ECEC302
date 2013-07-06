--Full Subtractor
--Julian Kemmerer
--ECEC 302
--4/10/12

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fullsub is
    Port ( X : in  STD_LOGIC;
           Y : in  STD_LOGIC;
           BIN : in  STD_LOGIC;
           D : out  STD_LOGIC;
           BOUT : out  STD_LOGIC);
end fullsub;

architecture Behavioral of fullsub is
begin
	process(X,Y,BIN)
	begin
		D <= X xor Y xor BIN;
		BOUT <= (BIN and (not (X xor Y))) or (not X and Y);
	end process;
end Behavioral;

