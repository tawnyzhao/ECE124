library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity compx1 is 
	port (
		bit_A : in std_logic;
		bit_B : in std_logic;
		comparisons: out std_logic_vector(0 to 2)
	);
end entity compx1;

architecture compx1_logic of compx1 is 

begin
	---------------------------
	-- A - B -- GT - EQ - LT --
	-- 0   0     0    1    0
   -- 0   1     0    0    1
	-- 1   0     1    0    0
	-- 1   1     0    1    0
	---------------------------
	-- c(2) == GT, c(1) == EQ. c(0) == LT
	
	comparisons(2) <= bit_A AND (NOT bit_B);
	comparisons(1) <= NOT (bit_A XOR bit_B);
	comparisons(0) <= (NOT bit_A) AND bit_B;
	

end architecture compx1_logic;