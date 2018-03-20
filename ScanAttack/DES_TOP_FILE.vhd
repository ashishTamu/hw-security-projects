library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity des4syn is port
(
reset : in std_logic; DU,EN : in STD_LOGIC;
clk : in std_logic; OUTDIGIT: out STD_LOGIC_VECTOR (7 downto 0);
test_enable : in std_logic;
scan_clk : in std_logic; 
ShiftDR : in std_logic;
UpdateDR : in std_logic;
CaptureDR : in std_logic;
scan_in : in std_logic;
scan_out : out std_logic;
ANODE : out STD_LOGIC_VECTOR (3 downto 0);
ct: in std_logic_vector(1 to 64)
);
end des4syn;
architecture behavior of des4syn is
--Cypher Text & Key Initialization 
-----------------For Encoding ------------------------------
--signal ct : std_logic_vector(1 TO 64):=x"1234567890abcdef"; 
--signal key : std_logic_vector(1 TO 64):=x"abbcccddddeeeeef"; 
---------------- For Decoding -------------------------------
--signal ct : std_logic_vector(1 TO 64):=x"e9ed57f7b1bebeb8"; 
--signal key : std_logic_vector(1 TO 64):=x"abbcccddddeeeeef"; 
signal pt :  std_logic_vector(1 TO 64);
signal key : std_logic_vector(1 TO 64):=x"033457799bbcdef1"; 


component Dec2LED 
port (CLK: in STD_LOGIC; X: in STD_LOGIC_VECTOR (3 downto 0); Y: out STD_LOGIC_VECTOR (7 downto 0)); 
end component; 
 
signal DIGIT : STD_LOGIC_VECTOR(7 downto 0) :="00000000";
type arr is array(0 to 22) of std_logic_vector(7 downto 0);
signal NAME: arr;
type ARR2 is array(0 to 3) of std_logic_vector(7 downto 0);
signal TMPDGT: ARR2;
signal TEMP: STD_LOGIC_VECTOR(3 downto 0) :="0111";
signal CLKM : STD_LOGIC :='0';
signal Z : integer :=0;
signal G : integer :=30;
signal NAMEA : integer :=3;
signal NAMEB : integer :=2;
signal NAMEC : integer :=1;
signal NAMED : integer :=0;
signal pt1:STD_LOGIC_VECTOR(64 downto 0);

signal k1x,k2x,k3x,k4x,k5x,k6x,k7x,k8x,k9x,k10x,k11x,k12x,k13x,k14x,k15x,k16x
: std_logic_vector(1 to 48);
signal
l0xa,l1x,l2x,l3x,l4x,l5x,l6x,l7x,l8x,l9x,l10x,l11x,l12x,l13x,l14x,l15x,l16x
: std_logic_vector(1 to 32);
signal
r0xa,r1x,r2x,r3x,r4x,r5x,r6x,r7x,r8x,r9x,r10x,r11x,r12x,r13x,r14x,r15x,r16x
: std_logic_vector(1 to 32);

signal l0xa_after_scan_chain, r0xa_after_scan_chain, l1x_after_scan_chain, r1x_after_scan_chain : std_logic_vector(1 to 32);
signal l2x_after_scan_chain, r2x_after_scan_chain : std_logic_vector(1 to 32);
signal l3x_after_scan_chain, r3x_after_scan_chain : std_logic_vector(1 to 32);
signal scan_out1,scan_out2 : std_logic;
component keysched
port (
key : in std_logic_vector(1 to 64);EN: in std_logic;
k1x,k2x,k3x,k4x,k5x,k6x,k7x,k8x,k9x,k10x,k11x,k12x,k13x,k14x,k15x,k16x
: out std_logic_vector(1 to 48)
);
end component;
component ip
port (
ct : in std_logic_vector(1 TO 64);
l0x : out std_logic_vector(1 TO 32);
r0x : out std_logic_vector(1 TO 32)
);
end component;
component roundfunc
port (
clk : in std_logic;
reset : in std_logic;
li,ri : in std_logic_vector(1 to 32);
k : in std_logic_vector(1 to 48);
lo,ro : out std_logic_vector(1 to 32)
);
end component;

component fp
port (
l,r : in std_logic_vector(1 to 32);
pt : out std_logic_vector(1 to 64)
);
end component;

component scan_chain
port (
scan_clk : in std_logic;
reset : in std_logic;
test_enable : in std_logic;
ShiftDR : in std_logic;
UpdateDR : in std_logic;
CaptureDR : std_logic;
scan_in : in std_logic;
li_in,ri_in : in std_logic_vector(1 to 32);
lo_in,ro_in : in std_logic_vector(1 to 32);
li_dataout,ri_dataout: out std_logic_vector(1 to 32);
lo_dataout,ro_dataout : out std_logic_vector(1 to 32);
scan_out : out std_logic
);
end component;


begin


