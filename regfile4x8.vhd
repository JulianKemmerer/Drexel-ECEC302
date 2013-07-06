library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity regfile4x8 is
  port(
  RW:in STD_LOGIC;  
  CLK:in STD_LOGIC;
  REGSEL:in STD_LOGIC_VECTOR(1 downto 0); 
  DATAIN:in STD_LOGIC_VECTOR(7 downto 0) ;
  DATAOUT:out STD_LOGIC_VECTOR(7 downto 0)
  );
end regfile4x8;


architecture struc of regfile4x8 is

component reg8bit
  port(
    LOAD:in STD_LOGIC;  --Gets a and b bar from decoder and RW
    CLK:in STD_LOGIC; -- gets CLK
    REGD:in STD_LOGIC_VECTOR(7 downto 0) ; -- gets datain
    REGQ:out STD_LOGIC_VECTOR(7 downto 0) -- split into muxes
  );
end component;

component a_and_bbar
  port(A:in STD_LOGIC; B:in STD_LOGIC; C:out STD_LOGIC);
end component;

component decoder2X4
  port(EN:in STD_LOGIC; SEL:in STD_LOGIC_VECTOR(1 downto 0); Z:out STD_LOGIC_VECTOR(3 downto 0)); 
end component;

component mux4
  port(X:in STD_LOGIC_VECTOR(3 downto 0); SEL:in STD_LOGIC_VECTOR(1 downto 0); EN:in STD_LOGIC; Y:out STD_LOGIC);
end component;

--SELDEC OUTPUT
signal SELDEC_OUT:STD_LOGIC_VECTOR(3 downto 0);
--AANDBBAR Output
signal AANDBBAR_OUT:STD_LOGIC_VECTOR(3 downto 0);
--Register Output
signal REG0_OUT:STD_LOGIC_VECTOR(7 downto 0);
signal REG1_OUT:STD_LOGIC_VECTOR(7 downto 0);
signal REG2_OUT:STD_LOGIC_VECTOR(7 downto 0);
signal REG3_OUT:STD_LOGIC_VECTOR(7 downto 0);
--Mux inputs
signal MUX0_IN:STD_LOGIC_VECTOR(3 downto 0);
signal MUX1_IN:STD_LOGIC_VECTOR(3 downto 0);
signal MUX2_IN:STD_LOGIC_VECTOR(3 downto 0);
signal MUX3_IN:STD_LOGIC_VECTOR(3 downto 0);
signal MUX4_IN:STD_LOGIC_VECTOR(3 downto 0);
signal MUX5_IN:STD_LOGIC_VECTOR(3 downto 0);
signal MUX6_IN:STD_LOGIC_VECTOR(3 downto 0);
signal MUX7_IN:STD_LOGIC_VECTOR(3 downto 0);

begin
  
  --SEL decoder
  --No appropriate enable, use CLK
  SELDEC:decoder2X4 port map(CLK,REGSEL,SELDEC_OUT);
    
  --A and BBAR components
  AANDBBAR0:a_and_bbar port map(SELDEC_OUT(0),RW,AANDBBAR_OUT(0));
  AANDBBAR1:a_and_bbar port map(SELDEC_OUT(1),RW,AANDBBAR_OUT(1));
  AANDBBAR2:a_and_bbar port map(SELDEC_OUT(2),RW,AANDBBAR_OUT(2)); 
  AANDBBAR3:a_and_bbar port map(SELDEC_OUT(3),RW,AANDBBAR_OUT(3));
  
  --8 Bit Register Components
  reg8bit0:reg8bit port map(AANDBBAR_OUT(0),CLK,DATAIN,REG0_OUT);
  reg8bit1:reg8bit port map(AANDBBAR_OUT(1),CLK,DATAIN,REG1_OUT);
  reg8bit2:reg8bit port map(AANDBBAR_OUT(2),CLK,DATAIN,REG2_OUT);
  reg8bit3:reg8bit port map(AANDBBAR_OUT(3),CLK,DATAIN,REG3_OUT);
  
 
  --Form MUX IN signals
  MUX0_IN <= REG3_OUT(0)&REG2_OUT(0)&REG1_OUT(0)&REG0_OUT(0);
  MUX1_IN <= REG3_OUT(1)&REG2_OUT(1)&REG1_OUT(1)&REG0_OUT(1);
  MUX2_IN <= REG3_OUT(2)&REG2_OUT(2)&REG1_OUT(2)&REG0_OUT(2);
  MUX3_IN <= REG3_OUT(3)&REG2_OUT(3)&REG1_OUT(3)&REG0_OUT(3);
  MUX4_IN <= REG3_OUT(4)&REG2_OUT(4)&REG1_OUT(4)&REG0_OUT(4);
  MUX5_IN <= REG3_OUT(5)&REG2_OUT(5)&REG1_OUT(5)&REG0_OUT(5);
  MUX6_IN <= REG3_OUT(6)&REG2_OUT(6)&REG1_OUT(6)&REG0_OUT(6);
  MUX7_IN <= REG3_OUT(7)&REG2_OUT(7)&REG1_OUT(7)&REG0_OUT(7);
  
  
  --8, 4x1 Muxes to dataout
  mux_0:mux4 port map(MUX0_IN,REGSEL,RW,DATAOUT(0));
  mux_1:mux4 port map(MUX1_IN,REGSEL,RW,DATAOUT(1));
  mux_2:mux4 port map(MUX2_IN,REGSEL,RW,DATAOUT(2));
  mux_3:mux4 port map(MUX3_IN,REGSEL,RW,DATAOUT(3));
  mux_4:mux4 port map(MUX4_IN,REGSEL,RW,DATAOUT(4));
  mux_5:mux4 port map(MUX5_IN,REGSEL,RW,DATAOUT(5));
  mux_6:mux4 port map(MUX6_IN,REGSEL,RW,DATAOUT(6));
  mux_7:mux4 port map(MUX7_IN,REGSEL,RW,DATAOUT(7));
  
  
  
end struc;
