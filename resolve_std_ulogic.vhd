library ieee;
use ieee.std_logic_1164.all;
entity resolve_std_ulogic is
port(x,en:in std_ulogic_vector(1 downto 0);y:out std_ulogic);
end resolve_std_ulogic;
architecture struc of resolve_std_ulogic is
component tristate_ulogic 
port(x,en:in std_ulogic;y:out std_ulogic);
end component;
begin
T1:tristate_ulogic port map(x(1),en(1),y);
T2:tristate_ulogic port map(x(0),en(0),y);
end struc;