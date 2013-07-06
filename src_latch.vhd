--Entity descrip
entity SRC is
  port(S,R,C:in bit; Q,QBAR:buffer bit); --Buffer to 'read' output
end SRC;

architecture struc of SRC is --using basic gates
component NAND2
  port(A,B:in bit; C:out bit);
end component;

--Struc descrip of SRC
signal SNANDC,CNANDR:bit; --signals are connecting wires
begin
  NA1:NAND2 port map(S,C,SNANDC);
  NA2:NAND2 port map(SNANDC ,QBAR ,Q );
  NA3:NAND2 port map(C ,R ,CNANDR );
  NA4:NAND2 port map(CNANDR ,Q ,QBAR );
end struc;


    
