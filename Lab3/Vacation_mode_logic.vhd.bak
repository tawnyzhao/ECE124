library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity compx4 is 
	port (
		A : in std_logic_vector(3 downto 0);
		B : in std_logic_vector(3 downto 0);
		comparisons : out std_logic_vector(2 downto 0)
	);
end entity compx4;

architecture compx4_logic of compx4 is 
	--Define components
	component compx1 port (
		bit_A : in std_logic;
		bit_B : in std_logic;
		comparisons: out std_logic_vector(0 to 2)
	);
   end component;
	--Define signals
	signal bit_results : std_logic_vector(0 to 11); -- 12 index is the most significant 
	
begin
	
	INST1: compx1 port map(A(0), B(0), bit_results(0 to 2));
	INST2: compx1 port map(A(1), B(1), bit_results(3 to 5));
	INST3: compx1 port map(A(2), B(2), bit_results(6 to 8));
	INST4: compx1 port map(A(3), B(3), bit_results(9 to 11));
	
	comparisons(2) <= (bit_results(11)) OR 
			(bit_results(10) AND bit_results(8)) OR
			(bit_results(10) AND bit_results(7) AND bit_results(5)) OR 
			(bit_results(10) AND bit_results(7) AND bit_results(4) AND bit_results(2));
			
	comparisons(0) <= (bit_results(9)) OR 
			(bit_results(10) AND bit_results(6)) OR
			(bit_results(10) AND bit_results(7) AND bit_results(3)) OR 
			(bit_results(10) AND bit_results(7) AND bit_results(4) AND bit_results(0));
			
	comparisons(1) <= (bit_results(10) AND bit_results(7) AND bit_results(4) AND bit_results(1));
	
end architecture compx4_logic;