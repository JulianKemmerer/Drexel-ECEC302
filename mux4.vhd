library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4 is
port(X:in STD_LOGIC_VECTOR(3 downto 0); SEL:in STD_LOGIC_VECTOR(1 downto 0); EN:in STD_LOGIC; Y:out STD_LOGIC);
end mux4;

architecture behav of mux4 is
begin
  process(X,SEL,EN)
  begin
    if EN='1' then
      if SEL="00" then
        Y<=X(0);
      elsif SEL="01" then
        Y<=X(1);
      elsif SEL="10" then
        Y<=X(2);
      else
        Y<=X(3);
      end if;
    else
      Y<='Z';
    end if;
  end process;
end behav;