--Half Subtractor
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

entity HalfSubtractor is
    Port ( X : in  STD_LOGIC;
           Y : in  STD_LOGIC;
           D : out  STD_LOGIC;
           B : out  STD_LOGIC);
end HalfSubtractor;

architecture Behavioral of HalfSubtractor is
begin
	process(X,Y)
	begin
		D <= Y xor X;
		B <= not X and Y;
	end process;
end Behavioral;

