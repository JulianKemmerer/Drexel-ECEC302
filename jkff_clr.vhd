--Entity descrip
entity JKFF_CLR is
  port(J,K,CLK,CLR:in bit; Q,QBAR:buffer bit);
end JKFF_CLR;

architecture struc of JKFF_CLR is --using basic gates
component JKFF
  port(J,K,CLK:in bit; Q,QBAR:buffer bit);
end component;

component AND2
  port(A,B:in bit; C:out bit);
end component;

component OR2
  port(A,B:in bit; C:out bit);
end component;

--Struc descrip of JKFF
signal JKFF_Q,JKFF_QBAR:bit;
signal A1_S,A2_S,O1_S,KBAR,CLRBAR:bit; --signals are connecting wires
begin
  --Inputs al the same
  JKFF1:JKFF port map(J,K,CLK,JKFF_Q,JKFF_QBAR);
  CLRBAR <= not CLR;
  
  --CLR part
  A1:AND2 port map(JKFF_Q,CLRBAR,Q);
  O1:OR2 port map(JKFF_QBAR,CLR,QBAR);
end struc;
