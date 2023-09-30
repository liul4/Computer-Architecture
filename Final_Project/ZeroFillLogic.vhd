----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.12.2021 12:45:46
-- Design Name: 
-- Module Name: ZeroFillLogic - Behavioral
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

entity ZeroFillLogic is
Port ( SB: in std_logic_vector(4 downto 0);
       zero_out: out std_logic_vector(31 downto 0)
);
end ZeroFillLogic;

architecture Behavioral of ZeroFillLogic is

begin
zero_out(4 downto 0)<=SB;
zero_out(31 downto 5)<="000000000000000000000000000";

end Behavioral;