keyscheduling: keysched port map ( key=>key,EN=>EN, k1x=>k16x,k2x=>k15x, k3x=>k14x, k4x=>k13x, k5x=>k12x, k6x=>k11x, k7x=>k10x,k8x=>k9x, k9x=>k8x, k10x=>k7x, k11x=>k6x, k12x=>k5x, k13x=>k4x,k14x=>k3x, k15x=>k2x, k16x=>k1x );
--keyscheduling: keysched port map ( key=>key,EN=>EN, k1x=>k1x,k2x=>k2x, k3x=>k3x, k4x=>k4x, k5x=>k5x, k6x=>k6x, k7x=>k7x,k8x=>k8x, k9x=>k9x, k10x=>k10x, k11x=>k11x, k12x=>k12x, k13x=>k13x,k14x=>k14x, k15x=>k15x, k16x=>k16x );
iperm: ip port map ( ct=>ct,l0x=>l0xa, r0x=>r0xa );
--scanchain: scan_chain port map (clk=>clk, reset=>reset,test_enable => test_enable, scan_in => scan_in, scan_out => scan_out, li_in => l0xa , ri_in => r0xa,lo_in => l1x , ro_in => r1x, li_scanout_d=> l0xa_after_scan_chain, ri_scanout_d => r0xa_after_scan_chain , lo_scanout_d=> l1xa_after_scan_chain, ro_scanout_d => r1xa_after_scan_chain );
--round1: roundfunc port map ( clk=>clk, reset=>reset,li=>l0xa_after_scan_chain, ri=>r0xa_after_scan_chain, k=>k1x, lo=>l1x, ro=>r1x );
round1: roundfunc port map ( clk=>clk, reset=>reset,li=>l0xa_after_scan_chain, ri=>r0xa_after_scan_chain, k=>k1x, lo=>l1x, ro=>r1x );
scanchain: scan_chain port map (scan_clk => scan_clk,CaptureDR=>CaptureDR,  UpdateDR=>UpdateDR,ShiftDR=>ShiftDR, reset=>reset,test_enable => test_enable, scan_in => scan_in, scan_out => scan_out1, li_in => l0xa , ri_in => r0xa,lo_in => l1x , ro_in => r1x, li_dataout=> l0xa_after_scan_chain, ri_dataout => r0xa_after_scan_chain , lo_dataout=> l1x_after_scan_chain, ro_dataout => r1x_after_scan_chain );
round2: roundfunc port map ( clk=>clk, reset=>reset,li=>l1x_after_scan_chain, ri=>r1x_after_scan_chain, k=>k2x, lo=>l2x, ro=>r2x );
round3: roundfunc port map ( clk=>clk, reset=>reset,li=>l2x_after_scan_chain, ri=>r2x_after_scan_chain, k=>k3x, lo=>l3x, ro=>r3x );
scanchain1: scan_chain port map (scan_clk => scan_clk,CaptureDR=>CaptureDR,  UpdateDR=>UpdateDR,ShiftDR=>ShiftDR, reset=>reset,test_enable => test_enable, scan_in => scan_out1, scan_out => scan_out, li_in => l2x , ri_in => r2x,lo_in => l3x , ro_in => r3x, li_dataout=> l2x_after_scan_chain, ri_dataout => r2x_after_scan_chain , lo_dataout=> l3x_after_scan_chain, ro_dataout => r3x_after_scan_chain );
--scanchain2: scan_chain port map (scan_clk => scan_clk,CaptureDR=>CaptureDR,  UpdateDR=>UpdateDR,ShiftDR=>ShiftDR, reset=>reset,test_enable => test_enable, scan_in => scan_out2, scan_out => scan_out, li_in => l2x , ri_in => r2x,lo_in => l3x , ro_in => r3x, li_dataout=> l2x_after_scan_chain, ri_dataout => r2x_after_scan_chain , lo_dataout=> l3x_after_scan_chain, ro_dataout => r3x_after_scan_chain );
round4: roundfunc port map ( clk=>clk, reset=>reset,li=>l3x_after_scan_chain, ri=>r3x_after_scan_chain, k=>k4x, lo=>l4x, ro=>r4x );
round5: roundfunc port map ( clk=>clk, reset=>reset,li=>l4x, ri=>r4x, k=>k5x, lo=>l5x, ro=>r5x );
round6: roundfunc port map ( clk=>clk, reset=>reset,li=>l5x, ri=>r5x, k=>k6x, lo=>l6x, ro=>r6x );
round7: roundfunc port map ( clk=>clk, reset=>reset,li=>l6x, ri=>r6x, k=>k7x, lo=>l7x, ro=>r7x );
round8: roundfunc port map ( clk=>clk, reset=>reset,li=>l7x, ri=>r7x, k=>k8x, lo=>l8x, ro=>r8x );
round9: roundfunc port map ( clk=>clk, reset=>reset,li=>l8x, ri=>r8x, k=>k9x, lo=>l9x, ro=>r9x );
round10: roundfunc port map ( clk=>clk, reset=>reset,li=>l9x, ri=>r9x, k=>k10x, lo=>l10x, ro=>r10x );
round11: roundfunc port map ( clk=>clk, reset=>reset,li=>l10x, ri=>r10x, k=>k11x, lo=>l11x, ro=>r11x );
round12: roundfunc port map ( clk=>clk, reset=>reset,li=>l11x, ri=>r11x, k=>k12x, lo=>l12x, ro=>r12x );
round13: roundfunc port map ( clk=>clk, reset=>reset,li=>l12x, ri=>r12x, k=>k13x, lo=>l13x, ro=>r13x );
round14: roundfunc port map ( clk=>clk, reset=>reset,li=>l13x, ri=>r13x, k=>k14x, lo=>l14x, ro=>r14x );
round15: roundfunc port map ( clk=>clk, reset=>reset,li=>l14x, ri=>r14x, k=>k15x, lo=>l15x, ro=>r15x );
round16: roundfunc port map ( clk=>clk, reset=>reset,li=>l15x, ri=>r15x, k=>k16x, lo=>l16x, ro=>r16x );
fperm: fp port map ( l=>r16x, r=>l16x, pt=>pt );

