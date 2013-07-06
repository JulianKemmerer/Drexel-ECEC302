--Entity descrip
entity JK_FF_CLR is
  port(J,K,CLK,CLR:in bit; Q,QBAR:buffer bit);
end JK_FF_CLR;

architecture struc of JK_FF_CLR is
component DFF_PE_CLR
  port(D,C,CLR:in bit; Q,QBAR:out bit);
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
  DFF1:DFF_PE_CLR port map(O1_S,CLK,CLR,Q,QBAR);
end struc;
