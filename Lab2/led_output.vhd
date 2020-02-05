library ieee;
use ieee.std_logic_1164.all;

entity led_output is 
	port (
		mux_select : in std_logic_vector(3 downto 0);
		hex_num0 : in std_logic_vector(3 downto 0);
		hex_num1 : in std_logic_vector(3 downto 0);
		sum : in std_logic_vector(7 downto 0);
		leds : out std_logic_vector(7 downto 0)
	);
end entity led_output;

architecture led_logic of led_output is 

begin

	with mux_select select
	leds <=    "00000000" when "1111", --None, display nothing
				  "0000" & (hex_num0 AND hex_num1) when "1110", --AND
				  "0000" & (hex_num0 OR hex_num1) when "1101", --OR
				  "0000" & (hex_num0 XOR hex_num1) when "1011", --XOR
				   sum when "0111", --ADD, display sum
				  "11111111" when others; --ERROR, all leds on

end architecture led_logic;