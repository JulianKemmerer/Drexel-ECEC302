--Entity descrip
entity DFF_PE_CLR is
  port(D,C,CLR:in bit; Q,QBAR:out bit);
end DFF_PE_CLR;

architecture struc of DFF_PE_CLR is
component DFF_PE is
  port(D,C:in bit; Q,QBAR:out bit);
end component;

component AND2
  port(A,B:in bit; C:out bit);
end component;

component OR2
  port(A,B:in bit; C:out bit);
end component;

signal CLRBAR,Q0,QBAR0:bit;
begin
  CLRBAR <= not CLR;
  DFF0:DFF_PE port map(D,C,Q0,QBAR0);
  A1:AND2 port map(Q0,CLRBAR,Q);
  O1:OR2 port map(CLR,QBAR0,QBAR);
end struc;
