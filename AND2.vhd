entity AND2 is
  port(A,B:in bit; C:out bit);
end AND2;

architecture df of AND2 is
begin
    C <= A and B;
end df;
