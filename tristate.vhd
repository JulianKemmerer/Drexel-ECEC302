library ieee;
use ieee.std_logic_1164.all;
entity tristate is
port(x,en:in std_logic;y:out std_logic);
end tristate;
architecture behav of tristate is
begin
process(x,en)
begin
if (en='1') then
y<=x;
else
y<='Z';
end if;
end process;
end behav;
