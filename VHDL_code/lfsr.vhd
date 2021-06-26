----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Chris Samson
-- 
-- Create Date: 11/02/2020 07:47:17 PM
-- Design Name: Linear Feedback Shift Register
-- Module Name: lfsr - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Implements a linear feedback shift register to 
-- generate pseudo random output
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity lfsr is
    generic(
        width : natural := 8 -- change to 3 only need 6 digits
    );
    Port ( clk : in std_logic;
           en : in std_logic;
           rst : in std_logic;
           seed : in std_logic_vector (width -1 downto 0);
           count : inout std_logic_vector (3 downto 0)); -- width -1 changed
end lfsr;

architecture Behavioral of lfsr is
    signal feedback : std_logic;
    signal count_int : std_logic_vector (width-1 downto 0);
	 signal feedback2 : std_logic; 
	 signal feedback3 : std_logic; 
	 signal x : std_logic;
	 signal y : std_logic;
    
begin
    feedback <= not(count_int(width-1) xor count_int(width - 6)); -- changed cause count in = 6
	 
 
	 x <= not(count_int(width-3) xor count_int(width - 4) xor count_int(width - 2));
	 
	 y <= not(count_int(width-1) xor count_int(width - 5) xor count_int(width - 7));
	 
    -- was changed from 3
    process(clk, rst)
    begin
        if(rst = '1') then
            count_int <= seed;
        elsif (rising_edge(clk)) then
		-------------------------------------------------------------  
            if(en = '1') then
				
	
				
					count_int <= count_int(width-2 downto 0) & feedback;
					
					 

--					 
		--------------------------------------------------------------------------------			 
					 
					
            end if;
        end if;
		  


-- works here for reference  ---------------------------------------------------------
		  
		  if(count_int(2 downto 0) = "111") then -- if 7 is detected
		  
		  count_int(2 downto 0) <= "10" & x; -- change to either 4 or 5
		  count(3) <= '0';
		  
		  
		  elsif(count_int(2 downto 0) = "000") then -- if 7 is detected
		  
		  count_int(2 downto 0) <= y & "01"; -- either5 or 1
		  count(3) <= '0';
		  
		  else
		  
		  count <= count_int(3 downto 0); -- works as random number may add 0 to msb tho
		  count(3) <= '0'; -- works except has random numbers. prevent negative numbers
		  
    	  end if;
		  
	
    end process;
    
	 
end Behavioral;


