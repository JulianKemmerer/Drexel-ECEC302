--Modelsim Tutorial
--Julian Kemmerer
--ECEC 302
--4/5/12
entity or3 is
  port(a,b,c:in bit; z:out bit);
  end or3;
  architecture df of or3 is
    begin
      z <= a or b or c after 10 ns;
    end df;
