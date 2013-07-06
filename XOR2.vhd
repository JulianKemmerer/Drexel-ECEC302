entity XOR2 is
  port(A,B:in bit; C:out bit);
end XOR2;

architecture df of XOR2 is
begin
    C <= A xor B;
end df;
