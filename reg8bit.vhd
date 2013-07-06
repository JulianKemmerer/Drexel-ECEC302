library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg8bit is
  port(
  LOAD:in STD_LOGIC;  
  CLK:in STD_LOGIC; 
  REGD:in STD_LOGIC_VECTOR(7 downto 0) ;
  REGQ:out STD_LOGIC_VECTOR(7 downto 0)
  );
end reg8bit;


architecture struc of reg8bit is

component dff_en
  Port ( 
            D : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           EN : in STD_LOGIC;
           Q : out  STD_LOGIC
        );
end component;


begin
  
  DFF0:dff_en port map(REGD(0),CLK,LOAD,REGQ(0));
  DFF1:dff_en port map(REGD(1),CLK,LOAD,REGQ(1));
  DFF2:dff_en port map(REGD(2),CLK,LOAD,REGQ(2));
  DFF3:dff_en port map(REGD(3),CLK,LOAD,REGQ(3));
  DFF4:dff_en port map(REGD(4),CLK,LOAD,REGQ(4));
  DFF5:dff_en port map(REGD(5),CLK,LOAD,REGQ(5));
  DFF6:dff_en port map(REGD(6),CLK,LOAD,REGQ(6));
  DFF7:dff_en port map(REGD(7),CLK,LOAD,REGQ(7));
  
end struc;