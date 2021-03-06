library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Testbench Process
-- Outputs TEST_PASS as


entity energy_monitor is 
	port (
      CMP: in std_logic_vector(2 downto 0);
		window_open: in std_logic;
		door_open: in std_logic;
		FURNACE_ON : out std_logic;
		SYSTEM_AT_TEMP : out std_logic;
		AC_ON : out std_logic;
		BLOWER_ON : out std_logic
	);
end entity energy_monitor;

architecture energy_monitor_logic of energy_monitor is 

begin

	FURNACE_ON <= CMP(0) AND (NOT window_open) AND (NOT door_open);
	SYSTEM_AT_TEMP <= CMP(1);
	AC_ON <= CMP(2) AND (NOT window_open) AND (NOT door_open);
	BLOWER_ON <= (CMP(0) AND (NOT window_open) AND (NOT door_open)) OR (CMP(2) AND (NOT window_open) AND (NOT door_open)); 
	
end architecture energy_monitor_logic;
