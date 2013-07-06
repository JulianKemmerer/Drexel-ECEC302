entity OR2 is
  port(A,B:in bit; C:out bit);
end OR2;

architecture df of OR2 is
begin
    C <= A or B;
end df;
