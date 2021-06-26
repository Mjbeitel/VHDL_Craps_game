
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity comparator_TB is

end comparator_TB; 

architecture behaviour of comparator_TB is 


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
  signal a : std_logic_vector(3 downto 0) := b"0000";
  signal b : std_logic_vector(3 downto 0) := b"0000";
  signal comp : std_logic := '0';

  
  
  begin
  
  clock: process
    begin
        clk <= '1';
        wait for 5ns;
        clk <= '0';
        wait for 5ns;
		  

    end process;
	 
UUT : comparator port map(clk,a,b,comp);

	com: process
	begin

	a <= "0000";
	
	b <= "0001";
	 wait for 20ns;
	 
	a <= "0101";
	b <= "0001";
	 wait for 20ns;
	 
	a <= "0001";
	b <= "0101";
	 wait for 20ns;
	
	
	a <= "1001";
	b <= "0101";
	 wait for 20ns;
	 
	a <= "1101";
	b <= "1101";
	 wait for 20ns;

	a <= "1000";
	b <= "1001";
	 wait for 20ns;
	 
	a <= "0011";
	b <= "0011";
	 wait for 20ns;
	 
	end process;


end behaviour;