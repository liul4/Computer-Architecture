----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.01.2022 00:22:53
-- Design Name: 
-- Module Name: Datapath_tb - Behavioral
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

entity Datapath_tb is
--  Port ( );
end Datapath_tb;

architecture Behavioral of Datapath_tb is

COMPONENT Datapath
Port ( 
    Write : in std_logic;
    DR,SA,SB : in std_logic_vector(4 downto 0);
    TD,TA,TB: in STD_LOGIC;
    FS : in STD_LOGIC_VECTOR (4 downto 0);
    data : in std_logic_vector(31 downto 0);
    constantIn : in std_logic_vector(31 downto 0);
    MB,MD : in STD_LOGIC;
    Clk : in std_logic;
    Aout,Bout : out std_logic_vector(31 downto 0);
    C,V,Z,N:out STD_LOGIC
);
    END COMPONENT;
    signal Write : std_logic:= '0';
    signal DR,SA,SB : std_logic_vector(4 downto 0) := (others => '0');
    signal TD,TA,TB : std_logic:= '0';
    signal FS : STD_LOGIC_VECTOR (4 downto 0) := (others => '0');
    signal data : std_logic_vector(31 downto 0) := (others => '0');
    signal constantIn : std_logic_vector(31 downto 0) := (others => '0');
    signal MB,MD : STD_LOGIC:= '0';
    signal Clk : std_logic:= '0';
    signal Aout,Bout : std_logic_vector(31 downto 0) := (others => '0');
    signal C,V,Z,N: STD_LOGIC:= '0';
    
    constant PERIOD : time := 20ns;
begin
uut: Datapath PORT MAP (
          Write => Write,
		  DR=>DR,
		  SA=>SA,
		  SB=>SB,
		  TD=>TD,
		  TA=>TA,
		  TB=>TB,
		  FS => FS,
		  data => data,
		  constantIn => constantIn,
		  MB => MB,
		  MD => MD,
		  Clk =>Clk,
		  Aout => Aout,
		  Bout => Bout,
          C => C,
          V => V,
          Z => Z,
          N => N
        );
        Clk <= not Clk after PERIOD/2;

 stim_proc: process
   begin
   -- load register content
   MD <= '1';
   Write <='1';
   TD <= '0';
      TA <= '0';
      TB <= '0';
   -- Detination Register 0 , load 19336852
      --wait until CLK'event and CLK='1';
      DR <= "00000";
      data <= "00011001001100110110100001010010";
      -- Detination Register 1 , load 19336851
      wait until CLK'event and CLK='1';
      DR <= "00001";
      data <= "00011001001100110110100001010001";
       
      -- Detination Register 2 , load 19336850
      wait until CLK'event and CLK='1';
      DR <= "00010";
      data <= "00011001001100110110100001010000";
           
      -- Detination Register 3 , load 19336849
      wait until CLK'event and CLK='1';
      DR <= "00011";
      data <= "00011001001100110110100001001001";
      -- Detination Register 4, load 19336848
      wait until CLK'event and CLK='1';
      DR <= "00100";
      data <= "00011001001100110110100001001000";
          
      -- Detination Register 5, load 19336847
      wait until CLK'event and CLK='1';
      DR <= "00101";
      data <= "00011001001100110110100001000111";
      
      -- Detination Register 6
      wait until CLK'event and CLK='1';
      DR <= "00110";
      data <= "00011001001100110110100001000110";
	  -- Detination Register 7
	  wait until CLK'event and CLK='1';
      DR <= "00111";
      data <= "00011001001100110110100001000101";
	  -- Detination Register 8
	  wait until CLK'event and CLK='1';
      DR <= "01000";
      data <= "00011001001100110110100001000100";
	  -- Detination Register 9
	  wait until CLK'event and CLK='1';
      DR <= "01001";
      data <= "00011001001100110110100001000011";
	  -- Detination Register 10
	  wait until CLK'event and CLK='1';
      DR<= "01010";
      data <= "00011001001100110110100001000010";
	  -- Detination Register 11
	  wait until CLK'event and CLK='1';
      DR <= "01011";
      data <= "00011001001100110110100001000001";
	  -- Detination Register 12
	  wait until CLK'event and CLK='1';
      DR <= "01100";
      data <= "00011001001100110110100001000000";
	  -- Detination Register 13, load 19336839
	  wait until CLK'event and CLK='1';
      DR <= "01101";
      data <= "00011001001100110110100000111001";
	  -- Detination Register 14
	  wait until CLK'event and CLK='1';
      DR <= "01110";
      data <= "00011001001100110110100000111000";
