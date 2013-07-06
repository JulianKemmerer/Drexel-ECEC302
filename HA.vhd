entity HA is
port(A,B:in bit;S,C:out bit);
end HA;

architecture struc of HA is
component AND2
port(A,B:in bit;C:out bit);
end component;
component XOR2
port(A,B:in bit;C:out bit);
end component;
begin
X1:XOR2 port map(A,B,S);
A1:AND2 port map(A,B,C);
end struc;

architecture df of HA is
begin
   S<=A xor B;
   C<=A and B;
end df;

architecture behav of HA is
begin
process(A,B)
begin
   S<=A xor B;
   C<=A and B;
end process;
end behav;
   

