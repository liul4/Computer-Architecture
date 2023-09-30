----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.12.2021 00:33:30
-- Design Name: 
-- Module Name: Microprocessor1_tb - Behavioral
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

entity Microprocessor1_tb is
--  Port ( );
end Microprocessor1_tb;

architecture Behavioral of Microprocessor1_tb is
COMPONENT Microprocessor1
Port ( Clk,RW,TD,TA,TB,MB,MM,MW,MD : in std_logic;
       DR,SA,SB,FS : in std_logic_vector(4 downto 0);
       constantIn,InstructionAddress: in std_logic_vector(31 downto 0);
       V,C,N,Z: out std_logic;
       Data_out: out std_logic_vector(31 downto 0)
);
    END COMPONENT;
    signal Clk,RW,TD,TA,TB,MB,MM,MW,MD : std_logic:= '0';
    signal DR,SA,SB,FS : std_logic_vector(4 downto 0) := (others => '0');
    signal constantIn,InstructionAddress : std_logic_vector(31 downto 0) := (others => '0');
    signal V,C,N,Z : STD_LOGIC:= '0';
    signal Data_out : std_logic_vector(31 downto 0) := (others => '0');
    
    constant PERIOD : time := 20ns;
begin
uut: Microprocessor1 PORT MAP (
          RW=>RW,
		  DR=>DR,
		  SA=>SA,
		  SB=>SB,
		  TD=>TD,
		  TA=>TA,
		  TB=>TB,
		  FS => FS,
		  constantIn => constantIn,
		  InstructionAddress=>InstructionAddress,
		  MB => MB,
		  MD => MD,
		  MM=>MM,
		  MW=>MW,
		  Clk =>Clk,
          C => C,
          V => V,
          Z => Z,
          N => N,
          Data_out=>Data_out
        );
        Clk <= not Clk after PERIOD/2;

 stim_proc: process
begin
MW<='0';
MM<='1';
InstructionAddress<=X"00000052";
MD<='1';
RW<='1';
TD<='0';
TA<='0';
TB<='0';
DR <= "00000";
wait until CLK'event and CLK='1';
      DR <= "00001";
      InstructionAddress<=X"00000053";
      -- Detination Register 2 
      wait until CLK'event and CLK='1';
      DR <= "00010";
      InstructionAddress<=X"00000054";
      -- Detination Register 3 
      wait until CLK'event and CLK='1';
      DR <= "00011";
      InstructionAddress<=X"00000055";
      -- Detination Register 4
      wait until CLK'event and CLK='1';
      DR <= "00100";
      InstructionAddress<=X"00000056";
      -- Detination Register 5
      wait until CLK'event and CLK='1';
      DR <= "00101";
      InstructionAddress<=X"00000057";
      -- Detination Register 6
      wait until CLK'event and CLK='1';
      DR <= "00110";
      InstructionAddress<=X"00000058";
	  -- Detination Register 7
	  wait until CLK'event and CLK='1';
      DR <= "00111";
      InstructionAddress<=X"00000059";
	  -- Detination Register 8
	  wait until CLK'event and CLK='1';
      DR <= "01000";
      InstructionAddress<=X"0000005A";
	  -- Detination Register 9
	  wait until CLK'event and CLK='1';
      DR <= "01001";
      InstructionAddress<=X"0000005B";
	  -- Detination Register 10
	  wait until CLK'event and CLK='1';
      DR<= "01010";
      InstructionAddress<=X"0000005C";
	  -- Detination Register 11
	  wait until CLK'event and CLK='1';
      DR <= "01011";
      InstructionAddress<=X"0000005D";
	  -- Detination Register 12
	  wait until CLK'event and CLK='1';
      DR <= "01100";
      InstructionAddress<=X"0000005E";
	  -- Detination Register 13, load 19336839
	  wait until CLK'event and CLK='1';
      DR <= "01101";
      InstructionAddress<=X"0000005F";
	  -- Detination Register 14
	  wait until CLK'event and CLK='1';
      DR <= "01110";
      InstructionAddress<=X"00000060";
