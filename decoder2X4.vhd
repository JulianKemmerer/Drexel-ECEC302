library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder2X4 is
  port(EN:in STD_LOGIC; SEL:in STD_LOGIC_VECTOR(1 downto 0); Z:out STD_LOGIC_VECTOR(3 downto 0)); 
    
  end decoder2X4;
  architecture behav of decoder2X4 is
  begin
    process(SEL)
      begin
        Z<="0000";
        if EN='1' then
          if SEL="00" then
            Z(0)<='1';
          elsif SEL="01" then
            Z(1)<='1';
          elsif SEL="10" then
            Z(2)<='1';
          else
            Z(3)<='1';
          end if;
        else
          null;
        end if;
      end process;
    end behav;
          
