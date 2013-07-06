--Entity descrip
entity JKFF is
  port(J,K,CLK:in bit; Q,QBAR:buffer bit);
end JKFF;

architecture struc of JKFF is --using basic gates
component DFF_PE
  port(D,C:in bit; Q,QBAR:out bit);
end component;

component AND2
  port(A,B:in bit; C:out bit);
end component;

component OR2
  port(A,B:in bit; C:out bit);
end component;

--Struc descrip of JKFF
signal A1_S,A2_S,O1_S,KBAR:bit; --signals are connecting wires
begin
  KBAR <= not K;
  A1:AND2 port map(J,QBAR,A1_S);
  O1:OR2 port map(A1_S,A2_S,O1_S);
  A2:AND2 port map(KBAR,Q,A2_S);
  DFF1:DFF_PE port map(O1_S,CLK,Q,QBAR);
end struc;


