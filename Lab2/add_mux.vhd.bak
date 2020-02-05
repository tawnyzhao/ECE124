library ieee;
use ieee.std_logic_1164.all;

entity hex_mux is 
	port (
		mux_select : in std_logic_vector(3 downto 0);
		hex_num0 : in std_logic_vector(7 downto 0);
		hex_num1 : in std_logic_vector(7 downto 0);
		hex_out : out std_logic_vector(7 downto 0)
	);
end entity hex_mux;

architecture mux_logic of hex_mux is 

begin

	with mux_select select
	hex_out <= hex_num1 when "1111",
				  hex_num1 when "1110",
				  hex_num1 when "1101",
				  hex_num1 when "1011",
				  hex_num0 when "0111",
				  "10001000" when others;

end architecture mux_logic;