entity FA is
port(A,B,CIN:in bit;SUM,COUT:out bit);
end FA;

architecture struc1 of FA is -- using 2 half adders
component HA is
port(A,B:in bit; S,C:out bit);
end component;
component OR2 is
port(A,B:in bit; C:out bit);
end component;
signal S1,S2,S3:bit;
begin
H1: HA port map(A,B,S1,S2);
H2:HA port map(S1,CIN,SUM,S3);
O1:OR2 port map(S2,S3,COUT);
end struc1;

architecture struc2a of FA is -- using basic gates
component or2
  port(A,B:in bit; C:out bit);
end component;
component xor2
  port(A,B:in bit; C:out bit);
end component;
component and2
  port(A,B:in bit; C:out bit);
end component;
signal S1,S2,S3:bit;
begin
  X1:xor2 port map(A,B,S1);
  X2:xor2 port map(S1,CIN,SUM);
  A1:and2 port map(S1,CIN,S2);
  A2:and2 port map(A,B,S3);
  O1:or2 port map(S2,S3,COUT);
end struc2a;

architecture struc2b of FA is -- using basic gates
component or3
  port(A,B,C:in bit; Z:out bit);
end component;
component xor2
  port(A,B:in bit; C:out bit);
end component;
component and2
  port(A,B:in bit; C:out bit);
end component;
signal S1,S2,S3,S4:bit;
begin
   X1:xor2 port map(A,B,S1);
   X2:xor2 port map(S1,CIN,SUM);
   A1:and2 port map(A,B,S2);
   A2:and2 port map(A,CIN,S3);
   A3:and2 port map(B,CIN,S4);
   O1:or3 port map(S2,S3,S4,COUT);
 end struc2b;
 
architecture df of FA is
begin
   SUM<= A xor B xor CIN;
   COUT<= (A and B) or (A and CIN) or (B and CIN);
end df;

architecture behav of FA is
     begin
     process(A,B,CIN)
       begin
         SUM<= A xor B xor CIN;
         COUT<= (A and B) or (A and CIN) or (B and CIN);
     end process;
end behav;
 

    


