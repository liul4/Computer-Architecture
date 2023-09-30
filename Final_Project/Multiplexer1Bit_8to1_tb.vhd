----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.12.2021 13:59:43
-- Design Name: 
-- Module Name: Multiplexer1Bit_8to1_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Multiplexer1Bit_8to1_tb is
--  Port ( );
end Multiplexer1Bit_8to1_tb;

architecture Behavioral of Multiplexer1Bit_8to1_tb is
COMPONENT Multiplexer1Bit_8to1
    Port ( 
    Z1,C1,N,Z,V,C,A1,A0: in STD_LOGIC;
    S: in STD_LOGIC_VECTOR (2 downto 0);
    M_out: out STD_LOGIC
    );
    END COMPONENT;
-- Inputs
   signal Z1,C1,N,Z,V,C,A1,A0 : std_logic := '0';
   signal S : std_logic_vector(2 downto 0) := (others => '0');
 
--Outputs
   signal M_out: std_logic := '0';

begin
uut: Multiplexer1Bit_8to1 PORT MAP (
          Z1 => Z1,
          C1 => C1,
          N=>N,
          Z => Z,
          V=>V,
          C => C,
          A0=>A0,
          A1=>A1,
          S => S,
          M_out=>M_out
        );

   stim_proc: process
   begin
    wait for 2 ns; 
 
    Z1<='1';
    C1 <= '0';
    N<='1';
    Z <='0';
    V<='1';
    C<='0';
    A0<='1';
    A1<='0';
    S <= "000";
 
      wait for 2 ns; 
 
    S <= "001";
 
      wait for 2 ns; 
 
    S <= "010";
 
        wait for 2 ns;   
 
    S <= "011";
 
        wait for 2 ns;   
    S <= "100";
    
        wait for 2 ns;   
    S <= "101";
    
    wait for 2 ns;   
    S <= "110";
    
    wait for 2 ns;   
    S <= "111";
    
    wait for 2 ns; 
 
    end process;
 
END;
