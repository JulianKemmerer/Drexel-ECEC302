--FPGA Tutorial
--Julian Kemmerer
--ECEC 302
--4/5/12

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux is
    Port ( x0 : in  STD_LOGIC;
           x1 : in  STD_LOGIC;
           x2 : in  STD_LOGIC;
           x3 : in  STD_LOGIC;
           s0 : in  STD_LOGIC;
           s1 : in  STD_LOGIC;
           y : out  STD_LOGIC);
end mux;

architecture Behavioral of mux is

begin

process(x0,x1,x2,x3,s0,s1)
	begin
		if s0='0' and s1='0' then
			y<=x0;
		elsif s0='1' and s1='0' then
			y<=x1;
		elsif s0='0' and s1='1' then
			y<=x2;
		elsif s0='1' and s1='1' then
			y<=x3;
		else
			y<='0';
		end if;
	end process;

end Behavioral;

