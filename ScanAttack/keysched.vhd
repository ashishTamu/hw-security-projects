library ieee;
use ieee.std_logic_1164.all;
entity keysched is port
(
key : in std_logic_vector(1 to 64);EN: in std_logic;
k1x,k2x,k3x,k4x,k5x,k6x,k7x,k8x,k9x,k10x,k11x,k12x,k13x,k14x,k15x,k16x
: out std_logic_vector(1 to 48)
);
end keysched;
architecture behaviour of keysched is
signal k1,k2,k3,k4,k5,k6,k7,k8,k9,k10,k11,k12,k13,k14,k15,k16
: std_logic_vector(1 to 48);
signal
c0x,c1x,c2x,c3x,c4x,c5x,c6x,c7x,c8x,c9x,c10x,c11x,c12x,c13x,c14x,c15x,c16x :
std_logic_vector(1 to 28);
signal
d0x,d1x,d2x,d3x,d4x,d5x,d6x,d7x,d8x,d9x,d10x,d11x,d12x,d13x,d14x,d15x,d16x :
std_logic_vector(1 to 28);
component pc1
port (
key : in std_logic_vector(1 TO 64);
c0x,d0x : out std_logic_vector(1 TO 28)
);
end component;
component pc2
port (
c,d : in std_logic_vector(1 TO 28);
k : out std_logic_vector(1 TO 48)
);
end component;
begin
pc_1: pc1 port map ( key=>key, c0x=>c0x, d0x=>d0x );
c1x<=To_StdLogicVector(to_bitvector(c0x) rol 1);
d1x<=To_StdLogicVector(to_bitvector(d0x) rol 1);
c2x<=To_StdLogicVector(to_bitvector(c1x) rol 1);
d2x<=To_StdLogicVector(to_bitvector(d1x) rol 1);
c3x<=To_StdLogicVector(to_bitvector(c2x) rol 2);
d3x<=To_StdLogicVector(to_bitvector(d2x) rol 2);
c4x<=To_StdLogicVector(to_bitvector(c3x) rol 2);
d4x<=To_StdLogicVector(to_bitvector(d3x) rol 2);
c5x<=To_StdLogicVector(to_bitvector(c4x) rol 2);
d5x<=To_StdLogicVector(to_bitvector(d4x) rol 2);
c6x<=To_StdLogicVector(to_bitvector(c5x) rol 2);
d6x<=To_StdLogicVector(to_bitvector(d5x) rol 2);
c7x<=To_StdLogicVector(to_bitvector(c6x) rol 2);
d7x<=To_StdLogicVector(to_bitvector(d6x) rol 2);
c8x<=To_StdLogicVector(to_bitvector(c7x) rol 2);
d8x<=To_StdLogicVector(to_bitvector(d7x) rol 2);
c9x<=To_StdLogicVector(to_bitvector(c8x) rol 1);
d9x<=To_StdLogicVector(to_bitvector(d8x) rol 1);
c10x<=To_StdLogicVector(to_bitvector(c9x) rol 2);
d10x<=To_StdLogicVector(to_bitvector(d9x) rol 2);
c11x<=To_StdLogicVector(to_bitvector(c10x) rol 2);
d11x<=To_StdLogicVector(to_bitvector(d10x) rol 2);
c12x<=To_StdLogicVector(to_bitvector(c11x) rol 2);
d12x<=To_StdLogicVector(to_bitvector(d11x) rol 2);
c13x<=To_StdLogicVector(to_bitvector(c12x) rol 2);
d13x<=To_StdLogicVector(to_bitvector(d12x) rol 2);
c14x<=To_StdLogicVector(to_bitvector(c13x) rol 2);
d14x<=To_StdLogicVector(to_bitvector(d13x) rol 2);
c15x<=To_StdLogicVector(to_bitvector(c14x) rol 2);
d15x<=To_StdLogicVector(to_bitvector(d14x) rol 2);
c16x<=To_StdLogicVector(to_bitvector(c15x) rol 1);
d16x<=To_StdLogicVector(to_bitvector(d15x) rol 1);
pc2x1: pc2 port map ( c=>c1x, d=>d1x, k=>k1 );
pc2x2: pc2 port map ( c=>c2x, d=>d2x, k=>k2 );
pc2x3: pc2 port map ( c=>c3x, d=>d3x, k=>k3 );
pc2x4: pc2 port map ( c=>c4x, d=>d4x, k=>k4 );
pc2x5: pc2 port map ( c=>c5x, d=>d5x, k=>k5 );
pc2x6: pc2 port map ( c=>c6x, d=>d6x, k=>k6 );
pc2x7: pc2 port map ( c=>c7x, d=>d7x, k=>k7 );
pc2x8: pc2 port map ( c=>c8x, d=>d8x, k=>k8 );
pc2x9: pc2 port map ( c=>c9x, d=>d9x, k=>k9 );
pc2x10: pc2 port map ( c=>c10x, d=>d10x, k=>k10 );
pc2x11: pc2 port map ( c=>c11x, d=>d11x, k=>k11 );
pc2x12: pc2 port map ( c=>c12x, d=>d12x, k=>k12 );
pc2x13: pc2 port map ( c=>c13x, d=>d13x, k=>k13 );
pc2x14: pc2 port map ( c=>c14x, d=>d14x, k=>k14 );
pc2x15: pc2 port map ( c=>c15x, d=>d15x, k=>k15 );
pc2x16: pc2 port map ( c=>c16x, d=>d16x, k=>k16 );

process(EN)
begin
if EN='1' then
  k1x<=k16;k2x<=k15;k3x<=k14;k4x<=k13;k5x<=k12;k6x<=k11;k7x<=k10;k8x<=k9;
  k9x<=k8;k10x<=k7;k11x<=k6;k12x<=k5;k13x<=k4;k14x<=k3;k15x<=k2;k16x<=k1;
else
  k1x<=k1;k2x<=k2;k3x<=k3;k4x<=k4;k5x<=k5;k6x<=k6;k7x<=k7;k8x<=k8;
  k9x<=k9;k10x<=k10;k11x<=k11;k12x<=k12;k13x<=k13;k14x<=k14;k15x<=k15;k16x<=k16;
  
end if;
end process;  
end behaviour;