-- Detination Register 15
	  wait until CLK'event and CLK='1';
      DR <= "01111";
      data <= "00011001001100110110100000110111";
	  -- Detination Register 16
	  wait until CLK'event and CLK='1';
      DR <= "10000";
      data <= "00011001001100110110100000110110";
	  -- Detination Register 17
	  wait until CLK'event and CLK='1';
      DR <= "10001";
      data <= "00011001001100110110100000110101";
	  -- Detination Register 18
	  wait until CLK'event and CLK='1';
      DR <= "10010";
      data <= "00011001001100110110100000110100";
	  -- Detination Register 19
	  wait until CLK'event and CLK='1';
      DR <= "10011";
      data <= "00011001001100110110100000110011";
	  -- Detination Register 20
	  wait until CLK'event and CLK='1';
      DR <= "10100";
      data <= "00011001001100110110100000110010";
	  -- Detination Register 21
	  wait until CLK'event and CLK='1';
      DR <= "10101";
      data <= "00011001001100110110100000110001";
	  -- Detination Register 22, load 19336830
	  wait until CLK'event and CLK='1';
      DR <= "10110";
      data <= "00011001001100110110100000110000";
	  -- Detination Register 23, load 19336829
	  wait until CLK'event and CLK='1';
      DR <= "10111";
      data <= "00011001001100110110100000101001";
	  -- Detination Register 24
	  wait until CLK'event and CLK='1';
      DR <= "11000";
      data <= "00011001001100110110100000101000";
	  -- Detination Register 25
	  wait until CLK'event and CLK='1';
      DR <= "11001";
      data <= "00011001001100110110100000100111";
	  -- Detination Register 26
	  wait until CLK'event and CLK='1';
      DR <= "11010";
      data <= "00011001001100110110100000100110";
	  -- Detination Register 27
	  wait until CLK'event and CLK='1';
      DR <= "11011";
      data <= "00011001001100110110100000100101";
	  -- Detination Register 28
	  wait until CLK'event and CLK='1';
      DR <= "11100";
      data <= "00011001001100110110100000100100";
	  -- Detination Register 29
	  wait until CLK'event and CLK='1';
      DR <= "11101";
      data <= "00011001001100110110100000100011";
	  -- Detination Register 30
	  wait until CLK'event and CLK='1';
      DR <= "11110";
      data <= "00011001001100110110100000100010";
        -- Detination Register 31,19336821
	  wait until CLK'event and CLK='1';
      DR <= "11111";
      data <= "00011001001100110110100000100001";
        -- Detination Register 32,19336820
      wait until CLK'event and CLK='1';
      DR <= "11111";
      TD <= '1';
      data <= "00011001001100110110100000100000";
      wait until CLK'event and CLK='1'; 
      Write <='0';
      TD <= '0';
      --use the last digit ofstudent number to select the D address
      DR<="00010";
      --select A and B address
      SA <= "00101";
      SB <= "10001";

      wait until CLK'event and CLK='1'; 
      -- F=A+B+1
      FS <= "00011";
      wait until CLK'event and CLK='1';
      --F=A XOR B
      FS <= "01100";
      wait until CLK'event and CLK='1';
      FS <= "00010";
      wait until CLK'event and CLK='1'; 
      FS <= "01000";
      
      wait until CLK'event and CLK='1';
      -- f = b
      FS <= "10000";
      
      wait until CLK'event and CLK='1';
      --F=A+1's c B+1 F
      FS <= "00101";
      
      wait until CLK'event and CLK='1';
      --f =srB
      FS <= "10100";
      
      wait until CLK'event and CLK='1';
      -- f =A+1's c B
      FS <= "00100";
      
      wait until CLK'event and CLK='1';
      --f=slB
      FS <= "11000";
      
      wait until CLK'event and CLK='1';
      --F=A OR B
      FS <= "01010";
      
      
      MB <= '1'; 
      --constant in "19336852"
      constantIn <= "00011001001100110110100001010010";
      wait until CLK'event and CLK='1'; 
      -- F=A+B+1
      FS <= "00011";
      wait until CLK'event and CLK='1';
      --F=A XOR B
      FS <= "01100";
      wait until CLK'event and CLK='1';
      FS <= "00010";
      wait until CLK'event and CLK='1'; 
      FS <= "01000";
      
      wait until CLK'event and CLK='1';
      -- f = b
      FS <= "10000";
      
      wait until CLK'event and CLK='1';
      --F=A+1's c B+1 F
      FS <= "00101";
      
      wait until CLK'event and CLK='1';
      --f =srB
      FS <= "10100";
      
      wait until CLK'event and CLK='1';
      -- f =A+1's c B
      FS <= "00100";
      
      wait until CLK'event and CLK='1';
      --f=slB
      FS <= "11000";
      
      wait until CLK'event and CLK='1';
      --F=A OR B
      FS <= "01010";
      
   wait;
      
   end process;
end Behavioral;