process (CLK)
begin
if CLK'event and CLK='1' then
if Z=200000 then
CLKM <= '1';
elsif Z=400000 then
CLKM <= '0';
Z <= 0;
end if;
if Z /=400000  then
Z <= Z+1;
end if;
end if;
end process;
NAME(22)<= "11111111";
NAME(21)<= "11111111";
NAME(20)<= "11111111";
NAME(19)<= "11111111";
--NAME(0)<= "10001100";
--NAME(1)<= "10000111";
--NAME(2)<= "10111111";

process(EN)
begin
 	if EN='1' then  
		NAME(0)<= "11000110";
		NAME(1)<= "10000111";
		NAME(2)<= "10111111";
		else 
		NAME(0)<= "10001100";
		NAME(1)<= "10000111";
		NAME(2)<= "10111111";
   end if;
end process;

pt1(64 downto 1)<= pt(1 to 64);
CONV1: Dec2LED port map (CLK => CLK, X => pt1(64 downto 61), Y => NAME(3));
CONV2: Dec2LED port map (CLK => CLK, X => pt1(60 downto 57), Y => NAME(4));
CONV3: Dec2LED port map (CLK => CLK, X => pt1(56 downto 53), Y => NAME(5));
CONV4: Dec2LED port map (CLK => CLK, X => pt1(52 downto 49), Y => NAME(6));
CONV5: Dec2LED port map (CLK => CLK, X => pt1(48 downto 45), Y => NAME(7));
CONV6: Dec2LED port map (CLK => CLK, X => pt1(44 downto 41), Y => NAME(8));
CONV7: Dec2LED port map (CLK => CLK, X => pt1(40 downto 37), Y => NAME(9));
CONV8: Dec2LED port map (CLK => CLK, X => pt1(36 downto 33), Y => NAME(10));
CONV9: Dec2LED port map (CLK => CLK, X => pt1(32 downto 29), Y => NAME(11));
CONV10: Dec2LED port map (CLK => CLK, X => pt1(28 downto 25), Y => NAME(12));
CONV11: Dec2LED port map (CLK => CLK, X => pt1(24 downto 21), Y => NAME(13));
CONV12: Dec2LED port map (CLK => CLK, X => pt1(20 downto 17), Y => NAME(14));
CONV13: Dec2LED port map (CLK => CLK, X => pt1(16 downto 13), Y => NAME(15));
CONV14: Dec2LED port map (CLK => CLK, X => pt1(12 downto 9), Y => NAME(16));
CONV15: Dec2LED port map (CLK => CLK, X => pt1(8 downto 5), Y => NAME(17));
CONV16: Dec2LED port map (CLK => CLK, X => pt1(4 downto 1), Y => NAME(18));

process (CLKM) 
begin
if CLKM'event and CLKM='1' then
  if G=60 then
   TMPDGT(0) <= NAME(NAMEA);
    if NAMEA=22 then
     NAMEA <= 0;
    else
     NAMEA <= NAMEA + 1;
    end if;
   TMPDGT(1) <= NAME(NAMEB);
    if NAMEB=22 then
     NAMEB <= 0;
    else
     NAMEB <= NAMEB + 1;
    end if;
   TMPDGT(2) <= NAME(NAMEC);
    if NAMEC=22 then
     NAMEC <= 0;
    else
     NAMEC <= NAMEC + 1;
    end if;
  TMPDGT(3) <= NAME(NAMED);
    if NAMED=22 then
      NAMED <= 0;
    else
      NAMED <= NAMED + 1;
    end if;
   G <= 0;
  else
   G <= G + 1;
 end if;
end if;

end process;

process (CLKM)
begin
if CLKM'event and CLKM='1' then  
if DU='1' then  
if TEMP="0111" then
TEMP <= "1110";
DIGIT <= TMPDGT(0);
elsif TEMP="1110" then
TEMP <= "1101";
DIGIT <= TMPDGT(1);
elsif TEMP="1101" then
TEMP <= "1011";
DIGIT <= TMPDGT(2);
else 
TEMP <= "0111";
DIGIT <= TMPDGT(3);
end if;
end if;
end if;
end process;
ANODE <= TEMP;
OUTDIGIT <= DIGIT;


end behavior;

