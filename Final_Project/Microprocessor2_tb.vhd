library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Microprocessor2_tb is
end Microprocessor2_tb;

architecture Behavioral of Microprocessor2_tb is
COMPONENT Microprocessor2
Port ( Clk : in std_logic;
       IN_CAR: in std_logic_vector(16 downto 0);
       DR,SA,SB : in std_logic_vector(4 downto 0);
       constantIn,InstructionAddress: in std_logic_vector(31 downto 0);
       V,C,N,Z,PI,PL,IL,MC: out std_logic;
       MS: out std_logic_vector(2 downto 0);
       NA: out std_logic_vector(16 downto 0);
       Data_out: out std_logic_vector(31 downto 0)
);
END COMPONENT;
    signal Clk : std_logic:= '0';
    signal DR,SA,SB : std_logic_vector(4 downto 0) := (others => '0');
    signal IN_CAR : std_logic_vector(16 downto 0) := (others => '0');
    signal constantIn,InstructionAddress : std_logic_vector(31 downto 0) := (others => '0');
    signal V,C,N,Z,PI,PL,IL,MC : STD_LOGIC:= '0';
    signal MS : std_logic_vector(2 downto 0) := (others => '0');
    signal NA : std_logic_vector(16 downto 0) := (others => '0');
    signal Data_out : std_logic_vector(31 downto 0) := (others => '0');
    
    constant PERIOD : time := 20ns;
begin
uut: Microprocessor2 PORT MAP (
          IN_CAR=>IN_CAR,
		  DR=>DR,
		  SA=>SA,
		  SB=>SB,
		  constantIn => constantIn,
		  InstructionAddress=>InstructionAddress,
		  Clk =>Clk,
          C => C,
          V => V,
          Z => Z,
          N => N,
          PI=>PI,
          PL=>PL,
          IL=>IL,
          MC=>MC,
          MS=>MS,
          NA=>NA,
          Data_out=>Data_out
        );
        Clk <= not Clk after PERIOD/2;

 stim_proc: process
begin
InstructionAddress<=X"00000052";
DR <= "00000";
IN_CAR <= "00000000000000000";
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
      IN_CAR <= "00000000000000001";
      DR <= "11111";
      InstructionAddress<=X"00000072";
      wait until CLK'event and CLK='1';
      IN_CAR <= "00000000000000010";
      DR <= "00010";
      SA <= "00101";
      SB <= "10001";
      IN_CAR <= "00000000000000011";
      wait until CLK'event and CLK='1';
      IN_CAR <= "00000000000000100";
      wait until CLK'event and CLK='1';
      IN_CAR <= "00000000000000101";
      wait until CLK'event and CLK='1';
      IN_CAR <= "00000000000000110";
      wait until CLK'event and CLK='1';
      IN_CAR <= "00000000000000111";
      wait until CLK'event and CLK='1';
      IN_CAR <= "00000000000001000";
      wait until CLK'event and CLK='1';
      IN_CAR <= "00000000000001001";
      wait until CLK'event and CLK='1';
      IN_CAR <= "00000000000001010";
      wait until CLK'event and CLK='1';
      IN_CAR <= "00000000000001011";
      wait until CLK'event and CLK='1';
      IN_CAR <= "00000000000001100";
      wait until CLK'event and CLK='1';
      
end process;
end Behavioral;