-- Detination Register 15
	  wait until CLK'event and CLK='1';
      DR <= "01111";
      InstructionAddress<=X"00000061";
	  -- Detination Register 16
	  wait until CLK'event and CLK='1';
      DR <= "10000";
      InstructionAddress<=X"00000062";
	  -- Detination Register 17
	  wait until CLK'event and CLK='1';
      DR <= "10001";
      InstructionAddress<=X"00000063";
	  -- Detination Register 18
	  wait until CLK'event and CLK='1';
      DR <= "10010";
      InstructionAddress<=X"00000064";
	  -- Detination Register 19
	  wait until CLK'event and CLK='1';
      DR <= "10011";
      InstructionAddress<=X"00000065";
	  -- Detination Register 20
	  wait until CLK'event and CLK='1';
      DR <= "10100";
      InstructionAddress<=X"00000066";
	  -- Detination Register 21
	  wait until CLK'event and CLK='1';
      DR <= "10101";
      InstructionAddress<=X"00000067";
	  -- Detination Register 22, load 19336830
	  wait until CLK'event and CLK='1';
      DR <= "10110";
      InstructionAddress<=X"00000068";
	  -- Detination Register 23, load 19336829
	  wait until CLK'event and CLK='1';
      DR <= "10111";
      InstructionAddress<=X"00000069";
	  -- Detination Register 24
	  wait until CLK'event and CLK='1';
      DR <= "11000";
      InstructionAddress<=X"0000006A";
	  -- Detination Register 25
	  wait until CLK'event and CLK='1';
      DR <= "11001";
      InstructionAddress<=X"0000006B";
	  -- Detination Register 26
	  wait until CLK'event and CLK='1';
      DR <= "11010";
      InstructionAddress<=X"0000006C";
	  -- Detination Register 27
	  wait until CLK'event and CLK='1';
      DR <= "11011";
      InstructionAddress<=X"0000006D";
	  -- Detination Register 28
	  wait until CLK'event and CLK='1';
      DR <= "11100";
      InstructionAddress<=X"0000006E";
	  -- Detination Register 29
	  wait until CLK'event and CLK='1';
      DR <= "11101";
      InstructionAddress<=X"0000006F";
	  -- Detination Register 30
	  wait until CLK'event and CLK='1';
      DR <= "11110";
      InstructionAddress<=X"00000070";
        -- Detination Register 31,19336821
	  wait until CLK'event and CLK='1';
      DR <= "11111";
      InstructionAddress<=X"00000071";
        -- Detination Register 32,19336820
      wait until CLK'event and CLK='1';
      DR <= "11111";
      TD <= '1';
      InstructionAddress<=X"00000072";
      wait until CLK'event and CLK='1';
      TD <= '0';
      MD<='0';
      --MB<='1';
      --constantIn<=X"00000001";
      FS<="01110";
      DR <= "00000";
      SA <= "00000";
      wait until CLK'event and CLK='1';
      FS<="00001";
      wait until CLK'event and CLK='1';
      DR <= "00001";
      SA <= "00001";
      FS<="01110";
      wait until CLK'event and CLK='1';
      FS<="00001";
      wait until CLK'event and CLK='1';
      DR <= "00010";
      SA <= "00010";
      FS<="01110";
      wait until CLK'event and CLK='1';
      FS<="00001";
      -- Detination Register 3 
      wait until CLK'event and CLK='1';
      DR <= "00011";
      SA <= "00011";
      FS<="01110";
      wait until CLK'event and CLK='1';
      FS<="00001";
      -- Detination Register 4
      wait until CLK'event and CLK='1';
      DR <= "00100";
      SA <= "00100";
      FS<="01110";
      wait until CLK'event and CLK='1';
      FS<="00001";
      -- Detination Register 5
      wait until CLK'event and CLK='1';
      DR <= "00101";
      SA <= "00101";
      FS<="01110";
      wait until CLK'event and CLK='1';
      FS<="00001";
      -- Detination Register 6
      wait until CLK'event and CLK='1';
      DR <= "00110";
      SA <= "00110";
      FS<="01110";
      wait until CLK'event and CLK='1';
      FS<="00001";
	  -- Detination Register 7
	  wait until CLK'event and CLK='1';
      DR <= "00111";
      SA <= "00111";
      FS<="01110";
      wait until CLK'event and CLK='1';
      FS<="00001";
	  -- Detination Register 8
	  wait until CLK'event and CLK='1';
      DR <= "01000";
      SA <= "01000";
      FS<="01110";
      wait until CLK'event and CLK='1';
      FS<="00001";
	  -- Detination Register 9
	  wait until CLK'event and CLK='1';
      DR <= "01001";
      SA <= "01001";
      FS<="01110";
      wait until CLK'event and CLK='1';
      FS<="00001";
	  -- Detination Register 10
	  wait until CLK'event and CLK='1';
      DR<= "01010";
      SA <= "01010";
      FS<="01110";
      wait until CLK'event and CLK='1';
      FS<="00001";
	  -- Detination Register 11
	  wait until CLK'event and CLK='1';
      DR <= "01011";
      SA <= "01011";
      FS<="01110";
      wait until CLK'event and CLK='1';
      FS<="00001";
	  -- Detination Register 12
	  wait until CLK'event and CLK='1';
      DR <= "01100";
      SA <= "01100";
      FS<="01110";
      wait until CLK'event and CLK='1';
      FS<="00001";
	  -- Detination Register 13, load 19336839
	  wait until CLK'event and CLK='1';
      DR <= "01101";
      SA <= "01101";
      FS<="01110";
      wait until CLK'event and CLK='1';
      FS<="00001";
	  -- Detination Register 14
	  wait until CLK'event and CLK='1';
      DR <= "01110";
      SA <= "01110";
      FS<="01110";
      wait until CLK'event and CLK='1';
      FS<="00001";
