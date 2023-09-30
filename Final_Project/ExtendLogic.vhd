----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.12.2021 14:21:26
-- Design Name: 
-- Module Name: ExtendLogic - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ExtendLogic is
Port ( DR, SB: in std_logic_vector(4 downto 0);
       Extend_out: out std_logic_vector(31 downto 0)
);
end ExtendLogic;

architecture Behavioral of ExtendLogic is

begin
Extend_out(9 downto 5)<= DR after 2ns;
Extend_out(4 downto 0)<= SB after 2ns;
Extend_out(30 downto 10)<="000000000000000000000" after 2ns;
Extend_out(31)<=DR(4);
end Behavioral;
