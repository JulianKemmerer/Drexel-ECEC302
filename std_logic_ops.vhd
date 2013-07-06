library ieee;
use ieee.std_logic_1164.all;
entity std_logic_ops is
port(A,B:in std_logic;C,D,E:out std_logic);
end std_logic_ops;
architecture df of std_logic_ops is
begin
C<=A and B;
D<=A or B;
E<=not A;
end df;