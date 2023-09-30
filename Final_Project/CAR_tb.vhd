----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.12.2021 12:37:49
-- Design Name: 
-- Module Name: CAR_tb - Behavioral
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

entity CAR_tb is
--  Port ( );
end CAR_tb;

architecture Behavioral of CAR_tb is
COMPONENT CAR
Port ( muxC: in std_logic_vector(16 downto 0);
       muxS, clock : in std_logic;
       CAR_out: inout std_logic_vector(16 downto 0)
);
END COMPONENT;
signal muxC : std_logic_vector(16 downto 0) := (others => '0');
signal muxS, clock : std_logic := '0';
signal CAR_out : std_logic_vector(16 downto 0) := (others => '0');
constant PERIOD : time := 20ns;
begin
uut: CAR PORT MAP (
  muxC=>muxC,
  muxS=>muxS,
  clock=>clock,
  CAR_out=>CAR_out
);
clock <= not clock after PERIOD/2;
stim_proc: process
  begin
  muxC<="01010101010101010";
  muxS<='1';
  wait until clock'event and clock='1';
  muxS<='0';
  wait until clock'event and clock='1';
  muxS<='0';
  wait until clock'event and clock='1';
  muxS<='0';
  wait until clock'event and clock='1';
  muxS<='1';
  muxC<="00000000000000001";
  wait until clock'event and clock='1';
  muxS<='0';
  wait until clock'event and clock='1';
  muxS<='0';
  wait until clock'event and clock='1';
  muxS<='0';
  wait until clock'event and clock='1';
  muxS<='0';
  wait until clock'event and clock='1';
  muxS<='0';
  wait until clock'event and clock='1';
  muxS<='0';
  wait until clock'event and clock='1';
  end process;
end;
