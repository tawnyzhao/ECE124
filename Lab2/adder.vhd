library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- LAB 2
-- Written by Jonathan Cui 20831049 and Tony Zhao 20839593, TEAM 17

entity adder is 
	port (
		hex_num0 : in std_logic_vector(3 downto 0);
		hex_num1 : in std_logic_vector(3 downto 0);
		sum : out std_logic_vector(7 downto 0)
	);
end entity adder;

architecture adder_logic of adder is 

begin

	sum <= std_logic_vector(unsigned("0000" & hex_num0) -- Converts to 8 bit unsigned
									+ unsigned("0000" & hex_num1)); -- Adds integers and converts to vector

end architecture adder_logic;