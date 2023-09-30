library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Multiplexer1Bit_8to1 is
Port ( 
    Z1,C1,N,Z,V,C,A1,A0: in STD_LOGIC;
    S: in STD_LOGIC_VECTOR (2 downto 0);
    M_out: out STD_LOGIC
);
end Multiplexer1Bit_8to1;

architecture Behavioral of Multiplexer1Bit_8to1 is

begin
M_out <= A0 after 2 ns  WHEN (S = "000") ELSE
     A1 after 2 ns  WHEN (S = "001") ELSE
     C after 2 ns  WHEN (S = "010") ELSE
     V after 2 ns  WHEN (S = "011") ELSE
	 Z after 2 ns  WHEN (S = "100") ELSE
     N after 2 ns  WHEN (S = "101") ELSE
     C1 after 2 ns  WHEN (S = "110") ELSE
     Z1 after 2 ns  WHEN (S = "111") ELSE
     '0' after 2 ns;

end Behavioral;
