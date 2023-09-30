library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX2to1_17bit19336852_tb is
end MUX2to1_17bit19336852_tb;

architecture Behavioral of MUX2to1_17bit19336852_tb is

-- Component Declaration for the Unit Under Test (UUT)

component MUX2to1_17bit19336852
port ( 
    A : in STD_LOGIC;
    In0 : in STD_LOGIC_VECTOR (16 downto 0);
    In1 : in STD_LOGIC_VECTOR (16 downto 0);
    Z : out STD_LOGIC_VECTOR (16 downto 0)
      );
end component;

--Inputs

    signal A : STD_LOGIC := '0';
    signal In0 : STD_LOGIC_VECTOR (16 downto 0) := (others => '0');
    signal In1 : STD_LOGIC_VECTOR (16 downto 0) := (others => '0');
    
--Outputs

    signal Z : STD_LOGIC_VECTOR (16 downto 0) := (others => '0');


begin

	-- Instantiate the Unit Under Test (UUT)
	
   uut: MUX2to1_17bit19336852 PORT MAP (
           A => A,
           In0 => In0, 
           In1 => In1, 
           Z => Z  
        );

 In0 <= "00000001100000000";
 In1 <= "00000011000000000";
            
stim_proc: process
   begin
   
       wait for 10 ns;
       -- From outsite 		
       A <= '0';

      wait for 10 ns;
       -- From Mux8_16bit	
       A <= '1';

     --wait;
 
   end process;
   

end Behavioral;

