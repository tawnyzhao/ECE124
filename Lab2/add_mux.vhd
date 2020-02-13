library ieee;
use ieee.std_logic_1164.all;
-- LAB 2
-- Written by Jonathan Cui 20831049 and Tony Zhao 20839593, TEAM 17

entity add_mux is 
	port (
		mux_select : in std_logic_vector(3 downto 0);
		sum : in std_logic_vector(7 downto 0);
		concat : in std_logic_vector(7 downto 0);
		hex_out : out std_logic_vector(7 downto 0)
	);
end entity add_mux;

architecture mux_logic of add_mux is 

begin

	with mux_select select
	hex_out <= concat when "1111", -- No Command
				  concat when "1110", -- AND, display concat
				  concat when "1101", -- OR, display concat
				  concat when "1011", -- XOR, display concat
				  sum when "0111", -- ADD, display sum
				  "10001000" when others; -- ERROR, display "88" 

end architecture mux_logic;