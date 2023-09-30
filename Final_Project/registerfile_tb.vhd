----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.01.2022 23:53:12
-- Design Name: 
-- Module Name: Registerfile19336852_tb - Behavioral
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

entity registerfile_tb is
--  Port ( );
end registerfile_tb;

architecture Behavioral of registerfile_tb is

    COMPONENT registerfile
Port ( 
Write : in std_logic;
DR,SA,SB : in std_logic_vector(4 downto 0);
Clk : in std_logic;
TD, TA, TB : in std_logic;
data : in std_logic_vector(31 downto 0);
Adata : out std_logic_vector(31 downto 0);
Bdata : out std_logic_vector(31 downto 0)
);
    END COMPONENT;
	    
   signal Write : std_logic:= '1';
   signal DR, SA, SB: std_logic_vector(4 downto 0) := (others => '0');
   signal CLK : std_logic:= '0';
   signal TD, TA, TB : std_logic := '0';
   signal data : std_logic_vector(31 downto 0) := (others => '0');
   signal Adata : std_logic_vector(31 downto 0):= (others => '0');
   signal Bdata : std_logic_vector(31 downto 0):= (others => '0');
   constant PERIOD : time := 20ns;
   
  
   
 BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: registerfile PORT MAP (
          Write => Write,
		  DR => DR,
		  SA => SA,
		  SB => SB,
		  Clk =>Clk,
		  TD => TD,
		  TA => TA,
		  TB => TB,
		  data => data,
		  Adata => Adata,
		  Bdata => Bdata
        );
        CLK <= not Clk after PERIOD/2;
   stim_proc: process

      begin
      Write <='1';
      -- Loading the 32 registers with distinct values

      DR <= "00000";
      data <= "00011001001100110110100001010010";
      SA <= "00000";
      SB <= "00000"; 
      TD <= '0';
      TA <= '0';
      TB <= '0'; 
   
      -- Detination Register 0 , load 19336852
      --wait until CLK'event and CLK='1';
      DR <= "00000";
      data <= "00011001001100110110100001010010";
      SA <= "00000";
      SB <= "00000";      
                 
      -- Detination Register 1 , load 19336851
      wait until CLK'event and CLK='1';
      DR <= "00001";
      data <= "00011001001100110110100001010001";
      SA <= "00000";
      SB<= "00000";
       
      -- Detination Register 2 , load 19336850
      wait until CLK'event and CLK='1';
      DR <= "00010";
      data <= "00011001001100110110100001010000";
      SA <= "00000";
      SB<= "00000";
           
      -- Detination Register 3 , load 19336849
      wait until CLK'event and CLK='1';
      DR <= "00011";
      data <= "00011001001100110110100001001001";
      SA <= "00000";
      SB <= "00000";
      -- Detination Register 4, load 19336848
      wait until CLK'event and CLK='1';
      DR <= "00100";
      data <= "00011001001100110110100001001000";
      SA <= "00001";
      SB<= "00010";
          
      -- Detination Register 5, load 19336847
      wait until CLK'event and CLK='1';
      DR <= "00101";
      data <= "00011001001100110110100001000111";
      SA <= "00010";
      SB <= "00011";
      
      -- Detination Register 6
      wait until CLK'event and CLK='1';
      DR <= "00110";
      data <= "00011001001100110110100001000110";
      SA <= "00011";
      SB <= "00100";
	  -- Detination Register 7
	  wait until CLK'event and CLK='1';
      DR <= "00111";
      data <= "00011001001100110110100001000101";
      SA <= "00100";
      SB <= "00101";
	  -- Detination Register 8
	  wait until CLK'event and CLK='1';
      DR <= "01000";
      data <= "00011001001100110110100001000100";
      SA <= "00101";
      SB <= "00110";
	  -- Detination Register 9
	  wait until CLK'event and CLK='1';
      DR <= "01001";
      data <= "00011001001100110110100001000011";
      SA <= "00110";
      SB <= "00111";
	  -- Detination Register 10
	  wait until CLK'event and CLK='1';
      DR<= "01010";
      data <= "00011001001100110110100001000010";
      SA <= "00111";
      SB <= "01000";
	  -- Detination Register 11
	  wait until CLK'event and CLK='1';
      DR <= "01011";
      data <= "00011001001100110110100001000001";
      SA <= "01000";
      SB <= "01001";
	  -- Detination Register 12
	  wait until CLK'event and CLK='1';
      DR <= "01100";
      data <= "00011001001100110110100001000000";
      SA <= "01001";
      SB <= "01010";
	  -- Detination Register 13, load 19336839
	  wait until CLK'event and CLK='1';
      DR <= "01101";
      data <= "00011001001100110110100000111001";
      SA <= "01010";
      SB <= "01011";
	  -- Detination Register 14
	  wait until CLK'event and CLK='1';
      DR <= "01110";
      data <= "00011001001100110110100000111000";
      SA <= "01011";
      SB <= "01100";
