--Full Subtractor
--Julian Kemmerer
--ECEC 302
--4/5/12

--Entity descrip
entity FS is
  port(X,Y,BIN:in bit; D,BOUT:out bit);
end FS;

architecture struc of FS is --using basic gates
component OR2
  port(A,B:in bit; C:out bit);
end component;

component XOR2
  port(A,B:in bit; C:out bit);
end component;

component AND2
  port(A,B:in bit; C:out bit);
end component;

component XOR3
  port(A,B,C:in bit; Z:out bit);
end component;

--Struc descrip of FS
signal A1_S,XO2_S,A2_S,O1_S,XNOT_S,XO2NOT_S:bit; -- "_S" for signal
begin
  -- XOR1
  X01:XOR3 port map(X,Y,BIN,D);

  -- AND1
  XNOT_S <= not X;
  A1:AND2 port map(XNOT_S,Y,A1_S);
    
  --XOR2  
  X02:XOR2 port map(X,Y,XO2_S);
  
  --AND2
  XO2NOT_S <= not XO2_S;
  A2:AND2 port map(XO2NOT_S,BIN,A2_S);
    
  --OR 1
  O1:OR2 port map(A1_S,A2_S,BOUT);  
end struc;

