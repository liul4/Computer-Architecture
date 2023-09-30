----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.12.2021 12:37:34
-- Design Name: 
-- Module Name: CAR - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CAR is
Port ( muxC: in std_logic_vector(16 downto 0);
       muxS, clock : in std_logic;
       CAR_out: inout std_logic_vector(16 downto 0)
);
end CAR;

architecture Behavioral of CAR is

begin
process(clock)
begin
if(rising_edge(clock)) then
if (muxS='1')then
CAR_out<=muxC;
elsif (muxS='0')then
CAR_out <= (CAR_out+1) after 2 ns;
end if;
end if;
end process;
end Behavioral;
