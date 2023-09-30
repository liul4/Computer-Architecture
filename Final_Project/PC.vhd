----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.12.2021 13:39:05
-- Design Name: 
-- Module Name: PC - Behavioral
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
use IEEE.STD_LOGIC_SIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC is
Port ( PC_in: in std_logic_vector(31 downto 0);
       PL, PI, clock: in std_logic; 
       PC_out: INout std_logic_vector(31 downto 0)
);
end PC;

architecture Behavioral of PC is

begin
process(clock)
begin
if(rising_edge(clock)) then
if (PL='1')then
PC_out<=PC_in;
elsif (PI='1' AND PL='0')then
PC_out <= (PC_out+1) after 2 ns;
end if;
end if;
end process;
end Behavioral;
