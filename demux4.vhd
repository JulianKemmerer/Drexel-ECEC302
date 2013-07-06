entity demux4 is
port(X,S0,S1:in bit;Y0,Y1,Y2,Y3:out bit);
end demux4;

architecture struc of demux4 is
component INV
port(A:in bit;B:out bit);
end component;
component AND3
  port(a,b,c:in bit;x:out bit);
end component;

signal S0INV,S1INV:bit;
begin
I1:INV port map(S0,S0INV);
I2:INV port map(S1,S1INV);
A0:AND3 port map(S0INV,S1INV,X,Y0);
A1:AND3 port map(S0,S1INV,X,Y1);
A2:AND3 port map(S0INV,S1,X,Y2);
A3:AND3 port map(S0,S1,X,Y3);
end struc;