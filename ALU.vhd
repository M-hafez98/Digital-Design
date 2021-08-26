LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY ALU IS
PORT
	( 	Op_code : IN STD_LOGIC_VECTOR( 2 DOWNTO 0 );
		A, B 	: IN STD_LOGIC_VECTOR( 31 DOWNTO 0 );
		Y 		: OUT STD_LOGIC_VECTOR( 31 DOWNTO 0 ) );
END ALU;

architecture arch_ALU of ALU is
begin
	Y <= A 			when (Op_code="000") else
		 A+B		when (Op_code="001") else
		 A-B		when (Op_code="010") else
		 A AND B 	when (Op_code="011") else
		 A OR B 	when (Op_code="100") else
		 A + 1		when (Op_code="101") else
		 A - 1		when (Op_code="110") else
		 B		when (Op_code="111");

end arch_ALU;