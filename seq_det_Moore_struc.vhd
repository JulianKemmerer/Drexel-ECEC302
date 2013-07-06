-- This is a Moore machine to detect "101"
-- First make clr='1' and x='0' and run once without clk
-- Then make clr='0' and set rising edge clock and input the sequence on x
library ieee;
use ieee.std_logic_1164.all;
entity seq_det_Moore_struc is
port(x,clk,clr:in std_logic;y:out std_logic);
end seq_det_Moore_struc;

architecture structff of seq_det_Moore_struc is
component tffclr
port(clk,clr,t:in std_logic;q,qbar:buffer std_logic);
end component;
signal T0,T1,Z0,Z1:std_logic;
begin
T1<= (Z0 and not x) or (Z1 and not x) or (Z0 and Z1);
T0<= x xor Z0;
TF1:tffclr port map(clk,clr,T1,Z1,open);
TF0:tffclr port map(clk,clr,T0,Z0,open);
y<=Z0 and Z1;
end structff;

-- In this architecture clr needs a clock
architecture strucdff of seq_det_Moore_struc is
  component dffclr
    port(d,ck,clr:in std_logic; q:out std_logic);
    end component;
    signal D0,D1,Z0,Z1:std_logic;
    begin
      D0<=x;
      D1<=(not Z1 and Z0 and not x) or (Z1 and not Z0 and x);
      DF1:dffclr port map(D1,clk,clr,Z1);
        DF0:dffclr port map(D0,clk,clr,Z0);
          y<=Z0 and Z1;
        end strucdff;
        
        architecture strucjkff of seq_det_Moore_struc is
          component jkffdf
          port(j,k,clk,clr:in std_logic;Q,QBAR:buffer std_logic);
          end component;
          signal J0,K0,J1,K1,Z0,Z1:std_logic;
          begin
            JF1:jkffdf port map(J1,K1,clk,clr,Z1,open);
              JF0:jkffdf port map(J0,K0,clk,clr,Z0,open);
                J1<=not x and Z0;
                K1<=not x or Z0;
                J0<=x;
                K0<=not x;
                y<=Z0 and Z1;
              end strucjkff;
              