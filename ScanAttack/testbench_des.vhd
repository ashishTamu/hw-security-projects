library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity des_tb is
end des_tb;

architecture behav of des_tb is

component des4syn
port (
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
end component;


component jtag_2
PORT ( 
tms_pad_i : IN std_logic; --JTAG test mode select pad
tck_pad_i : IN std_logic; --JTAG test clock pad
trst_pad_i : IN std_logic; --JTAG test reset pad
tdi_pad_i : IN std_logic; --JTAG test data input pad
tdo_pad_o : OUT std_logic; --JTAG test data output pad
tdo_padoe_o : OUT std_logic; -- Output enable for JTAG test data
pad : OUT std_logic;

-- TAP STATES
shift_dr_o : OUT std_logic;
pause_dr_o : OUT std_logic;
update_dr_o : OUT std_logic;
capture_dr_o : OUT std_logic;

--SELECT SIGNALS FOR BOUNDARY SCAN OR MBIST 
extest_select_o : OUT std_logic;
sample_preload_select_o : OUT std_logic;
mbist_select_o : OUT std_logic;
debug_select_o : OUT std_logic;

-- TDO signal that is connected to TDI of sub-modules.
tdo_o : OUT std_logic;

-- TDI signals from sub-modules
debug_tdi_i : IN std_logic;    -- from debug module
bs_chain_tdi_i : IN std_logic; -- from Boundary Scan Chain
mbist_tdi_i : IN std_logic    -- from Mbist Chain
);
end component;

--Inputs
signal t_clk : std_logic :='0';
signal t_scan_clk : std_logic :='0';
signal t_reset : std_logic := '0';
signal t_DU,t_EN : std_logic := '0';
signal t_test_enable : std_logic:='0';
signal t_scan_in : std_logic;--_vector (1 to 1);
signal ct : std_logic_vector(1 TO 64):=x"e9ed57f7b1bebeb8";
signal t_ShiftDR : std_logic:='0';
signal t_CaptureDR : std_logic:='0';
signal t_UpdateDR :  std_logic:='0';
--Outputs
signal t_scan_outv : std_logic;--_vector(1 to 1);
signal t_OUTDIGIT : std_logic_vector(7 downto 0);
signal t_ANODE : std_logic_vector (3 downto 0);

-- variables
signal store_scan_chain : std_logic_vector (1 to 192):=x"000000000000000000000000000000000000000000000000";
signal t_scan_out : std_logic;


-- Clock period definitions
constant clk_period : time := 1 ns;
constant clk_period_scan : time := 2 ns;

signal j_tms_pad_i :  std_logic; --JTAG test mode select pad
signal j_tck_pad_i :  std_logic; --JTAG test clock pad
signal j_trst_pad_i :  std_logic; --JTAG test reset pad
signal j_tdi_pad_i :  std_logic; --JTAG test data input pad
signal j_tdo_pad_o :  std_logic; --JTAG test data output pad
signal j_tdo_padoe_o :  std_logic; -- Output enable for JTAG test data
signal j_pad :  std_logic:='0';

signal  t_PauseDR :  std_logic:='0';
signal j_extest_select_o :  std_logic:='0';
signal j_sample_preload_select_o :  std_logic:='0';
signal j_mbist_select_o :  std_logic:='0';
signal j_debug_select_o :  std_logic:='0';
signal j_debug_tdi_i :  std_logic:='0';    -- from debug module
signal j_mbist_tdi_i,t_bs_chain_tdi_i :  std_logic:='0';    -- from Mbist Chain
 
BEGIN
	t_scan_out<= t_scan_outv;
	j_tck_pad_i<=t_scan_clk;
	
	jtag :jtag_2 PORT map( 	tms_pad_i=>j_tms_pad_i, 
							tck_pad_i=>j_tck_pad_i,
							trst_pad_i=>j_trst_pad_i,
							tdi_pad_i=>j_tdi_pad_i, 
							tdo_pad_o=>j_tdo_pad_o,
							tdo_padoe_o=>j_tdo_padoe_o,
							pad=>j_pad, 
							shift_dr_o=> t_ShiftDR, 
							pause_dr_o=> t_PauseDR, 
							update_dr_o=> t_UpdateDR, 
							capture_dr_o=> t_CaptureDR, 
							extest_select_o=> j_extest_select_o,
							sample_preload_select_o=>j_sample_preload_select_o,
							mbist_select_o =>j_mbist_select_o,
							debug_select_o=>j_debug_select_o,
							tdo_o=>t_scan_in,
							debug_tdi_i=>t_scan_out,
							bs_chain_tdi_i=> t_bs_chain_tdi_i,
							mbist_tdi_i=>j_mbist_tdi_i
							);
	
	
	-- Instantiate the Unit Under Test (UUT)
   uut: des4syn PORT MAP (
			reset => t_reset,
			DU => t_DU,
			EN => t_EN,
			clk => t_clk,
			scan_clk => t_scan_clk,
			ShiftDR=> t_ShiftDR,
			UpdateDR=>t_UpdateDR,
			CaptureDR =>t_CaptureDR,
			test_enable => t_test_enable,
			scan_in => t_scan_in,
			scan_out => t_scan_outv,
			OUTDIGIT=> t_OUTDIGIT,
			ANODE => t_ANODE,
			ct=>ct
	    );

		
   -- Clock process definitions
   clk_process :process 
   begin

		t_clk <= '0';
		
		wait for clk_period/2;
		t_clk <= '1';
		wait for clk_period/2;
		
   end process;
    clk_process1 :process 
   begin

		t_scan_clk <= '0';
		
		wait for clk_period_scan/2;
		t_scan_clk <= '1';
		wait for clk_period_scan/2;
		
   end process;
   -- Stimulus process
   stim_proc: process
   begin

		j_trst_pad_i<='1';
		
		t_reset<='1';
		wait for 20 ns;
		t_reset<='0';
		
		--Sequence 1
		ct <=x"1234567890abcdef"; -- add plaintext here
		t_EN <= '1'; -- EN is 0 for decode
		--t_scan_in <= x'0'; // I am not sure how assign value to a vector
		wait for clk_period*32; -- let round function run 16 times;
		-- after encode it pt should be e9ed57f7b1bebeb8

		t_reset<='1';
		wait for 20 ns;	
		t_reset <='0'; --reset low

		--Sequence 1
		ct <=x"e9ed57f7b1bebeb8"; -- add plaintext here 
		t_EN <= '0'; -- EN is 0 for decode
		--t_scan_in <= x'0'; // I am not sure how assign value to a vector
		wait for clk_period*32; -- let round function run 16 times;
		-- after decode it pt should be 1234567890abcdef
	
	
	
	t_EN <= '1'; -- EN is 0 for decode
		wait for 10 ns;
		t_reset<='1';
		j_trst_pad_i<='1';
		wait for 10 ns;
		t_reset <='0'; --reset low
		t_test_enable<='0';
		ct <=x"AA000000AA000000";
		wait for clk_period*3; -- run for 1 clock
		t_test_enable<='1';
		
		--for jtag logic reset
		j_tms_pad_i <= '1';
		j_tdi_pad_i <='0';
		j_trst_pad_i<='0';
		wait for clk_period_scan*5;
		j_tms_pad_i <='0';
		wait for clk_period_scan*1;	-- move to run_test_idle
		j_tms_pad_i <='1';
		wait for clk_period_scan*2;	-- select IR scan 		
		j_tms_pad_i <='0';
		wait for clk_period_scan*2;	-- Shift IR 	
		
		j_tdi_pad_i <='0'; --send data 0100
		wait for clk_period_scan*2;	-- SHiftIR 
		j_tdi_pad_i <='1';
		wait for clk_period_scan*1;	-- SHiftIR 		
		j_tdi_pad_i <='0';
		wait for clk_period_scan*1;	-- SHiftIR 		
		j_tms_pad_i <='1';	
		wait for clk_period_scan*2;	-- exit1 to upadteIR
		j_tms_pad_i <='0';
		wait for clk_period_scan*1;	-- run test idle	
		j_tms_pad_i <='1';
		wait for clk_period_scan*1;	-- DR scan 
		j_tms_pad_i <='0';
		wait for clk_period_scan*2;	 -- Capture to Shift 	
		store_scan_chain<=x"000000000000000000000000000000000000000000000000";
		for i in 1 to 192 loop
			store_scan_chain(193-i)<= j_tdo_pad_o;
			wait for clk_period_scan*1;
		end loop;
		
			wait for 10 ns;
		t_reset<='1';
		j_trst_pad_i<='1';
		wait for 10 ns;
		t_reset <='0'; --reset low
		t_test_enable<='0';
		ct <=x"00AA000000AA0000";
		wait for clk_period*3; -- run for 1 clock
		t_test_enable<='1';
		
		--for jtag logic reset
		j_tms_pad_i <= '1';
		j_tdi_pad_i <='0';
		j_trst_pad_i<='0';
		wait for clk_period_scan*5;
		j_tms_pad_i <='0';
		wait for clk_period_scan*1;	-- move to run_test_idle
		j_tms_pad_i <='1';
		wait for clk_period_scan*2;	-- select IR scan 		
		j_tms_pad_i <='0';
		wait for clk_period_scan*2;	-- Shift IR 	
		
		j_tdi_pad_i <='0'; --send data 0100
		wait for clk_period_scan*2;	-- SHiftIR 
		j_tdi_pad_i <='1';
		wait for clk_period_scan*1;	-- SHiftIR 		
		j_tdi_pad_i <='0';
		wait for clk_period_scan*1;	-- SHiftIR 		
		j_tms_pad_i <='1';	
		wait for clk_period_scan*2;	-- exit1 to upadteIR
		j_tms_pad_i <='0';
		wait for clk_period_scan*1;	-- run test idle	
		j_tms_pad_i <='1';
		wait for clk_period_scan*1;	-- DR scan 
		j_tms_pad_i <='0';
		wait for clk_period_scan*2;	 -- Capture to Shift 	
		store_scan_chain<=x"000000000000000000000000000000000000000000000000";
		for i in 1 to 192 loop
			
			
			wait for clk_period_scan*1;
			store_scan_chain(193-i)<= j_tdo_pad_o;
		end loop;	
   
		wait for 10 ns;
		t_reset<='1';
		j_trst_pad_i<='1';
		wait for 10 ns;
		t_reset <='0'; --reset low
		t_test_enable<='0';
		ct <=x"0000AA000000AA00";
		wait for clk_period*3; -- run for 1 clock
		t_test_enable<='1';
		
		--for jtag logic reset
		j_tms_pad_i <= '1';
		j_tdi_pad_i <='0';
		j_trst_pad_i<='0';
		wait for clk_period_scan*5;
		j_tms_pad_i <='0';
		wait for clk_period_scan*1;	-- move to run_test_idle
		j_tms_pad_i <='1';
		wait for clk_period_scan*2;	-- select IR scan 		
		j_tms_pad_i <='0';
		wait for clk_period_scan*2;	-- Shift IR 	
		
		j_tdi_pad_i <='0'; --send data 0100
		wait for clk_period_scan*2;	-- SHiftIR 
		j_tdi_pad_i <='1';
		wait for clk_period_scan*1;	-- SHiftIR 		
		j_tdi_pad_i <='0';
		wait for clk_period_scan*1;	-- SHiftIR 		
		j_tms_pad_i <='1';	
		wait for clk_period_scan*2;	-- exit1 to upadteIR
		j_tms_pad_i <='0';
		wait for clk_period_scan*1;	-- run test idle	
		j_tms_pad_i <='1';
		wait for clk_period_scan*1;	-- DR scan 
		j_tms_pad_i <='0';
		wait for clk_period_scan*2;	 -- Capture to Shift 	
		store_scan_chain<=x"000000000000000000000000000000000000000000000000";
		for i in 1 to 192 loop
			store_scan_chain(193-i)<= j_tdo_pad_o;		
			wait for clk_period_scan*1;
		end loop;
		
		wait for 10 ns;
		t_reset<='1';
		j_trst_pad_i<='1';
		wait for 10 ns;
		t_reset <='0'; --reset low
		t_test_enable<='0';
		ct <=x"000000AA000000AA";
		wait for clk_period*3; -- run for 1 clock
		t_test_enable<='1';
		
		--for jtag logic reset
		j_tms_pad_i <= '1';
		j_tdi_pad_i <='0';
		j_trst_pad_i<='0';
		wait for clk_period_scan*5;
		j_tms_pad_i <='0';
		wait for clk_period_scan*1;	-- move to run_test_idle
		j_tms_pad_i <='1';
		wait for clk_period_scan*2;	-- select IR scan 		
		j_tms_pad_i <='0';
		wait for clk_period_scan*2;	-- Shift IR 	
		
		j_tdi_pad_i <='0'; --send data 0100
		wait for clk_period_scan*2;	-- SHiftIR 
		j_tdi_pad_i <='1';
		wait for clk_period_scan*1;	-- SHiftIR 		
		j_tdi_pad_i <='0';
		wait for clk_period_scan*1;	-- SHiftIR 		
		j_tms_pad_i <='1';	
		wait for clk_period_scan*2;	-- exit1 to upadteIR
		j_tms_pad_i <='0';
		wait for clk_period_scan*1;	-- run test idle	
		j_tms_pad_i <='1';
		wait for clk_period_scan*1;	-- DR scan 
		j_tms_pad_i <='0';
		wait for clk_period_scan*2;	 -- Capture to Shift 
		
		store_scan_chain<=x"000000000000000000000000000000000000000000000000";
		for i in 1 to 192 loop
			
			wait for clk_period_scan*1;
			store_scan_chain(193-i)<= j_tdo_pad_o;
			
		end loop;

		ct <=x"0000000000000000";
		wait for clk_period_scan*192;
		j_tms_pad_i <='1';
		wait for clk_period_scan*3;	 -- updateDR
		j_tms_pad_i <='0';
		t_test_enable<='0';
		wait for clk_period*1;
		t_test_enable<='1';
			wait for clk_period_scan*2;	 -- ShiftDR
		
		
		
			store_scan_chain<=x"000000000000000000000000000000000000000000000000";
		for i in 1 to 192 loop
			
			
			store_scan_chain(193-i)<= j_tdo_pad_o;
			wait for clk_period_scan*1;
			
		end loop;	
		
	
      wait;
   end process;

END;