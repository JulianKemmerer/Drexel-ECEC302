entity grayctr is
port(count,clr:in bit;A,B,C:buffer bit);
end grayctr;
architecture struc of grayctr is
component jkffstruc 
port(j,k,clk,clr:in bit;q,qbar:buffer bit);
end component;
signal JA,KA,JB,KB,JC,KC:bit;
begin
JA<=B and not C;
KA<=not B and not C;
JB<=not A and C;
KB<=A and C;
JC<=A xnor B;
KC<=A xor B;
J1:jkffstruc port map(JA,KA,count,clr,A,open);
J2:jkffstruc port map(JB,KB,count,clr,B,open);
J3:jkffstruc port map(JC,KC,count,clr,C,open);
end struc;