--Entity descrip
entity DFF_PE is
  port(D,C:in bit; Q,QBAR:out bit);
end DFF_PE;

architecture struc of DFF_PE is --using basic gates
component SRC
  port(S,R,C:in bit; Q,QBAR:buffer bit); --Buffer to 'read' output
end component;

component D_LATCH
  port(D,C:in bit; Q,QBAR:out bit);
end component;

--Struc descrip of DFF_PE
signal CBAR,QS,QBARR:bit; --signals are connecting wires
begin
  CBAR <= not C;
  D1:D_LATCH port map(D,CBAR,QS,QBARR);
  SRC1:SRC port map(QS,QBARR,C,Q,QBAR);
end struc;
