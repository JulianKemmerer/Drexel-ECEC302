  entity HA is
    port(A,B:in bit; S,C:out bit);
    end HA;
    
  architecture df of HA is
    begin
      S <= A or B;
      C <= A and B;
    end df;