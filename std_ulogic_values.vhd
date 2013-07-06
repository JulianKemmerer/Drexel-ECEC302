library ieee;
use ieee.std_logic_1164.all;
entity std_ulogic_values is
  port(A:out std_ulogic);
  end std_ulogic_values;
  architecture behav of std_ulogic_values is
    begin
      process
        begin
          A<='U','X' after 100 ns,'0' after 200 ns,'1' after 300 ns,'Z' after 400 ns,'W' after 500 ns, 'L' after 600 ns,'H' after 700 ns, '-' after 800 ns;
          wait for 900 ns;
        end process;
      end behav;