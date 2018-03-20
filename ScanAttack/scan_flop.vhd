library ieee;
use ieee.std_logic_1164.all;
entity scan_ff is port
(
scan_clk : in std_logic;
reset : in std_logic;
test_enable : in std_logic;
ShiftDR : in std_logic;
UpdateDR : in std_logic;
CaptureDR : in std_logic;
scan_in : in std_logic;
data_in : in std_logic;
scan_out : out std_logic;
data_out : out std_logic
);
end scan_ff;
architecture synth of scan_ff is
signal d_capture : std_logic;
signal d_update : std_logic;
signal q_update : std_logic;
signal q_capture: std_logic;

begin
process(scan_clk,reset,test_enable, data_in,UpdateDR,scan_in,ShiftDR,CaptureDR)
begin
scan_out<=q_capture;
d_update<=q_capture;


if (test_enable='0') then
	data_out <= data_in;
	else

	if (scan_clk = '1' and scan_clk'event) then
		
			if (UpdateDR = '1') then
				data_out <= q_capture;
				
			end if;
	end if;		
		if (scan_clk = '1' and scan_clk'event) then
		
			if(CaptureDR = '1') then
				q_capture <= data_in;
			elsif(ShiftDR = '1') then
				q_capture <= scan_in;			
				
			end if;
		end if;
				
		
		
			
	
		
end if;


if(reset = '1') then
data_out <= '0';
scan_out <= '0';
end if;
end process;

end synth;
