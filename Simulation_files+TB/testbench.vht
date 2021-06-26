

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;


entity testbench is

end testbench; 


architecture behaviour of testbench is 

component craps 


	port ( clk : in std_logic;
			  roll : in std_logic; -- roll of the dice
			  rst : in std_logic; -- reset
			  rn1 : inout std_logic_vector(3 downto 0); -- random data number for testing only intialize
			  rn2 : inout std_logic_vector(3 downto 0); -- random data number for testing only
			  seed1 : in std_logic_vector (7 downto 0); -- seed for dice 1
           seed2 : in std_logic_vector (7 downto 0); -- seed for dice 2
			  cnt : inout std_logic_vector(7 downto 0); -- count for each roll
			  point: inout std_logic_vector(3 downto 0); -- pointer value to compare
           win : out std_logic; -- win LED
			  lose : out std_logic;
			  sum : inout std_logic_vector(3 downto 0)); -- lose led		  
			  
end component; 


component comparator
    generic(
        WIDTH : integer := 4 -- change to 5 so no negatives
    );
    Port ( clk : in STD_LOGIC;
           a : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           b : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           comp : out STD_LOGIC);
			  
end component;

	   signal clk : std_logic := '0';
		signal roll :  std_logic := '0'; -- roll of the dice
	   signal rst : std_logic := '0';
		signal rn1 : std_logic_vector(3 downto 0) := b"0000";
	   signal rn2 : std_logic_vector(3 downto 0) := b"0000";
		signal seed1 : std_logic_vector (15 downto 0) := b"0100010110101001"; -- seed for dice
		signal seed2 : std_logic_vector (15 downto 0) := b"1101010001010111"; -- seed for dice
		signal seed3 : std_logic_vector (15 downto 0) := b"0010101000110001"; -- seed for dice
		signal seed4 : std_logic_vector (15 downto 0) := b"0100010110101010"; -- seed for dice
		signal seed5 : std_logic_vector (15 downto 0) := b"1111011001000101"; -- seed for dice
	   signal cnt : std_logic_vector(7 downto 0) := b"00000000"; -- count for each roll
	   signal point : std_logic_vector(3 downto 0) :=b"0000";
		signal win : std_logic := '0';
		signal lose : std_logic := '0';
		signal sum : std_logic_vector(3 downto 0) :=b"0000"; -- lose led
		signal flag : std_logic := '0';
		signal tmp : std_logic_vector(2 downto 0) :=b"000";
		
		
		signal D7 : std_logic := '0';
		signal D711 : std_logic := '0';
		
		signal D2312 : std_logic := '0';
		signal eq : std_logic := '0';
		signal sp : std_logic := '0';

-------------------------------------------------------------- extra signals
	
		signal com : std_logic_vector(3 downto 0) :=b"0111";
		
		signal loss : std_logic_vector(3 downto 0) :=b"0000";
		signal d2 : std_logic_vector(3 downto 0) :=b"0010";
		signal d3 : std_logic_vector(3 downto 0) :=b"0011";
		signal d12 : std_logic_vector(3 downto 0) :=b"0010";
		
		
begin

flag <= (win or lose); -- for reset

loss <= (d2 or d3 or d12); -- if 2 3 or 12 are detected



 clock: process
    begin
        clk <= '1';
        wait for 5ns;
        clk <= '0';
        wait for 5ns;
		  


if point  >= "0001" then  -- if point is greater than 1

sp <= '1';

else

sp <= '0';

end if; -- works


if (sum = "1011") then

D711 <= '1';

elsif (sum = "0111") then
D711 <= '1';

else
D711 <= '0';

end if;


    end process;
	
		


UUT : craps port map (clk , roll, rst, rn1, rn2, seed1(7 downto 0), seed1(15 downto 8), cnt, point, win, lose, sum);

c1 : comparator port map(clk,point,sum,eq); -- works
c2 : comparator port map(clk,sum,com,D7); -- works 
c3 : comparator port map(clk,sum,loss,D2312); -- works 

	
dice_roll: process

begin


	wait for 40ns;
        rst <= '1';
		  
        wait for 20ns;
		  rst <= '0';
-------------------------------------------------------	

for i in 0 to 30 loop

exit when tmp = "101";

	if flag = '1' then
	
	tmp <= tmp + "001";
	
	
	case tmp is
	
	when "000" =>
	
		seed1 <= seed2;
		
	when "001" =>
	
	   seed1 <= seed3;
		
		
	when "010" =>
	
		seed1 <= seed4;
		
		
	when "011" =>
	
		seed1 <= seed5;
		
	when others =>
	
	seed1 <= seed1;

	
	end case;
	
	
--		tmp <= tmp + "01";
--		
--		if tmp = "00" then
--		
--		
--		seed1 <= seed2;
--
--		else 
--		
--		seed1 <= seed3;
--		
--		
--		--tmp <= "00";
--		end if;
		
		
		wait for 10ns;
		rst <= '1';
		wait for 10ns;
	
		rst <= '0';
		wait for 40ns;
		
		else 

		wait for 10ns;
		
		roll <= '1'; -- roll dice for one clock cycle
		
		wait for 10ns;
	
		roll <= '0';
		
		wait for 40ns;
		

		
		end if;
		
		end loop;	
---------------------------------			

		wait for 40ns;
        rst <= '1';
		  
        wait for 20ns;
		  rst <= '0';


--		wait for 40ns; 
--		 roll <= '1';
--		 wait for 10ns;
--		 roll <= '0';
--
--		 
--		wait for 40ns; 
--		 roll <= '1';
--		 wait for 10ns;
--		 roll <= '0';
--
--		 
--		 
--		wait for 40ns; 
--		 roll <= '1';
--		 wait for 10ns;
--		 roll <= '0';

		 
		 
		 end process;
		
end behaviour;

