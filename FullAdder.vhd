--Entity descrip
entity FA is
  port(A,B,CIN:in bit; SUM,COUT:out bit);
end FA;

architecture struc of FA is --using basic gates
component OR2
  port(A,B:in bit; C:out bit);
end component;

component XOR2
  port(A,B:in bit; C:out bit);
end component;

component AND2
  port(A,B:in bit; C:out bit);
end component;

--Struc descrip of FA
signal S1,S2,S3:bit; --signals are connecting wires
begin
  X1:XOR2 port map(A,B,S1);
  X2:XOR2 port map(S1,CIN,SUM);
  A1:AND2 port map(S1,CIN,S2);
  O1:OR2 port map(S2,S3,COUT);
end struc;


    