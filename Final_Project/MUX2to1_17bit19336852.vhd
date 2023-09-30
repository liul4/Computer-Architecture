----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.01.2022 23:18:41
-- Design Name: 
-- Module Name: MUX2to1_17bit19336852 - Behavioral
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

entity MUX2to1_17bit19336852 is
port ( 
    A : in STD_LOGIC;
    In0 : in STD_LOGIC_VECTOR (16 downto 0);
    In1 : in STD_LOGIC_VECTOR (16 downto 0);
    Z : out STD_LOGIC_VECTOR (16 downto 0)
      );
end MUX2to1_17bit19336852;

architecture Behavioral of MUX2to1_17bit19336852 is

begin
Z <= In0 after 2 ns  WHEN A = '0' ELSE
     In1 after 2 ns  WHEN A = '1' ELSE
     "00000000000000000" after 2 ns;

end Behavioral;