-- Detination Register 15
	  wait until CLK'event and CLK='1';
      DR <= "01111";
      data <= "00011001001100110110100000110111";
      SA <= "01100";
      SB <= "01101";
	  -- Detination Register 16
	  wait until CLK'event and CLK='1';
      DR <= "10000";
      data <= "00011001001100110110100000110110";
      SA <= "01101";
      SB <= "01110";
	  -- Detination Register 17
	  wait until CLK'event and CLK='1';
      DR <= "10001";
      data <= "00011001001100110110100000110101";
      SA <= "01110";
      SB <= "01111";
	  -- Detination Register 18
	  wait until CLK'event and CLK='1';
      DR <= "10010";
      data <= "00011001001100110110100000110100";
      SA <= "01111";
      SB <= "10000";
	  -- Detination Register 19
	  wait until CLK'event and CLK='1';
      DR <= "10011";
      data <= "00011001001100110110100000110011";
      SA <= "10000";
      SB <= "10001";
	  -- Detination Register 20
	  wait until CLK'event and CLK='1';
      DR <= "10100";
      data <= "00011001001100110110100000110010";
      SA <= "10001";
      SB <= "10010";
	  -- Detination Register 21
	  wait until CLK'event and CLK='1';
      DR <= "10101";
      data <= "00011001001100110110100000110001";
      SA <= "10010";
      SB <= "10011";
	  -- Detination Register 22, load 19336830
	  wait until CLK'event and CLK='1';
      DR <= "10110";
      data <= "00011001001100110110100000110000";
      SA <= "10011";
      SB <= "10100";
	  -- Detination Register 23, load 19336829
	  wait until CLK'event and CLK='1';
      DR <= "10111";
      data <= "00011001001100110110100000101001";
      SA <= "10100";
      SB <= "10101";
	  -- Detination Register 24
	  wait until CLK'event and CLK='1';
      DR <= "11000";
      data <= "00011001001100110110100000101000";
      SA <= "10101";
      SB <= "10110";
	  -- Detination Register 25
	  wait until CLK'event and CLK='1';
      DR <= "11001";
      data <= "00011001001100110110100000100111";
      SA <= "10110";
      SB <= "10111";
	  -- Detination Register 26
	  wait until CLK'event and CLK='1';
      DR <= "11010";
      data <= "00011001001100110110100000100110";
      SA <= "10111";
      SB <= "11000";
	  -- Detination Register 27
	  wait until CLK'event and CLK='1';
      DR <= "11011";
      data <= "00011001001100110110100000100101";
      SA <= "11000";
      SB <= "11001";
	  -- Detination Register 28
	  wait until CLK'event and CLK='1';
      DR <= "11100";
      data <= "00011001001100110110100000100100";
      SA <= "11001";
      SB <= "11010";
	  -- Detination Register 29
	  wait until CLK'event and CLK='1';
      DR <= "11101";
      data <= "00011001001100110110100000100011";
      SA <= "11010";
      SB <= "11011";
	  -- Detination Register 30
	  wait until CLK'event and CLK='1';
      DR <= "11110";
      data <= "00011001001100110110100000100010";
      SA <= "11011";
      SB <= "11100";
        -- Detination Register 31,19336821
	  wait until CLK'event and CLK='1';
      DR <= "11111";
      data <= "00011001001100110110100000100001";
      SA <= "11100";
      SB <= "11101";
        -- Detination Register 32,19336820
      wait until CLK'event and CLK='1';
      DR <= "00000";
      TD <= '1';
      SA <= "11101";
      SB <= "11110";
      data <= "00011001001100110110100000100000";
      wait until CLK'event and CLK='1';
      TD<='0';
      wait;
      
   end process;
end Behavioral;
