library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dff_en is
    Port ( D : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           EN : in STD_LOGIC;
           Q : out  STD_LOGIC);
end dff_en;


architecture Behavioral of dff_en is
begin

P1: process(D,CLK)
begin
	--Clock 	      D 	Qnext
	--Rising edge 	0 	0
	--Rising edge 	1 	1
	--Non-Rising 	X 	Q
	
	--Only do something if enabled
	if EN='1' then
	 --If called and BTNCLK is high and event -> rising edge
	 if CLK='1' and CLK'event then
		  Q <= D;
	 end if;
	end if;
end process P1;
end Behavioral;
