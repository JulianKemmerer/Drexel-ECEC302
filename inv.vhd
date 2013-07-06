entity inv is
port(A:in bit;B:out bit);
end inv;
architecture df of inv is
begin
B<= not A;
end df;
