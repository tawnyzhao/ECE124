library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- LAB 2
-- Written by Jonathan Cui 20831049 and Tony Zhao 20839593, TEAM 17

entity LogicalStep_Lab2_top is port (
   clkin_50			: in	std_logic;
	pb					: in	std_logic_vector(3 downto 0); -- Buttons
 	sw   				: in  std_logic_vector(7 downto 0); -- The switch inputs
  	leds				: out std_logic_vector(7 downto 0); -- for displaying the switch content
   	seg7_data 		: out std_logic_vector(6 downto 0); -- 7-bit outputs to a 7-segment
	seg7_char1  	: out	std_logic;				    		-- seg7 digit1 selector
	seg7_char2  	: out	std_logic				    		-- seg7 digit2 selector
); 
end LogicalStep_Lab2_top;

architecture SimpleCircuit of LogicalStep_Lab2_top is
--
-- Components Used ---
------------------------------------------------------------------- 
   component SevenSegment port (
   hex   		:  in  std_logic_vector(3 downto 0);   -- The 4 bit data to be displayed
   sevenseg 	:  out std_logic_vector(6 downto 0)    -- 7-bit outputs to a 7-segment
   ); 
   end component;
	
	component segment7_mux port (
			clk : in std_logic := '0';
			DIN2	: in std_logic_vector(6 downto 0);
			DIN1	: in std_logic_vector(6 downto 0);
			DOUT	: out std_logic_vector(6 downto 0);
			DIG2 	: out std_logic;
			DIG1 	: out std_logic
		);
		end component;
		
	component add_mux port (
			mux_select : in std_logic_vector(3 downto 0);
			sum : in std_logic_vector(7 downto 0);
			concat : in std_logic_vector(7 downto 0);
			hex_out : out std_logic_vector(7 downto 0)
	);
	end component;
	
	component led_output port (
		mux_select : in std_logic_vector(3 downto 0);
		hex_num0 : in std_logic_vector(3 downto 0);
		hex_num1 : in std_logic_vector(3 downto 0);
		sum : in std_logic_vector(7 downto 0);
		leds : out std_logic_vector(7 downto 0)
	);
	end component;
	
	
	component adder is 
		port (
			hex_num0 : in std_logic_vector(3 downto 0);
			hex_num1 : in std_logic_vector(3 downto 0);
			sum : out std_logic_vector(7 downto 0)
		);
	end component adder;
	
	component switch_input is 
		port (
			sw : in std_logic_vector(7 downto 0);
			hex_A : out std_logic_vector(3 downto 0);
			hex_B :  out std_logic_vector(3 downto 0)
		);
	end component switch_input;
	
	component concatenator is 
		port (
			hex_num0 : in std_logic_vector(3 downto 0);
			hex_num1 : in std_logic_vector(3 downto 0);
			concat : out std_logic_vector(7 downto 0)
		);
	end component concatenator;


-- Create any signals, or temporary variables to be used
--
--  std_logic_vector is a signal which can be used for logic operations such as OR, AND, NOT, XOR
--
	signal seg7_A		: std_logic_vector(6 downto 0);
	signal seg7_B		: std_logic_vector(13 downto 7);
	signal hex_A		: std_logic_vector(3 downto 0);
	signal hex_B		: std_logic_vector(7 downto 4);
	signal concat     : std_logic_vector(7 downto 0);
	signal sum      	: std_logic_vector(7 downto 0);	
	signal seg7_output : std_logic_vector(7 downto 0);
	
	
-- Here the circuit begins

begin
	--COMPONENT HOOKUP
	-- Calculate sum
	INST1: switch_input port map(sw ,hex_A, hex_B);
	INST2: concatenator port map(hex_A, hex_B, concat);
	INST3: adder port map(hex_A, hex_B, sum); 
	-- Select sum or concat
	INST4: add_mux	port map(pb, sum, concat, seg7_output);
	-- Convert from hex to seven segment
	INST5: SevenSegment port map(seg7_output(3 downto 0), seg7_A);
	INST6: SevenSegment port map(seg7_output(7 downto 4), seg7_B);
	-- Display seven segment data
	INST7: segment7_mux port map(clkin_50, seg7_A, seg7_B, seg7_data, seg7_char2, seg7_char1);
	-- Calculate and display leds
	INST8: led_output port map(pb, hex_A, hex_B, sum, leds);
end SimpleCircuit;

