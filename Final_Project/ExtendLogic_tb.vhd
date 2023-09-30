----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.12.2021 14:21:41
-- Design Name: 
-- Module Name: ExtendLogic_tb - Behavioral
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

entity ExtendLogic_tb is
--  Port ( );
end ExtendLogic_tb;

architecture Behavioral of ExtendLogic_tb is
COMPONENT ExtendLogic
Port ( DR, SB: in std_logic_vector(4 downto 0);
       Extend_out: out std_logic_vector(31 downto 0)
);
END COMPONENT;
signal DR, SB : std_logic_vector(4 downto 0) := (others => '0');
signal Extend_out : std_logic_vector(31 downto 0) := (others => '0');
begin
uut: ExtendLogic PORT MAP (
  DR=>DR,
  SB=>SB,
  Extend_out=>Extend_out
);
stim_proc: process
    begin
    DR<="01010";
    SB<="00111";
    wait for 2 ns;
    DR<="11011";
    SB<="10101";
    wait for 2 ns;
    DR<="11000";
    SB<="10111";
    wait for 2 ns;
    end process;
 
END;
