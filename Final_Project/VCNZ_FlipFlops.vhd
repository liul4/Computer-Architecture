----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.12.2021 11:44:22
-- Design Name: 
-- Module Name: VCNZ_FlipFlops - Behavioral
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

entity VCNZ_FlipFlops is
Port (  V, C, N, Z, FL, clock : in std_logic;
        Reset : in std_logic_vector(3 downto 0);
        VCNZ : OUT std_logic_vector(3 downto 0)
 );
end VCNZ_FlipFlops;

architecture Behavioral of VCNZ_FlipFlops is

begin
process(clock)
begin
if(rising_edge(clock)) then
VCNZ(0)<=C;
VCNZ(1)<=V;
VCNZ(2)<=Z;
VCNZ(3)<=N;
if(Reset(0)='1' AND FL='1') then
VCNZ(0)<='0';
if(Reset(1)='1' AND FL='1') then
VCNZ(1)<='0';
if(Reset(2)='1' AND FL='1') then
VCNZ(2)<='0';
if(Reset(3)='1' AND FL='1') then
VCNZ(3)<='0';
end if;
end if;
end if;
end if;
end if;
end process;
end Behavioral;
