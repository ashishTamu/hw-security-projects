library ieee;
use ieee.std_logic_1164.all;
entity s5 is port
(
b : in std_logic_vector(1 to 6);
so : out std_logic_vector(1 to 4)
);
end s5;
architecture behaviour of s5 is
begin
process(b)
begin
case b is
when "000000"=> so<=To_StdLogicVector(Bit_Vector'(x"2"));
when "000010"=> so<=To_StdLogicVector(Bit_Vector'(x"c"));
when "000100"=> so<=To_StdLogicVector(Bit_Vector'(x"4"));
when "000110"=> so<=To_StdLogicVector(Bit_Vector'(x"1"));
when "001000"=> so<=To_StdLogicVector(Bit_Vector'(x"7"));
when "001010"=> so<=To_StdLogicVector(Bit_Vector'(x"a"));
when "001100"=> so<=To_StdLogicVector(Bit_Vector'(x"b"));
when "001110"=> so<=To_StdLogicVector(Bit_Vector'(x"6"));
when "010000"=> so<=To_StdLogicVector(Bit_Vector'(x"8"));
when "010010"=> so<=To_StdLogicVector(Bit_Vector'(x"5"));
when "010100"=> so<=To_StdLogicVector(Bit_Vector'(x"3"));
when "010110"=> so<=To_StdLogicVector(Bit_Vector'(x"f"));
when "011000"=> so<=To_StdLogicVector(Bit_Vector'(x"d"));
when "011010"=> so<=To_StdLogicVector(Bit_Vector'(x"0"));
when "011100"=> so<=To_StdLogicVector(Bit_Vector'(x"e"));
when "011110"=> so<=To_StdLogicVector(Bit_Vector'(x"9"));
when "000001"=> so<=To_StdLogicVector(Bit_Vector'(x"e"));
when "000011"=> so<=To_StdLogicVector(Bit_Vector'(x"b"));
when "000101"=> so<=To_StdLogicVector(Bit_Vector'(x"2"));
when "000111"=> so<=To_StdLogicVector(Bit_Vector'(x"c"));
when "001001"=> so<=To_StdLogicVector(Bit_Vector'(x"4"));
when "001011"=> so<=To_StdLogicVector(Bit_Vector'(x"7"));
when "001101"=> so<=To_StdLogicVector(Bit_Vector'(x"d"));
when "001111"=> so<=To_StdLogicVector(Bit_Vector'(x"1"));
when "010001"=> so<=To_StdLogicVector(Bit_Vector'(x"5"));
when "010011"=> so<=To_StdLogicVector(Bit_Vector'(x"0"));
when "010101"=> so<=To_StdLogicVector(Bit_Vector'(x"f"));
when "010111"=> so<=To_StdLogicVector(Bit_Vector'(x"a"));
when "011001"=> so<=To_StdLogicVector(Bit_Vector'(x"3"));
when "011011"=> so<=To_StdLogicVector(Bit_Vector'(x"9"));
when "011101"=> so<=To_StdLogicVector(Bit_Vector'(x"8"));
when "011111"=> so<=To_StdLogicVector(Bit_Vector'(x"6"));
when "100000"=> so<=To_StdLogicVector(Bit_Vector'(x"4"));
when "100010"=> so<=To_StdLogicVector(Bit_Vector'(x"2"));
when "100100"=> so<=To_StdLogicVector(Bit_Vector'(x"1"));
when "100110"=> so<=To_StdLogicVector(Bit_Vector'(x"b"));
when "101000"=> so<=To_StdLogicVector(Bit_Vector'(x"a"));
when "101010"=> so<=To_StdLogicVector(Bit_Vector'(x"d"));
when "101100"=> so<=To_StdLogicVector(Bit_Vector'(x"7"));
when "101110"=> so<=To_StdLogicVector(Bit_Vector'(x"8"));
when "110000"=> so<=To_StdLogicVector(Bit_Vector'(x"f"));
when "110010"=> so<=To_StdLogicVector(Bit_Vector'(x"9"));
when "110100"=> so<=To_StdLogicVector(Bit_Vector'(x"c"));
when "110110"=> so<=To_StdLogicVector(Bit_Vector'(x"5"));
when "111000"=> so<=To_StdLogicVector(Bit_Vector'(x"6"));
when "111010"=> so<=To_StdLogicVector(Bit_Vector'(x"3"));
when "111100"=> so<=To_StdLogicVector(Bit_Vector'(x"0"));
when "111110"=> so<=To_StdLogicVector(Bit_Vector'(x"e"));
when "100001"=> so<=To_StdLogicVector(Bit_Vector'(x"b"));
when "100011"=> so<=To_StdLogicVector(Bit_Vector'(x"8"));
when "100101"=> so<=To_StdLogicVector(Bit_Vector'(x"c"));
when "100111"=> so<=To_StdLogicVector(Bit_Vector'(x"7"));
when "101001"=> so<=To_StdLogicVector(Bit_Vector'(x"1"));
when "101011"=> so<=To_StdLogicVector(Bit_Vector'(x"e"));
when "101101"=> so<=To_StdLogicVector(Bit_Vector'(x"2"));
when "101111"=> so<=To_StdLogicVector(Bit_Vector'(x"d"));
when "110001"=> so<=To_StdLogicVector(Bit_Vector'(x"6"));
when "110011"=> so<=To_StdLogicVector(Bit_Vector'(x"f"));
when "110101"=> so<=To_StdLogicVector(Bit_Vector'(x"0"));
when "110111"=> so<=To_StdLogicVector(Bit_Vector'(x"9"));
when "111001"=> so<=To_StdLogicVector(Bit_Vector'(x"a"));
when "111011"=> so<=To_StdLogicVector(Bit_Vector'(x"4"));
when "111101"=> so<=To_StdLogicVector(Bit_Vector'(x"5"));
when others=> so<=To_StdLogicVector(Bit_Vector'(x"3"));
end case;
end process;
end;