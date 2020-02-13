library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- LAB 2
-- Written by Jonathan Cui 20831049 and Tony Zhao 20839593, TEAM 17

entity switch_input is 
	port (
		sw : in std_logic_vector(7 downto 0);
		hex_A : out std_logic_vector(3 downto 0);
		hex_B :  out std_logic_vector(3 downto 0)
	);
end entity switch_input;

architecture switch_logic of switch_input is 

begin
	--Reads inputs
	hex_A <= sw(3 downto 0);
	hex_B <= sw(7 downto 4);

end architecture switch_logic;