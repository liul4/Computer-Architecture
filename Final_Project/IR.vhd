----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.12.2021 13:17:56
-- Design Name: 
-- Module Name: IR - Behavioral
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

entity IR is
Port ( IR_in: in std_logic_vector(31 downto 0);
       IL, clock: in std_logic;
       Opcode: out std_logic_vector(16 downto 0);
       DR, SA, SB: out std_logic_vector(4 downto 0)
);
end IR;

architecture Behavioral of IR is

begin
process(clock)
begin

if(rising_edge(clock)) then
if (IL='1') then
Opcode<=IR_in(31 downto 15);
DR<=IR_in(14 downto 10);
SA<=IR_in(9 downto 5);
SB<=IR_in(4 downto 0);
END IF;
END IF;
end process;
end Behavioral;
