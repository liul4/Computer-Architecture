----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.12.2021 03:17:09
-- Design Name: 
-- Module Name: ControlMemory_tb - Behavioral
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

entity ControlMemory_tb is
--  Port ( );
end ControlMemory_tb;

architecture Behavioral of ControlMemory_tb is
COMPONENT ControlMemory
Port (   IN_CAR : in std_logic_vector(16 downto 0);
         NA : out std_logic_vector(16 downto 0);
         MS : out std_logic_vector(2 downto 0);
         MC, IL, PI, PL : out std_logic;
         FS : out std_logic_vector(4 downto 0);
         TD, TA, TB, MB, MD, RW, MM, MW, RV, RC, RN, RZ, FL : out std_logic);
END COMPONENT;
signal IN_CAR : std_logic_vector(16 downto 0) := (others => '0');
signal NA : std_logic_vector(16 downto 0) := (others => '0');
signal MS : std_logic_vector(2 downto 0) := (others => '0');
signal MC, IL, PI, PL : std_logic := '0';
signal FS : std_logic_vector(4 downto 0) := (others => '0');
signal TD, TA, TB, MB, MD, RW, MM, MW, RV, RC, RN, RZ, FL : std_logic := '0';
begin
uut: ControlMemory PORT MAP (
  IN_CAR=>IN_CAR,
  NA=>NA,
  MS=>MS,
  MC=>MC,
  IL=>IL,
  PI=>PI,
  PL=>PL,
  FS=>FS,
  TD=>TD,
  TA=>TA,
  TB=>TB,
  MB=>MB,
  MD=>MD,
  RW=>RW,
  MM=>MM,
  MW=>MW,
  RV=>RV,
  RC=>RC,
  RN=>RN,
  RZ=>RZ,
  FL=>FL
);
stim_proc: process
  begin
  IN_CAR<="00000000001010010"; --52
  wait for 2ns;
  IN_CAR<="00000000001010011";--53
  wait for 2ns;
  IN_CAR<="00000000001010100";--54
  wait for 2ns;
  IN_CAR<="00000000001010101";--55
  wait for 2ns;
  IN_CAR<="00000000001010110";--56
  wait for 2ns;
  IN_CAR<="00000000001010111";--57
  wait for 2ns;
  IN_CAR<="00000000001011000";--58
  wait for 2ns;
  IN_CAR<="00000000001010101";--59
  wait for 2ns;
  IN_CAR<="00000000001100000";--60
  wait for 2ns;
  IN_CAR<="00000000001100001";--61
  wait for 2ns;
  IN_CAR<="00000000001100010";--62
  wait for 2ns;
  IN_CAR<="00000000001100011";--63
  wait for 2ns;
  IN_CAR<="00000000001100100";--64
  wait for 2ns;
  IN_CAR<="00000000001100101";--65
  wait for 2ns;
  IN_CAR<="00000000001100110";--66
  wait for 2ns;
  IN_CAR<="00000000001100111";--67
  wait for 2ns;
  IN_CAR<="00000000001101000";--68
  wait for 2ns;
  IN_CAR<="00000000001101001";--69
  wait for 2ns;
  IN_CAR<="00000000001110000";--70
  wait for 2ns;
  IN_CAR<="00000000001110001";--71
  wait for 2ns;
  IN_CAR<="00000000001110010";--72
  wait for 2ns;
  IN_CAR<="00000000001110011";--73
  wait for 2ns;
  IN_CAR<="00000000001110100";--74
  wait for 2ns;
  IN_CAR<="00000000001110101";--75
  wait for 2ns;
  IN_CAR<="00000000001110110";--76
  wait for 2ns;
  IN_CAR<="00000000001110111";--77
  wait for 2ns;
  IN_CAR<="00000000001111000";--78
  wait for 2ns;
  IN_CAR<="00000000001111001";--79
  wait for 2ns;
  IN_CAR<="00000000010000000";--80
  wait for 2ns;
  IN_CAR<="00000000010000001";--81
  wait for 2ns;
  IN_CAR<="00000000010000010";--82
  wait for 2ns;
  IN_CAR<="00000000010000011";--83
  wait for 2ns;
  IN_CAR<="00000000010000100";--84
  wait for 2ns;
  IN_CAR<="00000000010000101";--85
  wait for 2ns;
  IN_CAR<="00000000010000110";--86
  wait for 2ns;
  IN_CAR<="00000000010000111";--87
  wait for 2ns;
  IN_CAR<="00000000010001000";--88
  wait for 2ns;
  IN_CAR<="00000000010001001";--89
  wait for 2ns;
  IN_CAR<="00000000010010000";--90
  wait for 2ns;
  IN_CAR<="00000000010010001";--91
  wait for 2ns;
  IN_CAR<="00000000010010010";--92
  wait for 2ns;
  IN_CAR<="00000000010010011";--93
  wait for 2ns;
  IN_CAR<="00000000010010100";--94
  wait for 2ns;
  IN_CAR<="00000000010010101";--95
  wait for 2ns;
  IN_CAR<="00000000010010110";--96
  wait for 2ns;
  IN_CAR<="00000000010010111";--97
  wait for 2ns;
  IN_CAR<="00000000010011000";--98
  wait for 2ns;
  IN_CAR<="00000000010011001";--99
  wait for 2ns;
  IN_CAR<="00000000100000000";--100
  wait for 2ns;
  IN_CAR<="00000000100000001";--101
  wait for 2ns;
  IN_CAR<="00000000100000010";--102
  wait for 2ns;
  IN_CAR<="00000000100000011";--103
  wait for 2ns;
  IN_CAR<="00000000100000100";--104
  wait for 2ns;
  IN_CAR<="00000000100000101";--105
  wait for 2ns;
  IN_CAR<="00000000100000110";--106
  wait for 2ns;
  IN_CAR<="00000000100000111";--107
  wait for 2ns;
  IN_CAR<="00000000100001000";--108
  wait for 2ns;
  IN_CAR<="00000000100001001";--109
  wait for 2ns;
  IN_CAR<="00000000100010000";--110
  wait for 2ns;
  IN_CAR<="00000000100010001";--111
  wait for 2ns;
  IN_CAR<="00000000100010010";--112
  wait for 2ns;
  IN_CAR<="00000000100010011";--113
  wait for 2ns;
  IN_CAR<="00000000100010100";--114
  wait for 2ns;
  IN_CAR<="00000000100010101";--115
  wait for 2ns;
  IN_CAR<="00000000100010110";--116
  wait for 2ns;
  IN_CAR<="00000000100010111";--117
  wait for 2ns;
  IN_CAR<="00000000100011000";--118
  wait for 2ns;
  IN_CAR<="00000000100011001";--119
  wait for 2ns;
  IN_CAR<="00000000100100000";--120
  wait for 2ns;
  IN_CAR<="00000000100100001";--121
  wait for 2ns;
  IN_CAR<="00000000100100010";--122
  wait for 2ns;
  IN_CAR<="00000000100100011";--123
  wait for 2ns;
  IN_CAR<="00000000100100100";--124
  wait for 2ns;
  IN_CAR<="00000000100100101";--125
  wait for 2ns;
  IN_CAR<="00000000100100110";--126
  wait for 2ns;
  IN_CAR<="00000000100100111";--127
  wait for 2ns;
  IN_CAR<="00000000100101000";--128
  wait for 2ns;
  IN_CAR<="00000000100101001";--129
  wait for 2ns;
  end process;

END;
