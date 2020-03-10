library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Testbench Process
-- Outputs TEST_PASS as


entity test_bench is 
	port (
		sw : in std_logic_vector(7 downto 0);
      CMP: in std_logic_vector(2 downto 0);
		MC_TESTMODE: in std_logic;
		TEST_PASS : out std_logic
	);
end entity test_bench;

architecture test_bench_logic of test_bench is 

begin
	Testbench1:
	PROCESS (sw, CMP(2 downto 0), MC_TESTMODE) is 
	
	variable EQ_PASS, GT_PASS, LT_PASS	: std_logic := '0';
	
	begin
		IF ((sw(3 downto 0) = sw(7 downto 4)) AND (CMP(1) = '1')) THEN
		EQ_PASS:= '1';
		GT_PASS:= '0';
		LT_PASS:= '0';
		
		ELSIF ((sw(3 downto 0) > sw(7 downto 4)) AND (CMP(2) = '1')) THEN
		EQ_PASS:= '0';
		GT_PASS:= '1';
		LT_PASS:= '0';	
		
		ELSIF ((sw(3 downto 0) < sw(7 downto 4)) AND (CMP(0) = '1')) THEN
		EQ_PASS:= '0';
		GT_PASS:= '0';
		LT_PASS:= '1';	
		
		ELSE
		
		EQ_PASS:= '0';
		GT_PASS:= '0';
		LT_PASS:= '0';
	
		END IF;
		TEST_PASS <= MC_TESTMODE AND (EQ_PASS OR GT_PASS OR LT_PASS); 
	end process;
	
end architecture test_bench_logic;
