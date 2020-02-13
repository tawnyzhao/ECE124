library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- LAB 2
-- Written by Jonathan Cui 20831049 and Tony Zhao 20839593, TEAM 17
entity concatenator is 
	port (
		hex_num0 : in std_logic_vector(3 downto 0);
		hex_num1 : in std_logic_vector(3 downto 0);
		concat : out std_logic_vector(7 downto 0)
	);
end entity concatenator;

architecture concatenator_logic of concatenator is 

begin
	--Concatenates numbers for display
	concat <= hex_num1 & hex_num0;
	
end architecture concatenator_logic;