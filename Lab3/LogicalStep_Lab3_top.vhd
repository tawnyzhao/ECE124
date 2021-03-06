library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity LogicalStep_Lab3_top is port (
   clkin_50		: in	std_logic;
	pb				: in	std_logic_vector(3 downto 0);
 	sw   			: in  std_logic_vector(7 downto 0); -- The switch inputs
   leds			: out std_logic_vector(7 downto 0);	-- for displaying the switch content
   seg7_data 	: out std_logic_vector(6 downto 0); -- 7-bit outputs to a 7-segment
	seg7_char1  : out	std_logic;							-- seg7 digi selectors
	seg7_char2  : out	std_logic							-- seg7 digi selectors
	
); 
end LogicalStep_Lab3_top;

architecture Energy_Monitor of LogicalStep_Lab3_top is
--
-- Components Used
------------------------------------------------------------------- 
	component compx4 is 
		port (
		A : in std_logic_vector(3 downto 0);
		B : in std_logic_vector(3 downto 0);
		comparisons : out std_logic_vector(2 downto 0)
	);
	end component;
	
	component SevenSegment is port (
		hex	   :  in  std_logic_vector(3 downto 0);   -- The 4 bit data to be displayed
		sevenseg :  out std_logic_vector(6 downto 0)    -- 7-bit outputs to a 7-segment
	); 
	end component;
	
	component segment7_mux is
		port (
          clk        : in  std_logic := '0';
			 DIN2 		: in  std_logic_vector(6 downto 0);	
			 DIN1 		: in  std_logic_vector(6 downto 0);
			 DOUT			: out	std_logic_vector(6 downto 0);
			 DIG2			: out	std_logic;
			 DIG1			: out	std_logic
      );
	end component;
	
	component Vacation_mode_mux is
		port (
			Desired_Temp : in std_logic_vector(3 downto 0);
			Vacation_Temp: in std_logic_vector(3 downto 0);
			vacation_mode: in std_logic;
			Target_Temp : out std_logic_vector(3 downto 0)
		);
	end component;
	
	component test_bench is port (
			sw : in std_logic_vector(7 downto 0);
			CMP: in std_logic_vector(2 downto 0);
			MC_TESTMODE: in std_logic;
			TEST_PASS : out std_logic
	);
	end component;
	
	component energy_monitor is 
	port (
      CMP: in std_logic_vector(2 downto 0);
		window_open: in std_logic;
		door_open: in std_logic;
		FURNACE_ON : out std_logic;
		SYSTEM_AT_TEMP : out std_logic;
		AC_ON : out std_logic;
		BLOWER_ON : out std_logic
	);
	end component;
------------------------------------------------------------------
	
	
-- Create any signals, or temporary variables to be used
	--Input ports
	signal Current_Temp :  std_logic_vector(3 downto 0);
	signal Desired_Temp :  std_logic_vector(3 downto 0);
	signal Vacation_Temp: std_logic_vector(3 downto 0);
	signal vacation_mode :  std_logic;
	signal MC_TESTMODE :  std_logic;
	signal window_open :  std_logic;
	signal door_open :  std_logic;
	
	--Output ports
	signal FURNACE_ON :  std_logic;
	signal SYSTEM_AT_TEMP :  std_logic;
	signal AC_ON :  std_logic;
	signal BLOWER_ON :  std_logic;
	signal TEST_PASS : std_logic;
	
	--(0) LS, (1) EQ, (2) GT
	signal CMP : std_logic_vector(2 downto 0);
	
	--Either vacation temp or desired temp, depending on the vacation mux
	signal Target_Temp : std_logic_vector(3 downto 0);
	
	--Seven seg output
	signal concat : std_logic_vector(7 downto 0);
	signal seg7_A		: std_logic_vector(6 downto 0);
	signal seg7_B		: std_logic_vector(6 downto 0);
	
	
-- Here the circuit begins

begin
	--CONSTANT
	Vacation_Temp <= "0100";
	--
	Current_Temp <= sw(3 downto 0);
	Desired_Temp <= sw(7 downto 4);
	-- Invert PB inputs
	vacation_mode <= NOT pb(3);
	MC_TESTMODE <= NOT pb(2);
	window_open <= NOT pb(1);
	door_open <= NOT pb(0);
	
	concat <= Target_Temp & Current_Temp;
	
	-- Outputs
	leds(0) <= FURNACE_ON;
	leds(1) <= SYSTEM_AT_TEMP;
	leds(2) <= AC_ON;
	leds(3) <= BLOWER_ON;
	leds(4) <= door_open;
	leds(5) <= window_open;
	leds(6) <= TEST_PASS;
	leds(7) <= vacation_mode;
	
	-- Create instances of components
	INST1: compx4 port map(Current_Temp(3 downto 0), Target_Temp(3 downto 0), CMP(2 downto 0));
	INST2: test_bench port map(sw(7 downto 0), CMP(2 downto 0), MC_TESTMODE, TEST_PASS);
	INST3: energy_monitor port map(CMP(2 downto 0), window_open, door_open, FURNACE_ON, SYSTEM_AT_TEMP, AC_ON, BLOWER_ON);
	INST5: SevenSegment port map(concat(3 downto 0), seg7_A);
	INST6: SevenSegment port map(concat(7 downto 4), seg7_B);
	INST7: segment7_mux port map(clkin_50, seg7_A, seg7_B, seg7_data, seg7_char2, seg7_char1);
	INST8: Vacation_mode_mux port map(Desired_Temp(3 downto 0), Vacation_Temp(3 downto 0), vacation_mode, Target_Temp(3 downto 0)); -- Should this go before the digital displays?
	
end Energy_Monitor;

