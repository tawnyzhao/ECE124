LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY work;

ENTITY POLARITY_gates IS
	PORT (
		IN_1, IN_2, IN_3, IN_4, SW: IN STD_LOGIC;
		OUT_1, OUT_2, OUT_3, OUT_4: OUT STD_LOGIC
		);
END POLARITY_gates;
		
ARCHITECTURE simple_gates OF POLARITY_gates IS
BEGIN

OUT_1 <= IN_1 XOR SW;
OUT_2 <= IN_2 XOR SW;
OUT_3 <= IN_3 XOR SW;
OUT_4 <= IN_4 XOR SW;

END simple_gates;