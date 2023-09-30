----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.12.2021 12:46:24
-- Design Name: 
-- Module Name: ZeroFillLogic_tb - Behavioral
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

entity ZeroFillLogic_tb is
--  Port ( );
end ZeroFillLogic_tb;

architecture Behavioral of ZeroFillLogic_tb is
COMPONENT ZeroFillLogic
Port ( SB: in std_logic_vector(4 downto 0);
       zero_out: out std_logic_vector(31 downto 0)
);
END COMPONENT;
signal SB : std_logic_vector(4 downto 0) := (others => '0');
signal zero_out : std_logic_vector(31 downto 0) := (others => '0');
begin
uut: ZeroFillLogic PORT MAP (
  SB=>SB,
  zero_out=>zero_out
);
stim_proc: process
    begin
    SB<="01111";
    wait for 2 ns;
    SB<="00101";
    wait for 2 ns;
    SB<="00111";
    wait for 2 ns;
    SB<="01001";
    wait for 2 ns;
    end process;
 
END;
