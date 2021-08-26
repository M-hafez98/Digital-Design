LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY RAM128_32 IS
	generic
	(
		D_Width : integer := 32;
		A_Width : integer := 7
	);
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (6 DOWNTO 0); -- 128 address range
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0); -- 32-bit memory wide
		wren		: IN STD_LOGIC ; -- enable the decoder
		q			: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END RAM128_32;

architecture arch_RAM128_32 of RAM128_32 is
type arr_RAM128 is array(0 to 2**A_Width-1) of std_logic_vector(D_Width-1 downto 0);
signal RAM128 : arr_RAM128;
begin
	RAM128_Proc : process(clock,wren)
	begin
		if(rising_edge(clock)) then
			if (wren='1') then
				RAM128(to_integer(unsigned(address))) <= data;
				q <= data;
			elsif (wren='0') then
				q <= RAM128(to_integer(unsigned(address)));
			end if;
		end if;
	end process RAM128_Proc;
end arch_RAM128_32;