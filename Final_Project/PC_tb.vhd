----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.12.2021 13:39:25
-- Design Name: 
-- Module Name: PC_tb - Behavioral
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

entity PC_tb is
--  Port ( );
end PC_tb;

architecture Behavioral of PC_tb is
COMPONENT PC
Port ( PC_in: in std_logic_vector(31 downto 0);
       PL, PI, clock: in std_logic; 
       PC_out: INout std_logic_vector(31 downto 0)
);
END COMPONENT;
signal PC_in : std_logic_vector(31 downto 0) := (others => '0');
signal PI, PL, clock : std_logic := '0';
signal PC_out : std_logic_vector(31 downto 0) := (others => '0');
constant PERIOD : time := 20ns;
begin
uut: PC PORT MAP (
  PC_in=>PC_in,
  PL=>PL,
  PI=>PI,
  clock=>clock,
  PC_out=>PC_out
);
clock <= not clock after PERIOD/2;
stim_proc: process
  begin
  PL<='1';
  PC_in<="01010101010101010101010101010111";
  wait until clock'event and clock='1';
  PL<='0';
  PI<='1';
  wait until clock'event and clock='1';
  PI<='1';
  wait until clock'event and clock='1';
  PI<='0';
  wait until clock'event and clock='1';
  PL<='1';
  PC_in<="11110000010101010101010111110111";
  wait until clock'event and clock='1';
  PL<='0';
  PI<='1';
  wait until clock'event and clock='1';
  PI<='1';
  wait until clock'event and clock='1';
  PI<='0';
  wait until clock'event and clock='1';
  end process;
end Behavioral;
