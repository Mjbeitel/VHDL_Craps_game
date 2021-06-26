
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;


entity adder_operator_TB is

end adder_operator_TB; 

architecture Behavioral of adder_operator_TB is

component adder_operator is

generic(
        WIDTH : integer := 4 -- change to 6 because we dont want negative numbers
    );

    Port ( a_in : in  STD_LOGIC_VECTOR (WIDTH-1 downto 0) ;
           b_in : in  STD_LOGIC_VECTOR (WIDTH-1 downto 0) ;
			  clk : in std_logic;
           s_out  : out STD_LOGIC_VECTOR (WIDTH-1 downto 0));
end component;


	 signal a_in :  STD_LOGIC_VECTOR (3 downto 0) := (others =>'0');
	 signal b_in :  STD_LOGIC_VECTOR (3 downto 0) := (others =>'0');
	 signal s_out :  STD_LOGIC_VECTOR (3 downto 0) := (others =>'0');
	 signal clk : std_logic;
	 
	 
	 begin
    -- clock stim
    clock: process
    begin
        clk <= '1';
        wait for 5ns;
        clk <= '0';
        wait for 5ns;
    end process;
	 
	 
	 UUT : adder_operator port map(a_in,b_in,clk,s_out);
	 
	 
	 a_ds: process
	 
	 begin 
	 
	  a_in <= "0000";
	  b_in <= "0000";
	 wait for 20ns;
	 -----------------------------------
	 for i in 0 to 5 loop
	 
	 a_in <= "0001";
	 
	 wait for 10ns;
	 
	 b_in <= b_in + "0001";
	 
	 wait for 20ns;
	 
	 end loop;
	 
	  a_in <= "0000";
	  b_in <= "0000";
	   wait for 20ns;
	 --------------------------------------
	  for i in 0 to 5 loop
	 
	 b_in <= "0101";
	 
	 wait for 10ns;
	 
	 a_in <= a_in + "0001";
	 
	 wait for 20ns;
	 
	 end loop;
	 
	   a_in <= "0101";
	  b_in <= "0010";
	   wait for 20ns;
	 --------------------------------------
	 
	  for i in 0 to 5 loop
	 
	 a_in <= "0011";
	 
	 wait for 10ns;
	 
	 b_in <= b_in + "0001";
	 
	 wait for 20ns;
	 
	 end loop;
	 
	 
	 
	 end process;
	 
	 end Behavioral;
	 
	 
	 
	 
