entity comparator2 is
port(A1,A0,B1,B0:in bit;
     LT,EQ,GT:out bit);
     end comparator2;
     
     architecture df of comparator2 is
     begin
     LT<='1' when A1&A0<B1&B0 else
     '0';
     EQ<='1' when A1&A0=B1&B0 else
     '0';
     GT<='1' when A1&A0>B1&B0 else
     '0';
     end df;
     
     architecture behav of comparator2 is
     begin
       process(A1,A0,B1,B0)
         begin
           EQ<=(A1 xnor B1) and (A0 xnor B0);
           GT<=(A1 and not B1) or ((A1 xnor B1) and A0 and not B0);
           LT<=(not A1 and B1) or ((A1 xnor B1) and not A0 and B0);
         end process;
       end behav;
