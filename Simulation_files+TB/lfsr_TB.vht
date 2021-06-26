

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;


entity lfsr_TB is

end lfsr_TB; 

architecture Behavioral of lfsr_TB is
    component lfsr is
        generic(
            width : natural := 8 -- 
        );
        Port ( clk : in std_logic;
               en : in std_logic;
               rst : in std_logic;
               seed : in std_logic_vector (width -1 downto 0);
               count : inout std_logic_vector (3 downto 0));
    end component;
	 
	 
	 signal clk : std_logic := '0';
    signal en : std_logic := '0';
    signal rst : std_logic := '1';
    signal seed : std_logic_vector (7 downto 0) := "01000101"; --random seed
    signal count : std_logic_vector (3 downto 0) := (others =>'0'); -- must set to zero
    
begin
    -- clock stim
    clock: process
    begin
        clk <= '1';
        wait for 5ns;
        clk <= '0';
        wait for 5ns;
    end process;
    
    UUT: lfsr port map(clk=>clk, rst => rst, en=>en, seed=>seed, count=>count);
	 
	 
	 
	 r1: process 
	 begin
	 
	 rst <= '1';
	 wait for 30ns;
	 
	 rst <= '0';
	 
	 wait for 20ns;
	 
	 
	 for i in 0 to 20 loop
	 
	 en <= '1';
	 
	 wait for 10ns;
	 
	 end loop;
	 
	 end process;
	 
	 
	 
	 end Behavioral;
