LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all; -- for addition (+) operation

-- synchronous 4-bit binary counter implementation for DM74LS163A IC

entity AAC2M2P1 is port (                 	
   CP	:	in std_logic; 	-- clock
   SR	:	in std_logic;  -- Active low, synchronous reset
   P	:	in std_logic_vector(3 downto 0);  -- Parallel input (A,B,C,D)
   PE	:  	in std_logic;  -- Parallel Enable (Load)
   CEP	: 	in std_logic;  -- Count enable parallel input (P)
   CET	:  	in std_logic; -- Count enable trickle input (T)
   Q	:   	out std_logic_vector(3 downto 0); -- the counter output    			
   TC	:  	out std_logic  -- Terminal Count
);            		
end AAC2M2P1;

architecture arch_AAC2M2P1 of AAC2M2P1 is
begin
	counter_proc: process(CP,SR,P,PE,CEP,CET)
	--variable k : integer;
	begin
		if(rising_edge(CP)) then -- positive edge clock trigger
			-- Reset
			if(SR='0') then
				Q <= "0000";
			-- Load
			elsif(PE='0') then
				Q <= P;
			-- Counting
			elsif((CEP and CET)='1') then
				Q <= Q + 1; -- set the options to 2008 VHDL
			-- Terminal Count Operation
			end if;
			if((Q="1111")and (CET='1')) then 
				-- high level pulse with 8 ns
				TC <= '1';
				--wait for 8 ns;
				--wait_loop: for k in 0 to 10 loop
					--k := k + 1;
				--end loop wait_loop;
				TC <= '0';
			end if;
		end if;
	end process counter_proc;
end arch_AAC2M2P1;