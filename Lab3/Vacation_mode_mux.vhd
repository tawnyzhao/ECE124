library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Takes in 'desired value' and PB for vacation mode
-- Decides whether to output desired or vacation temp
-- Output is target temp which is piped to top level VHD


entity Vacation_mode_mux is 
	port (
		Desired_Temp : in std_logic_vector(3 downto 0);
      Vacation_Temp: in std_logic_vector(3 downto 0);
		vacation_mode: in std_logic;
		Target_Temp : out std_logic_vector(3 downto 0)
	);
end entity Vacation_mode_mux;

architecture vac_mode_logic of Vacation_mode_mux is 
	--Define components
 
	--Define signals	
begin
	with vacation_mode select
	Target_Temp <= Vacation_Temp when '1', -- Vacation mode is on
						Desired_Temp when '0'; -- Vacation mode is off
	
end architecture vac_mode_logic;