-- Detination Register 15
	  wait until CLK'event and CLK='1';
      DR <= "01111";
      SA <= "01111";
      FS<="01110";
      wait until CLK'event and CLK='1';
      FS<="00001";
	  -- Detination Register 16
	  wait until CLK'event and CLK='1';
      DR <= "10000";
      SA <= "10000";
      FS<="01110";
      wait until CLK'event and CLK='1';
      FS<="00001";
	  -- Detination Register 17
	  wait until CLK'event and CLK='1';
      DR <= "10001";
      SA <= "10001";
      FS<="01110";
      wait until CLK'event and CLK='1';
      FS<="00001";
	  -- Detination Register 18
	  wait until CLK'event and CLK='1';
      DR <= "10010";
      SA <= "10010";
      FS<="01110";
      wait until CLK'event and CLK='1';
      FS<="00001";
	  -- Detination Register 19
	  wait until CLK'event and CLK='1';
      DR <= "10011";
      SA <= "10011";
      FS<="01110";
      wait until CLK'event and CLK='1';
      FS<="00001";
	  -- Detination Register 20
	  wait until CLK'event and CLK='1';
      DR <= "10100";
      SA <= "10100";
      FS<="01110";
      wait until CLK'event and CLK='1';
      FS<="00001";
	  -- Detination Register 21
	  wait until CLK'event and CLK='1';
      DR <= "10101";
      SA <= "10101";
      FS<="01110";
      wait until CLK'event and CLK='1';
      FS<="00001";
	  -- Detination Register 22, load 19336830
	  wait until CLK'event and CLK='1';
      DR <= "10110";
      SA <= "10110";
      FS<="01110";
      wait until CLK'event and CLK='1';
      FS<="00001";
	  -- Detination Register 23, load 19336829
	  wait until CLK'event and CLK='1';
      DR <= "10111";
      SA <= "10111";
      FS<="01110";
      wait until CLK'event and CLK='1';
      FS<="00001";
	  -- Detination Register 24
	  wait until CLK'event and CLK='1';
      DR <= "11000";
      SA <= "11000";
      FS<="01110";
      wait until CLK'event and CLK='1';
      FS<="00001";
	  -- Detination Register 25
	  wait until CLK'event and CLK='1';
      DR <= "11001";
      SA <= "11001";
      FS<="01110";
      wait until CLK'event and CLK='1';
      FS<="00001";
	  -- Detination Register 26
	  wait until CLK'event and CLK='1';
      DR <= "11010";
      SA <= "11010";
      FS<="01110";
      wait until CLK'event and CLK='1';
      FS<="00001";
	  -- Detination Register 27
	  wait until CLK'event and CLK='1';
      DR <= "11011";
      SA <= "11011";
      FS<="01110";
      wait until CLK'event and CLK='1';
      FS<="00001";
	  -- Detination Register 28
	  wait until CLK'event and CLK='1';
      DR <= "11100";
      SA <= "11100";
      FS<="01110";
      wait until CLK'event and CLK='1';
      FS<="00001";
	  -- Detination Register 29
	  wait until CLK'event and CLK='1';
      DR <= "11101";
      SA <= "11101";
      FS<="01110";
      wait until CLK'event and CLK='1';
      FS<="00001";
	  -- Detination Register 30
	  wait until CLK'event and CLK='1';
      DR <= "11110";
      SA <= "11110";
      FS<="01110";
      wait until CLK'event and CLK='1';
      FS<="00001";
        -- Detination Register 31,19336821
	  wait until CLK'event and CLK='1';
      DR <= "11111";
      SA <= "11111";
      FS<="01110";
      wait until CLK'event and CLK='1';
      FS<="00001";
      wait until CLK'event and CLK='1';
      TD <= '1';
      TA<='1';
      FS<="01110";
      wait until CLK'event and CLK='1';
      FS<="00001";
      wait until CLK'event and CLK='1';
      TD <= '0';
      TA<='0';
      MW<='1';
      MM<='1';
      MB<='0';
      RW<='0';
      SB <= "00000";
      InstructionAddress<=X"00000052";
      wait until CLK'event and CLK='1';
      SB <= "00001";
      InstructionAddress<=X"00000053";
      -- Detination Register 2 
      wait until CLK'event and CLK='1';
      SB <= "00010";
      InstructionAddress<=X"00000054";
      -- Detination Register 3 
      wait until CLK'event and CLK='1';
      SB <= "00011";
      InstructionAddress<=X"00000055";
      -- Detination Register 4
      wait until CLK'event and CLK='1';
      SB <= "00100";
      InstructionAddress<=X"00000056";
      -- Detination Register 5
      wait until CLK'event and CLK='1';
      SB <= "00101";
      InstructionAddress<=X"00000057";
      -- Detination Register 6
      wait until CLK'event and CLK='1';
      SB <= "00110";
      InstructionAddress<=X"00000058";
	  -- Detination Register 7
	  wait until CLK'event and CLK='1';
      SB <= "00111";
      InstructionAddress<=X"00000059";
	  -- Detination Register 8
	  wait until CLK'event and CLK='1';
      SB <= "01000";
      InstructionAddress<=X"0000005A";
	  -- Detination Register 9
	  wait until CLK'event and CLK='1';
      SB <= "01001";
      InstructionAddress<=X"0000005B";
	  -- Detination Register 10
	  wait until CLK'event and CLK='1';
      SB<= "01010";
      InstructionAddress<=X"0000005C";
	  -- Detination Register 11
	  wait until CLK'event and CLK='1';
      SB <= "01011";
      InstructionAddress<=X"0000005D";
	  -- Detination Register 12
	  wait until CLK'event and CLK='1';
      SB <= "01100";
      InstructionAddress<=X"0000005E";
	  -- Detination Register 13, load 19336839
	  wait until CLK'event and CLK='1';
      SB <= "01101";
      InstructionAddress<=X"0000005F";
	  -- Detination Register 14
	  wait until CLK'event and CLK='1';
      SB <= "01110";
      InstructionAddress<=X"00000060";
