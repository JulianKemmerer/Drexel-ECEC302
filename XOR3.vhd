entity XOR3 is
  port(A,B,C:in bit; Z:out bit);
end XOR3;

architecture df of XOR3 is
begin
    Z <= A xor B xor C;
end df;
