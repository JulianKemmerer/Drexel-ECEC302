entity sbrblatch is
port(SB,RB:in bit;Q,QBAR:buffer bit);
end sbrblatch;
architecture struc of sbrblatch is 
component nand2
port(X,Y:in bit;Z:out bit);
end component;
begin
N1:nand2 port map(SB,QBAR,Q);
N2:nand2 port map(Q,RB,QBAR);
end struc;