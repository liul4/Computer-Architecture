----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.12.2021 13:18:12
-- Design Name: 
-- Module Name: IR_tb - Behavioral
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

entity IR_tb is
--  Port ( );
end IR_tb;

architecture Behavioral of IR_tb is
COMPONENT IR
Port ( IR_in: in std_logic_vector(31 downto 0);
       IL, clock: in std_logic;
       Opcode: out std_logic_vector(16 downto 0);
       DR, SA, SB: out std_logic_vector(4 downto 0)
);
END COMPONENT;
signal IR_in : std_logic_vector(31 downto 0) := (others => '0');
signal IL, clock : std_logic := '0';
signal Opcode : std_logic_vector(16 downto 0) := (others => '0');
signal DR, SA, SB : std_logic_vector(4 downto 0) := (others => '0');
constant PERIOD : time := 20ns;
begin
uut: IR PORT MAP (
  IR_in=>IR_in,
  IL=>IL,
  clock=>clock,
  Opcode=>Opcode,
  DR=>DR,
  SA=>SA,
  SB=>SB
);
clock <= not clock after PERIOD/2;
stim_proc: process
  begin
  IL<='1';
  IR_in<="01010101010101010101010101010111";
  wait until clock'event and clock='1';
  IR_in<="11110101010101110101110101010110";
  wait until clock'event and clock='1';
  IR_in<="11110000010111011101010111110101";
  wait until clock'event and clock='1';
  end process;
end Behavioral;
