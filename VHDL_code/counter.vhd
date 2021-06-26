---------------------------------------------------
-- 
-- Author: 	Matthew Beitel
-- Student ID: 	B00739789
-- Date: 	Nov 21st 2020
-- File Name: 	counter
-- Architecture:Behaviour
-- Description: The circuit is used to implement a
-- up counter
-- Acknowledgements:
---------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE ieee.std_logic_signed.ALL;

ENTITY counter IS
	PORT ( L : IN STD_LOGIC;
				clock : IN STD_LOGIC;
				Data : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
				Q : BUFFER STD_LOGIC_VECTOR(4 DOWNTO 0));
END ENTITY;

ARCHITECTURE Behaviour OF counter IS
	SIGNAL E : STD_LOGIC; 
BEGIN

	PROCESS (clock, L, Data)
	BEGIN
		IF L = '0' THEN
			Q <= Data; -- hold
		ELSIF clock'EVENT AND clock = '1' AND E = '1' THEN
		Q <= Q + "00001"; -- count upwards in hex
		END IF;
	END PROCESS;
	
	E <= '0' WHEN Q = "00000" ELSE '1';
END Behaviour;


-- works for only when data is a value

-- could use other counter but we will see
