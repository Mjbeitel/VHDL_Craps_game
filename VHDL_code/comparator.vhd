library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity comparator is
    generic(
        WIDTH : integer := 4 -- change to 5 so no negatives
    );
    Port ( clk : in STD_LOGIC;
           a : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           b : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           comp : out STD_LOGIC);
end comparator;

architecture Behavioral of comparator is    
begin
    process(clk) begin
        --perform comparison on clock edge
        if( rising_edge(clk)) then
            -- if they're equal, give a '1'
            if ( a = b) then
                comp <= '1';   
            else 
                comp <= '0';
            end if;
        end if;        
    end process;
end Behavioral;


-- works
