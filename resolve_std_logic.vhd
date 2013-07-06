library ieee;
use ieee.std_logic_1164.all;
entity resolve_std_logic is
port(x,en:in std_logic_vector(1 downto 0);y:out std_logic);
end resolve_std_logic;
architecture struc of resolve_std_logic is
component tristate 
port(x,en:in std_logic;y:out std_logic);
end component;
begin
T1:tristate port map(x(1),en(1),y);
T2:tristate port map(x(0),en(0),y);
end struc;