entity NAND2 is
  port(A,B:in bit; C:out bit);
end NAND2;

architecture df of NAND2 is
begin
    C <= A nand B after 1 ns;
end df;
