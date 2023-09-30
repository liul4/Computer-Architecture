library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Microprocessor32Bit_tb is
--  Port ( );
end Microprocessor32Bit_tb;

architecture Behavioral of Microprocessor32Bit_tb is
COMPONENT Microprocessor32Bit
Port ( Clk : in std_logic
);
    END COMPONENT;
    signal Clk : std_logic:= '0';
    constant PERIOD : time := 20ns;
begin
uut: Microprocessor32Bit PORT MAP (
		  Clk =>Clk
        );
        Clk <= not Clk after PERIOD/2;

 stim_proc: process
 begin
wait until CLK'event and CLK='1';
wait until CLK'event and CLK='1';
wait until CLK'event and CLK='1';
wait until CLK'event and CLK='1';
wait until CLK'event and CLK='1';
wait until CLK'event and CLK='1';
wait until CLK'event and CLK='1';
wait until CLK'event and CLK='1';
wait until CLK'event and CLK='1';
wait until CLK'event and CLK='1';
      
   end process;
end Behavioral;
