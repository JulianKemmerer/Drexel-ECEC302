--Julian Kemmerer
--ECEC 302 Midterm
--3 Bit JKFF Cotuner
--5/3/12

entity jk3bitcounter is
  port(COUNT,CLR:in bit; Z0,Z1,Z2:out bit);
end jk3bitcounter;

architecture struc of jk3bitcounter is
  
component JK_FF_CLR is
  port(J,K,CLK,CLR:in bit; Q,QBAR:buffer bit);
end component;


signal HIGH,LOW,JK0_1,JK1_2,DUMMYSIG:bit;
begin
  HIGH <='1';
  LOW <= '0';
  
  JKFF0:JK_FF_CLR port map(HIGH,HIGH,COUNT,CLR,Z0,JK0_1);
  JKFF1:JK_FF_CLR port map(HIGH,HIGH,JK0_1,CLR,Z1,JK1_2);
  JKFF2:JK_FF_CLR port map(HIGH,HIGH,JK1_2,CLR,Z2,DUMMYSIG);


end struc;