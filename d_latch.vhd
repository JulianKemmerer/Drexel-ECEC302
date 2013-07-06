--Entity descrip
entity D_LATCH is
  port(D,C:in bit; Q,QBAR:out bit);
end D_LATCH;

architecture struc of D_LATCH is --using basic gates
component SRC
  port(S,R,C:in bit; Q,QBAR:buffer bit); --Buffer to 'read' output
end component;

--Struc descrip of D_LATCH
signal DBAR:bit; --signals are connecting wires
begin
  DBAR <= not D;
  SRC1:SRC port map(D,DBAR,C,Q,QBAR);
end struc;