-- Detination Register 15
	  wait until CLK'event and CLK='1';
      SB <= "01111";
      InstructionAddress<=X"00000061";
	  -- Detination Register 16
	  wait until CLK'event and CLK='1';
      SB <= "10000";
      InstructionAddress<=X"00000062";
	  -- Detination Register 17
	  wait until CLK'event and CLK='1';
      SB <= "10001";
      InstructionAddress<=X"00000063";
	  -- Detination Register 18
	  wait until CLK'event and CLK='1';
      SB <= "10010";
      InstructionAddress<=X"00000064";
	  -- Detination Register 19
	  wait until CLK'event and CLK='1';
      SB<= "10011";
      InstructionAddress<=X"00000065";
	  -- Detination Register 20
	  wait until CLK'event and CLK='1';
      SB <= "10100";
      InstructionAddress<=X"00000066";
	  -- Detination Register 21
	  wait until CLK'event and CLK='1';
      SB <= "10101";
      InstructionAddress<=X"00000067";
	  -- Detination Register 22, load 19336830
	  wait until CLK'event and CLK='1';
      SB<= "10110";
      InstructionAddress<=X"00000068";
	  -- Detination Register 23, load 19336829
	  wait until CLK'event and CLK='1';
      SB<= "10111";
      InstructionAddress<=X"00000069";
	  -- Detination Register 24
	  wait until CLK'event and CLK='1';
      SB <= "11000";
      InstructionAddress<=X"0000006A";
	  -- Detination Register 25
	  wait until CLK'event and CLK='1';
      SB <= "11001";
      InstructionAddress<=X"0000006B";
	  -- Detination Register 26
	  wait until CLK'event and CLK='1';
      SB <= "11010";
      InstructionAddress<=X"0000006C";
	  -- Detination Register 27
	  wait until CLK'event and CLK='1';
      SB <= "11011";
      InstructionAddress<=X"0000006D";
	  -- Detination Register 28
	  wait until CLK'event and CLK='1';
      SB <= "11100";
      InstructionAddress<=X"0000006E";
	  -- Detination Register 29
	  wait until CLK'event and CLK='1';
      SB <= "11101";
      InstructionAddress<=X"0000006F";
	  -- Detination Register 30
	  wait until CLK'event and CLK='1';
      SB <= "11110";
      InstructionAddress<=X"00000070";
        -- Detination Register 31,19336821
	  wait until CLK'event and CLK='1';
      SB <= "11111";
      InstructionAddress<=X"00000071";
        -- Detination Register 32,19336820
      wait until CLK'event and CLK='1';
      SB <= "11111";
      TB <= '1';
      InstructionAddress<=X"00000072";
      wait until CLK'event and CLK='1';
      TB <= '0';
      TB<='0';
      MD<='0';
end process;
end Behavioral;
