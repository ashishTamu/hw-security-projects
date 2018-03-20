LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
ENTITY jtag_2 IS
PORT ( tms_pad_i : IN std_logic; --JTAG test mode select pad
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
END jtag_2;

ARCHITECTURE  jtag_2 OF jtag_2 IS
SIGNAL     test_logic_reset : STD_LOGIC;
SIGNAL     run_test_idle : STD_LOGIC;
SIGNAL     select_dr_scan : STD_LOGIC;
SIGNAL     capture_dr : STD_LOGIC;
SIGNAL     shift_dr : STD_LOGIC;
SIGNAL     exit1_dr : STD_LOGIC;
SIGNAL     pause_dr : STD_LOGIC;
SIGNAL     exit2_dr : STD_LOGIC;
SIGNAL     update_dr : STD_LOGIC;
SIGNAL     select_ir_scan : STD_LOGIC;
SIGNAL     capture_ir : STD_LOGIC;
SIGNAL     shift_ir, shift_ir_neg : STD_LOGIC;
SIGNAL     exit1_ir : STD_LOGIC;
SIGNAL     pause_ir : STD_LOGIC;
SIGNAL     exit2_ir : STD_LOGIC;
SIGNAL     update_ir : STD_LOGIC;
SIGNAL     extest_select : STD_LOGIC;
SIGNAL     sample_preload_select : STD_LOGIC;
SIGNAL     idcode_select : STD_LOGIC;
SIGNAL     mbist_select : STD_LOGIC;
SIGNAL     debug_select : STD_LOGIC;
SIGNAL     bypass_select : STD_LOGIC;
--SIGNAL     tdo_pad_o : STD_LOGIC;
--SIGNAL     tdo_padoe_o : STD_LOGIC;
SIGNAL  tms_q1, tms_q2, tms_q3, tms_q4 : STD_LOGIC;
SIGNAL tms_reset : STD_LOGIC;

SIGNAL jtag_ir : STD_LOGIC_vector(4 downto 0); -- INSTRUCTION REGISTER
SIGNAL latched_jtag_ir : STD_LOGIC_vector(4 downto 0); 
SIGNAL latched_jtag_ir_neg : STD_LOGIC_vector(4 downto 0); 
SIGNAL instruction_tdo: STD_LOGIC;


SIGNAL  idcode_reg : STD_LOGIC_VECTOR(31 downto 0);
SIGNAL  idcode_tdo : STD_LOGIC;


SIGNAL  bypassed_tdo : STD_LOGIC;
SIGNAL  bypass_reg : STD_LOGIC;




--signal j_reset,j_DU,j_EN:STD_LOGIC;
--signal j_clk : std_logic; 
--signal j_OUTDIGIT:  STD_LOGIC_VECTOR (7 downto 0);
--signal j_test_enable :  std_logic;
--signal j_scan_clk :  std_logic; 
--signal j_ShiftDR :  std_logic;
--signal j_UpdateDR : std_logic;
--signal j_scan_in :  std_logic;
--signal j_scan_out :  std_logic;
--signal j_ANODE :  STD_LOGIC_VECTOR (3 downto 0);
--signal j_ct:  std_logic_vector(1 to 64)

--component des4syn
--port (
--reset : in std_logic; DU,EN : in STD_LOGIC;
--clk : in std_logic; OUTDIGIT: out STD_LOGIC_VECTOR (7 downto 0);
--test_enable : in std_logic;
--scan_clk : in std_logic; 
--ShiftDR : in std_logic;
--UpdateDR : in std_logic;
--scan_in : in std_logic;
--scan_out : out std_logic;
--ANODE : out STD_LOGIC_VECTOR (3 downto 0);
--ct: in std_logic_vector(1 to 64)
--);



BEGIN
 tdo_o <= tdi_pad_i;
 shift_dr_o <= shift_dr;
 pause_dr_o <= pause_dr;
 update_dr_o <= update_dr;
 capture_dr_o <= capture_dr;

 extest_select_o <= extest_select;
 sample_preload_select_o <= sample_preload_select;
 mbist_select_o <= mbist_select;
 debug_select_o <= debug_select;
 
 
 
--ak: dont know how to include it
--uut: des4syn (reset=>j_reset,DU=>j_DU,EN=>j_EU',clk=>j_clk,OUTDIGIT=>j_OUTDIGIT,test_enable=>j_test_enable,scan_clk=>j_scan_clk, ShiftDR=>j_ShiftDR, UpdateDR=>j_UpdateDR, scan_in => j_scan_in, scan_out=> j_scan_out; ANODE => j_ANODE,ct=>j_ct);
 
 
 --5 consecutive TMS=1 causes reset
    --tms_reset := tms_pad_i AND tms_q1 AND tms_q2 AND tms_q3 AND tms_q4;
 PROCESS(tck_pad_i)
 BEGIN
       IF (tck_pad_i = '1') AND (tck_pad_i'EVENT) THEN
        tms_q1 <= tms_pad_i;
        tms_q2 <= tms_q1;
        tms_q3 <= tms_q2;
        tms_q4 <= tms_q3;
        
      END IF;   
    END PROCESS;
    
    tms_reset <= tms_pad_i AND tms_q1 AND tms_q2 AND tms_q3 AND tms_q4;
    
  --  /************************************************************
--*   TAP State Machine: Fully JTAG compliant                 *
-- ************************************************************/

-- test_logic_reset state

PROCESS(tck_pad_i)
  BEGIN
    IF (tck_pad_i'EVENT AND tck_pad_i = '1') THEN
       IF trst_pad_i = '1' THEN
       test_logic_reset<='1';
       ELSIF tms_reset = '1' THEN
          test_logic_reset<='1';
        ELSIF(tms_pad_i = '1' AND (test_logic_reset = '1' OR select_ir_scan = '1')) THEN
          test_logic_reset<= '1';
        ELSE
          test_logic_reset<= '0';
        END IF;
  END IF;
  END PROCESS;

--run_test_idle state        
  PROCESS(tck_pad_i)
  BEGIN
    IF (tck_pad_i'EVENT AND tck_pad_i = '1') THEN
       IF trst_pad_i = '1' THEN
       run_test_idle<='0';
       ELSIF tms_reset = '1' THEN
         run_test_idle<='0';
        ELSIF(tms_pad_i = '0' AND (test_logic_reset = '1' OR run_test_idle = '1' OR update_dr = '1' OR update_ir = '1')) THEN
         run_test_idle<='1';
        ELSE
         run_test_idle<='0';
        END IF;
  END IF;
  END PROCESS;
 
 
 --select_dr_scan state
        
    PROCESS(tck_pad_i)
  BEGIN
    IF (tck_pad_i'EVENT AND tck_pad_i = '1') THEN
       IF trst_pad_i = '1' THEN
       select_dr_scan<='0';
       ELSIF tms_reset = '1' THEN
         select_dr_scan<='0';
        ELSIF(tms_pad_i = '1' AND (run_test_idle = '1' OR update_dr = '1' OR update_ir = '1')) THEN
         select_dr_scan<='1';
        ELSE
         select_dr_scan<='0';
        END IF;
  END IF;
  END PROCESS;    
  
 -- capture_dr state
 PROCESS(tck_pad_i)
  BEGIN
    IF (tck_pad_i'EVENT AND tck_pad_i = '1') THEN
       IF trst_pad_i = '1' THEN
       capture_dr<='0';
       ELSIF tms_reset = '1' THEN
         capture_dr<='0';
        ELSIF(tms_pad_i = '0' AND select_dr_scan ='1') THEN
         capture_dr<='1';
        ELSE
         capture_dr<='0';
        END IF;
  END IF;
  END PROCESS;  
  
-- shift_dr state
PROCESS(tck_pad_i)
  BEGIN
    IF (tck_pad_i'EVENT AND tck_pad_i = '1') THEN
       IF trst_pad_i = '1' THEN
       shift_dr<='0';
       ELSIF tms_reset = '1' THEN
         shift_dr<='0';
        ELSIF(tms_pad_i = '0' AND (capture_dr = '1' OR shift_dr = '1' OR exit2_dr = '1')) THEN
         shift_dr<='1';
        ELSE
         shift_dr<='0';
        END IF;
  END IF;
  END PROCESS;  


-- exit1_dr state
PROCESS(tck_pad_i)
  BEGIN
    IF (tck_pad_i'EVENT AND tck_pad_i = '1') THEN
       IF trst_pad_i = '1' THEN
       exit1_dr<='0';
       ELSIF tms_reset = '1' THEN
         exit1_dr<='0';
        ELSIF(tms_pad_i = '1' AND (capture_dr = '1' OR shift_dr = '1')) THEN
         exit1_dr<='1';
        ELSE
         exit1_dr<='0';
        END IF;
  END IF;
  END PROCESS;  
  

-- pause_dr state
PROCESS(tck_pad_i)
  BEGIN
    IF (tck_pad_i'EVENT AND tck_pad_i = '1') THEN
       IF trst_pad_i = '1' THEN
       pause_dr<='0';
       ELSIF tms_reset = '1' THEN
         pause_dr<='0';
        ELSIF(tms_pad_i = '0' AND (exit1_dr = '1' OR pause_dr = '1')) THEN
         pause_dr<='1';
        ELSE
         pause_dr<='0';
        END IF;
  END IF;
  END PROCESS;  
  
  
-- exit2_dr state
PROCESS(tck_pad_i)
  BEGIN
    IF (tck_pad_i'EVENT AND tck_pad_i = '1') THEN
       IF trst_pad_i = '1' THEN
       exit2_dr<='0';
       ELSIF tms_reset = '1' THEN
         exit2_dr<='0';
        ELSIF(tms_pad_i = '1' AND  pause_dr = '1') THEN
         exit2_dr<='1';
        ELSE
         exit2_dr<='0';
        END IF;
  END IF;
  END PROCESS;  


-- update_dr state

PROCESS(tck_pad_i)
  BEGIN
    IF (tck_pad_i'EVENT AND tck_pad_i = '1') THEN
       IF trst_pad_i = '1' THEN
       update_dr<='0';
       ELSIF tms_reset = '1' THEN
         update_dr<='0';
        ELSIF(tms_pad_i = '1' AND (exit1_dr = '1' OR exit2_dr = '1')) THEN
         update_dr<='1';
        ELSE
         update_dr<='0';
        END IF;
  END IF;
  END PROCESS;  





-- select_ir_scan state
PROCESS(tck_pad_i)
  BEGIN
    IF (tck_pad_i'EVENT AND tck_pad_i = '1') THEN
       IF trst_pad_i = '1' THEN
       select_ir_scan<='0';
       ELSIF tms_reset = '1' THEN
         select_ir_scan<='0';
        ELSIF(tms_pad_i = '1' AND select_dr_scan = '1' ) THEN
         select_ir_scan<='1';
        ELSE
         select_ir_scan<='0';
        END IF;
  END IF;
  END PROCESS;


-- capture_ir state
PROCESS(tck_pad_i)
  BEGIN
    IF (tck_pad_i'EVENT AND tck_pad_i = '1') THEN
       IF trst_pad_i = '1' THEN
       capture_ir<='0';
       ELSIF tms_reset = '1' THEN
         capture_ir<='0';
        ELSIF(tms_pad_i = '0' AND select_ir_scan = '1' ) THEN
         capture_ir<='1';
        ELSE
         capture_ir<='0';
        END IF;
  END IF;
  END PROCESS;


-- capture_ir state
PROCESS(tck_pad_i)
  BEGIN
    IF (tck_pad_i'EVENT AND tck_pad_i = '1') THEN
       IF trst_pad_i = '1' THEN
       capture_ir<='0';
       ELSIF tms_reset = '1' THEN
         capture_ir<='0';
        ELSIF(tms_pad_i = '0' AND select_ir_scan = '1' ) THEN
         capture_ir<='1';
        ELSE
         capture_ir<='0';
        END IF;
  END IF;
  END PROCESS;


-- shift_ir state
PROCESS(tck_pad_i)
  BEGIN
    IF (tck_pad_i'EVENT AND tck_pad_i = '1') THEN
       IF trst_pad_i = '1' THEN
       shift_ir <='0';
       ELSIF tms_reset = '1' THEN
shift_ir <='0';
        ELSIF(tms_pad_i = '0' AND(capture_ir = '1' OR shift_ir ='1' OR exit2_ir = '1' )) THEN
shift_ir <='1';
        ELSE
shift_ir <='0';
        END IF;
  END IF;
  END PROCESS;

-- exit1_ir state
PROCESS(tck_pad_i)
  BEGIN
    IF (tck_pad_i'EVENT AND tck_pad_i = '1') THEN
       IF trst_pad_i = '1' THEN
    exit1_ir <='0';
       ELSIF tms_reset = '1' THEN
    exit1_ir <='0';
        ELSIF(tms_pad_i = '1' AND(capture_ir = '1' OR shift_ir ='1')) THEN
    exit1_ir <='1';
        ELSE
    exit1_ir <='0';
        END IF;
  END IF;
  END PROCESS;

-- pause_ir state
PROCESS(tck_pad_i)
  BEGIN
    IF (tck_pad_i'EVENT AND tck_pad_i = '1') THEN
       IF trst_pad_i = '1' THEN
    pause_ir <='0';
       ELSIF tms_reset = '1' THEN
        pause_ir <='0';
        ELSIF(tms_pad_i = '0' AND(exit1_ir = '1' OR  pause_ir='1')) THEN
        pause_ir <='1';
        ELSE
    pause_ir <='0';
        END IF;
  END IF;
  END PROCESS;



-- exit2_ir state
PROCESS(tck_pad_i)
  BEGIN
    IF (tck_pad_i'EVENT AND tck_pad_i = '1') THEN
       IF trst_pad_i = '1' THEN
exit2_ir <='0';
       ELSIF tms_reset = '1' THEN
        exit2_ir <='0';
        ELSIF(tms_pad_i = '1' AND pause_ir='1') THEN
exit2_ir <='1';
        ELSE
    exit2_ir <='0';
        END IF;
  END IF;
  END PROCESS;

-- update_ir state
PROCESS(tck_pad_i)
  BEGIN
    IF (tck_pad_i'EVENT AND tck_pad_i = '1') THEN
       IF trst_pad_i = '1' THEN
update_ir <='0';
       ELSIF tms_reset = '1' THEN
update_ir <='0';
        ELSIF(tms_pad_i = '1' AND(exit1_ir = '1' OR  exit2_ir='1')) THEN
        update_ir <='1';
        ELSE
    update_ir <='0';
        END IF;
  END IF;
  END PROCESS;
--**********************************************************************
--*   End: TAP State Machine                                            *
--**********************************************************************

PROCESS(tck_pad_i)
  BEGIN
    IF (tck_pad_i'EVENT AND tck_pad_i = '1') THEN
       IF trst_pad_i = '1' THEN
jtag_ir(4 downto 0) <= "00000";
       ELSIF capture_ir = '1' THEN
-- This value is fixed for easier fault detection
jtag_ir(4 downto 0) <="10101";
ELSIF shift_ir = '1' THEN        
jtag_ir(4 downto 0) <=tdi_pad_i &jtag_ir(4 downto 1);
        END IF;
  END IF;
  END PROCESS;




PROCESS(tck_pad_i)
  BEGIN
    IF ((tck_pad_i = '0') AND (tck_pad_i'EVENT)) THEN
      instruction_tdo <= jtag_ir(0);
  END IF;
  END PROCESS;
--**********************************************************
--*   End: jtag_ir                                          *
--**********************************************************/

--********************************************************************
--   idcode logic                                                    *
--********************************************************************/



PROCESS(tck_pad_i)
  BEGIN
    IF ((tck_pad_i = '1') AND (tck_pad_i'EVENT)) THEN
       IF (idcode_select = '1'  AND shift_dr = '1') THEN
         idcode_reg  <= tdi_pad_i& idcode_reg(31 downto 1);
       ELSE
        idcode_reg <= "10101010101010101010101010101010"; -- IDCODE VALUE
        END IF;
  END IF;
  END PROCESS;


PROCESS(tck_pad_i)
  BEGIN
    IF ((tck_pad_i = '0') AND (tck_pad_i'EVENT)) THEN
      idcode_tdo <= idcode_reg(0);
  END IF;
  END PROCESS;


--********************************************************************
-- Bypass logic                                                      *
--*******************************************************************/




PROCESS(tck_pad_i)
  BEGIN
    IF (tck_pad_i'EVENT AND tck_pad_i = '1') THEN
       IF trst_pad_i = '1' THEN
bypass_reg <='0';
       ELSIF shift_dr = '1' THEN
        bypass_reg <= tdi_pad_i;
        END IF;
  END IF;
  END PROCESS;

PROCESS(tck_pad_i)
  BEGIN
    IF ((tck_pad_i = '0') AND (tck_pad_i'EVENT)) THEN
      bypassed_tdo <= bypass_reg;
  END IF;
  END PROCESS;


--/***********************************************************************
--*   End: Bypass logic                                                  *
--***********************************************************************/


--***************************************************************
--*   Activating Instructions                                        *
--*******************************************************************/
---- Updating jtag_ir (Instruction Register)

PROCESS(tck_pad_i)
  BEGIN
    IF (tck_pad_i'EVENT AND tck_pad_i = '1') THEN
       IF trst_pad_i = '1' THEN
latched_jtag_ir( 4 downto 0) <= "10101";
       ELSIF  tms_reset = '1' THEN
      latched_jtag_ir( 4 downto 0) <= "10101";
   ELSIF  update_ir = '1' THEN
      latched_jtag_ir( 4 downto 0)<=     jtag_ir( 4 downto 0);

        END IF;
  END IF;
  END PROCESS;
--*******************************************************************
--*   End: Activating Instructions                                   *
--*******************************************************************/

PROCESS(latched_jtag_ir)
  BEGIN
   extest_select           <= '0';
  sample_preload_select   <='0';
  idcode_select           <='0';
  mbist_select            <='0';
  debug_select            <='0';
  bypass_select           <='0';
 CASE latched_jtag_ir IS
WHEN "00000" =>
extest_select           <= '1';    -- External test
WHEN "00001" =>
   sample_preload_select   <= '1';    -- Sample preload
WHEN "00010" =>

    idcode_select           <= '1';    -- ID Code
WHEN "00011" =>

   mbist_select            <= '1';    -- Mbist test
WHEN "00100" =>
debug_select           <= '1';    -- Debug
WHEN "00101" =>
   bypass_select          <= '1';    -- BYPASS
WHEN OTHERS =>

         bypass_select           <= '1';    -- BYPASS
END CASE;
END PROCESS;  

--*******************************************************************
--*   Multiplexing TDO Data                                   *
--*******************************************************************/


     PROCESS(shift_ir_neg , exit1_ir , instruction_tdo ,latched_jtag_ir_neg , idcode_tdo ,
          debug_tdi_i , bs_chain_tdi_i , mbist_tdi_i ,
          bypassed_tdo)
  BEGIN
IF(shift_ir_neg = '1') THEN
    tdo_pad_o <= instruction_tdo;
  ELSE

 CASE latched_jtag_ir_neg IS
WHEN "00010" =>
tdo_pad_o <= idcode_tdo; -- Reading ID code
WHEN "00100" =>
 tdo_pad_o <= debug_tdi_i;      -- Debug
WHEN "00001" =>
   tdo_pad_o <= bs_chain_tdi_i;   -- Sampling/Preloading
WHEN "00000" =>
tdo_pad_o <= bs_chain_tdi_i;   -- External test
WHEN "00011" =>
   tdo_pad_o <= mbist_tdi_i;      -- Mbist test
WHEN OTHERS =>
tdo_pad_o <= bypassed_tdo;     -- BYPASS instruction
         END CASE;
END IF;
END PROCESS;  



-- Tristate control for tdo_pad_o pin

PROCESS(tck_pad_i)
  BEGIN
    IF ((tck_pad_i = '0') AND (tck_pad_i'EVENT)) THEN
     tdo_padoe_o <= shift_ir OR shift_dr OR(pause_dr AND debug_select);
  END IF;
  END PROCESS;

--*************************************************************
--  End: Multiplexing TDO data                                 *
--*************************************************************/



PROCESS(tck_pad_i)
  BEGIN
    IF ((tck_pad_i = '0') AND (tck_pad_i'EVENT)) THEN
     shift_ir_neg <= shift_ir;
  latched_jtag_ir_neg <= latched_jtag_ir;

  END IF;
  END PROCESS;

        
  END jtag_2; 