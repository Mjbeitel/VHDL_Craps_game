library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter_TB is
--  Port ( );
end counter_TB;
architecture Behavioral of counter_TB is
    component counter is
    -- define generic depth 
   port ( L : IN STD_LOGIC;
				clock : IN STD_LOGIC;
				Data : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
				Q : BUFFER STD_LOGIC_VECTOR(4 DOWNTO 0));
				
end component;
    signal clock : std_logic := '0';
    signal L : std_logic := '1';
    signal Data : std_logic_vector(4 downto 0) := "00001";
    signal Q : std_logic_vector(4 downto 0) := (others =>'0');
begin
    UUT: counter port map(L => L, clock => clock, Data => Data, Q=> Q);
    -- Define clock input
    clock_process: process
    begin
        clock <= '1';
        wait for 5ns;
        clock <= '0';
        wait for 5ns;
    end process;
    
    shift_data: process
	 
    begin   
   
	L <= '0';
	wait for 20ns;
	
        -- loop through sample data stream
        for i in 0 to 5 loop

        L <= '1';
        wait for 80ns;
		  
		  L <= '0';
		  wait for 10ns;
		  
        end loop; 
     
    end process; 

end Behavioral;
