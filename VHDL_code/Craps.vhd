
-- Author: 	Matthew Beitel
-- Student ID: 	B00739789
-- Date: 	Nov 21st 2020
-- File Name: 	Craps
-- Architecture:Behaviour
-- Description: The circuit is used to implement a
-- a craps game
-- Acknowledgements:
---------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;




entity craps is 


	port ( clk : in std_logic;
			  roll : in std_logic; -- roll of the dice
			  rst : in std_logic; -- reset
			  rn1 : inout std_logic_vector(3 downto 0) := b"0000"; -- random data number for testing only intialize
			  rn2 : inout std_logic_vector(3 downto 0) := b"0000"; -- random data number for testing only
			  seed1 : in std_logic_vector (7 downto 0); -- seed for dice 1
           seed2 : in std_logic_vector (7 downto 0); -- seed for dice 2
			  cnt : inout std_logic_vector(7 downto 0) := b"00000000"; -- count for each roll
			  point: inout std_logic_vector(3 downto 0) :=b"0000"; -- pointer value to compare
           win : out std_logic := '0'; -- win LED
			  lose : out std_logic := '0';
			  sum : inout std_logic_vector(3 downto 0)); -- lose led
			  	  
end craps;

architecture Behavioral of craps is
-- add components

-----------------------------------------------------------------------

component lfsr

 generic(
        width : natural := 8 -- change to 3
    );
    Port ( clk : in std_logic;
           en : in std_logic;
           rst : in std_logic;
           seed : in std_logic_vector (width -1 downto 0);
           count : inout std_logic_vector (3 downto 0)); -- changed 3 bits last is always 0


end component; 

-----------------------------------------------------------------------

component Comparator 
 generic(
        WIDTH : integer := 4 -- change to 4
    );
    Port ( clk : in STD_LOGIC;
           a : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           b : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           comp : out STD_LOGIC);


end component; 

-----------------------------------------------------------------------

component counter 

PORT ( L : IN STD_LOGIC;
				clock : IN STD_LOGIC;
				Data : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
				Q : BUFFER STD_LOGIC_VECTOR(4 DOWNTO 0));


end component; 
----------------------------------------------------------------------

component adder_operator

generic(
        WIDTH : integer := 4 -- change to 6 because we dont want negative numbers
    );

    Port ( a_in : in  STD_LOGIC_VECTOR (WIDTH-1 downto 0) ;
           b_in : in  STD_LOGIC_VECTOR (WIDTH-1 downto 0) ;
			  clk : in std_logic;
           s_out  : out STD_LOGIC_VECTOR (WIDTH-1 downto 0));


end component; 
----------------------------------------------------------------------
	 signal a :  STD_LOGIC_VECTOR (3 downto 0);
    signal b :  STD_LOGIC_VECTOR (3 downto 0);
    signal z :  STD_LOGIC_VECTOR (3 downto 0);
	 signal E : std_logic; 
	 signal rx1 : std_logic_vector(3 downto 0) := b"0000";
	 signal rx2 : std_logic_vector(3 downto 0) := b"0000";
	 signal pn : std_logic_vector( 3 downto 0) :=b"0000"; -- used to delay point


begin
  
-- Random Number Generator --------------


------------------------------------------------------------------------
d1 : lfsr port map(clk,roll,rst,seed1,rx1(3 downto 0)); -- random number generator dice 1
d2 : lfsr port map(clk,roll,rst,seed2,rx2(3 downto 0)); -- random number generator dice 2
 
--ad1 : adder_operator port map(rn1,rn2,clk,sum);


  
---------------- counter -----------------------------------------------
process (clk) begin



if(rising_edge(clk)) then 

if rst = '1' then -- rst condition


cnt <= "00000000"; -- rst condition works


elsif(roll <= '0') then
  cnt <= cnt;



  else 
  cnt <= cnt + "00000001";
  
  
  rn1 <= rx1; -- time buffer
  rn2 <= rx2; -- time buffer
  

end if;

end if; 

end process;

-------------------------------------------------

-- first roll conditions ------------------------

process (clk) begin
	-- add reset here. 
	
	
	

	if(rising_edge(clk)) then
	
	if rst = '1' then
	
	win <= '0';
	
   lose <= '0';
	
	point <= "0000";

	
	
		elsif cnt = "00000001" then -- counter check for first roll -- change cause 0 condition
	
	
		case Z is
			when "0111" | "1011" => -- 7 or 11 careful with unsigned
		win <= '1';
		lose <= '0';
			when "0010" | "0011" | "1100" => 
			
		lose <= '1';
		win <= '0';
		
	when others => -- when neither
	
	
	win <= '0';
	
   lose <= '0';
	
	
	point <= Z; 

	
	end case;
	
-- Second Roll conditions ----------------------------------------------------------
	
	elsif cnt >= "00000010" then 
		
		if (Z = point) then -- changed to Z and with other one
	
		win <= '1';
		lose <= '0';
		
		elsif (Z = "0111") then
		
		lose <= '1';
		win <= '0';
		
		
		else -- final condition if not either. 
		
		lose <= '0';
		
		win <= '0';
		
		
		end if;
	
	end if;
	
	
	end if;
	
	
	end process;
-----------------------------------------------------------------------------------------	
	
-- addition operator --------------------------------------------------------------------
	process (clk) begin
		if(rising_edge(clk)) then
		-- about to change code 
		if cnt = "00000000" then -- added
		
		sum <= "0000"; -- when reset sum is 0
		
		else -- added
		
			a <= rn1; 
			b <= rn2; 
			sum <= z;
		
		end if;-- added

		end if;

	 end process; 
	 
  z <= rn1 + rn2; -- most efficienct works way more optimized occurs at same time
	
-----------------------------------------------------------------------------------------	

end Behavioral;


-- finally gets 1-6 input
-- it all works yay!