library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity concatenator is 
	port (
		hex_num0 : in std_logic_vector(3 downto 0);
		hex_num1 : in std_logic_vector(3 downto 0);
		concat : out std_logic_vector(7 downto 0)
	);
end entity concatenator;

architecture concatenator_logic of concatenator is 

begin

	concat <= hex_num1 & hex_num0;
	
end architecture concatenator_logic;