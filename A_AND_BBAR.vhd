library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity a_and_bbar is
  port(A:in STD_LOGIC; B:in STD_LOGIC; C:out STD_LOGIC);
end a_and_bbar;

architecture behav of a_and_bbar is
begin
  process(A,B)
  begin
    C<= A and (not B);
  end process;
end behav;
