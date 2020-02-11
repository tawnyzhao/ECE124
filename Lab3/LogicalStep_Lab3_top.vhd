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
------------------------------------------------------------------
	
	
-- Create any signals, or temporary variables to be used
	
	
-- Here the circuit begins

begin
	INST1: compx4 port map(sw(3 downto 0), sw(7 downto 4), leds(2 downto 0));
	
end Energy_Monitor;

