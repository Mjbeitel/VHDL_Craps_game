library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity adder_operator is

 generic(
        WIDTH : integer := 4 -- change to 6 because we dont want negative numbers
    );

    Port ( a_in : in  STD_LOGIC_VECTOR (WIDTH-1 downto 0) ;
           b_in : in  STD_LOGIC_VECTOR (WIDTH-1 downto 0) ;
			  clk : in std_logic;
           s_out  : out STD_LOGIC_VECTOR (WIDTH-1 downto 0));
end adder_operator;

architecture Behavioral of adder_operator is
    signal a :  STD_LOGIC_VECTOR (WIDTH-1 downto 0);
    signal b :  STD_LOGIC_VECTOR (WIDTH-1 downto 0);
    signal X :  STD_LOGIC_VECTOR (WIDTH-1 downto 0);
begin
    process (clk) begin
		if(rising_edge(clk)) then
			a <= a_in;
			b <= b_in;
			s_out <= X;
		
		end if;

	 end process;
	 
	 
    X <= a_in + b_in; -- most efficienct
    
end Behavioral;