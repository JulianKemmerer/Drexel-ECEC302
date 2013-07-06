entity tff is
port(clk,clr,t:in bit;q,qbar:buffer bit);
end tff;
architecture df of tff is
signal temp:bit;
begin
temp<=q;
q<='0' when clr='1' else
temp xor t when clr='0' and clk='1' and clk'event else
q;
qbar<=not q;
end df;
