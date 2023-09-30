library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ControlMemory is
  Port ( IN_CAR : in std_logic_vector(16 downto 0);
         NA : out std_logic_vector(16 downto 0);
         MS : out std_logic_vector(2 downto 0);
         MC, IL, PI, PL : out std_logic;
         FS : out std_logic_vector(4 downto 0);
         TD, TA, TB, MB, MD, RW, MM, MW, RV, RC, RN, RZ, FL : out std_logic
  );
end ControlMemory;

architecture Behavioral of ControlMemory is
type mem_array is array(0 to 255) of std_logic_vector(41 downto 0); 
signal control_mem : mem_array := (
-- |41 25|2422|21|20|19|18|17|16|15|14|13 9|8|7|6|5|4|3|2|1|0|
-- | Next Address | MS | M| I| P| P| T| T| T| M| FS |M|R|M|M|R|R|R|R|F|
-- | Next Address | MS | C| L| I| L| D| A| B| B| FS |D|W|M|W|V|C|N|Z|L|
-- "00000000000000000 000 0 0 0 0 0 0 0 0 00000 0 0 0 0 0 0 0 0 0"
"000000000000000000000000000000000111000000",-- 00
"000000000000000010000000100000000111000000",-- 01
"000000000000000100000000000000000011000000",-- 02
"000000000000000110000000000000011000000000",-- 03
"000000000000001000000000000001100000000000",-- 04
"000000000000001010000000000000010000000000",-- 05
"000000000000001100000000000001000000000000",-- 06
"000000000000001110000000000010000000000000",-- 07
-- |41 25|2422|21|20|19|18|17|16|15|14|13 9|8|7|6|5|4|3|2|1|0|
-- | Next Address | MS | M| I| P| P| T| T| T| M| FS |M|R|M|M|R|R|R|R|F|
-- | Next Address | MS | C| L| I| L| D| A| B| B| FS |D|W|M|W|V|C|N|Z|L|
-- "00000000000000000 000 0 0 0 0 0 0 0 0 00000 0 0 0 0 0 0 0 0 0"
"000000000000010000000000000000101000000000",-- 08
"000000000000010010000000000010100000000000",-- 09
"000000000000010100000000000000100000000000",-- 0A
"000000000000010110000000000011000000000000",-- 0B
"000000000000011000000000000001010000000000",-- 0C
"000000000000011010000000000000000000000000",-- 0D
"000000000000011100000000000000000000000000",-- 0E
"000000000000011110000000000000000000000000",-- 0F
-- |41 25|2422|21|20|19|18|17|16|15|14|13 9|8|7|6|5|4|3|2|1|0|
-- | Next Address | MS | M| I| P| P| T| T| T| M| FS |M|R|M|M|R|R|R|R|F|
-- | Next Address | MS | C| L| I| L| D| A| B| B| FS |D|W|M|W|V|C|N|Z|L|
-- "00000000000000000 000 0 0 0 0 0 0 0 0 00000 0 0 0 0 0 0 0 0 0"
"000000000000100000000000000000000000000000",-- 10
"000000000000100010000000000000000000000000",-- 11
"000000000000100100000000000000000000000000",-- 12
"000000000000100110000000000000000000000000",-- 13
"000000000000101000000000000000000000000000",-- 14
"000000000000101010000000000000000000000000",-- 15
"000000000000101100000000000000000000000000",-- 16
"000000000000101110000000000000000000000000",-- 17

"000000000000110000000000000000000000000000",-- 18
"000000000000110010000000000000000000000000",-- 19
"000000000000110100000000000000000000000000",-- 1A
"000000000000110110000000000000000000000000",-- 1B
"000000000000111000000000000000000000000000",-- 1C
"000000000000111010000000000000000000000000",-- 1D
"000000000000111100000000000000000000000000",-- 1E
"000000000000111110000000000000000000000000",-- 1F
"000000000001000000000000000000000000000000",-- 20
"000000000001000010000000000000000000000000",-- 21
"000000000001000100000000000000000000000000",-- 22
"000000000001000110000000000000000000000000",-- 23
"000000000001001000000000000000000000000000",-- 24
"000000000001001010000000000000000000000000",-- 25
"000000000001001100000000000000000000000000",-- 26
"000000000001001110000000000000000000000000",-- 27
"000000000001010000000000000000000000000000",-- 28
"000000000001010010000000000000000000000000",-- 29
"000000000001010100000000000000000000000000",-- 2A
"000000000001010110000000000000000000000000",-- 2B
"000000000001011000000000000000000000000000",-- 2C
"000000000001011010000000000000000000000000",-- 2D
"000000000001011100000000000000000000000000",-- 2E
"000000000001011110000000000000000000000000",-- 2F

"000000000001100000000000000000000000000000",-- 30
"000000000001100010000000000000000000000000",-- 31
"000000000001100100000000000000000000000000",-- 32
"000000000001100110000000000000000000000000",-- 33
"000000000001101000000000000000000000000000",-- 34
"000000000001101010000000000000000000000000",-- 35
"000000000001101100000000000000000000000000",-- 36
"000000000001101110000000000000000000000000",-- 37

"000000000001110000000000000000000000000000",-- 38
"000000000001110010000000000000000000000000",-- 39
"000000000001110100000000000000000000000000",-- 3A
"000000000001110110000000000000000000000000",-- 3B
"000000000001111000000000000000000000000000",-- 3C
"000000000001111010000000000000000000000000",-- 3D
"000000000001111100000000000000000000000000",-- 3E
"000000000001111110000000000000000000000000",-- 3F

"000000000010000000000000000000000000000000",-- 40
"000000000010000010000000000000000000000000",-- 41
"000000000010000100000000000000000000000000",-- 42
"000000000010000110000000000000000000000000",-- 43
"000000000010001000000000000000000000000000",-- 44
"000000000010001010000000000000000000000000",-- 45
"000000000010001100000000000000000000000000",-- 46
"000000000010001110000000000000000000000000",-- 47

"000000000010010000000000000000000000000000",-- 48
"000000000010010010000000000000000000000000",-- 49
"000000000010010100000000000000000000000000",-- 4A
"000000000010010110000000000000000000000000",-- 4B
"000000000010011000000000000000000000000000",-- 4C
"000000000010011010000000000000000000000000",-- 4D
"000000000010011100000000000000000000000000",-- 4E
"000000000010011110000000000000000000000000",-- 4F

"000000000010100000000000000000000000000000",-- 50
"000000000010100010000000000000000000000000",-- 51
"000000000010100100000000000000000111000000",-- 52
"000000000010100110000000000000000111000000",-- 53
"000000000010101000000000000000000011000000",-- 54
"000000000010101010000000000000011000000000",-- 55
"000000000010101100000000000001010000000000",-- 56
"000000000010101110000010000110000100001100",-- 57

"000000000010110000001100101000011000101000",-- 58
"000000000010110010000000000000000000000000",-- 59
"000000000010110100000000000000000000000000",-- 5A
"000000000010110110000000000000000000000000",-- 5B
"000000000010111000000000000000000000000000",-- 5C
"000000000010111010000000000000000000000000",-- 5D
"000000000010111100000000000000000000000000",-- 5E
"000000000010111110000000000000000000000000",-- 5F

"000000000011000000000000000000000000000000",-- 60
"000000000011000010000000000000000000000000",-- 61
"000000000011000100000000000000000000000000",-- 62
"000000000011000110000000000000000000000000",-- 63
"000000000011001000000000000000000000000000",-- 64
"000000000011001010000000000000000000000000",-- 65
"000000000011001100000000000000000000000000",-- 66
"000000000011001110000000000000000000000000",-- 67
"000000000011010000000000000000000000000000",-- 68
"000000000011010010000000000000000000000000",-- 69
"000000000011010100000000000000000000000000",-- 6A
"000000000011010110000000000000000000000000",-- 6B
"000000000011011000000000000000000000000000",-- 6C
"000000000011011010000000000000000000000000",-- 6D
"000000000011011100000000000000000000000000",-- 6E
"000000000011011110000000000000000000000000",-- 6F

"000000000011100000000000000000000000000000",-- 70
"000000000011100010000000000000000000000000",-- 71
"000000000011100100000000000000000000000000",-- 72
"000000000011100110000000000000000000000000",-- 73
"000000000011101000000000000000000000000000",-- 74
"000000000011101010000000000000000000000000",-- 75
"000000000011101100000000000000000000000000",-- 76
"000000000011101110000000000000000000000000",-- 77

"000000000011110000000000000000000000000000",-- 78
"000000000011110010000000000000000000000000",-- 79
"000000000011110100000000000000000000000000",-- 7A
"000000000011110110000000000000000000000000",-- 7B
"000000000011111000000000000000000000000000",-- 7C
"000000000011111010000000000000000000000000",-- 7D
"000000000011111100000000000000000000000000",-- 7E
"000000000011111110000000000000000000000000",-- 7F

"000000000100000000000000000000000000000000",-- 80
"000000000100000010000000000000000000000000",-- 81
"000000000100000100000000000000000000000000",-- 82
"000000000100000110000000000000000000000000",-- 83
"000000000100001000000000000000000000000000",-- 84
"000000000100001010000000000000000000000000",-- 85
"000000000100001100000000000000000000000000",-- 86
"000000000100001110000000000000000000000000",-- 87

"000000000100010000000000000000000000000000",-- 88
"000000000100010010000000000000000000000000",-- 89
"000000000100010100000000000000000000000000",-- 8A
"000000000100010110000000000000000000000000",-- 8B
"000000000100011000000000000000000000000000",-- 8C
"000000000100011010000000000000000000000000",-- 8D
"000000000100011100000000000000000000000000",-- 8E
"000000000100011110000000000000000000000000",-- 8F

"000000000100100000000000000000000000000000",-- 90
"000000000100100010000000000000000000000000",-- 91
"000000000100100100000000000000000000000000",-- 92
"000000000100100110000000000000000000000000",-- 93
"000000000100101000000000000000000000000000",-- 94
"000000000100101010000000000000000000000000",-- 95
"000000000100101100000000000000000000000000",-- 96
"000000000100101110000000000000000000000000",-- 97

"000000000100110000000000000000000000000000",-- 98
"000000000100110010000000000000000000000000",-- 99
"000000000100110100000000000000000000000000",-- 9A
"000000000100110110000000000000000000000000",-- 9B
"000000000100111000000000000000000000000000",-- 9C
"000000000100111010000000000000000000000000",-- 9D
"000000000100111100000000000000000000000000",-- 9E
"000000000100111110000000000000000000000000",-- 9F

"000000000101000000000000000000000000000000",-- A0
"000000000101000010000000000000000000000000",-- A1
"000000000101000100000000000000000000000000",-- A2
"000000000101000110000000000000000000000000",-- A3
"000000000101001000000000000000000000000000",-- A4
"000000000101001010000000000000000000000000",-- A5
"000000000101001100000000000000000000000000",-- A6
"000000000101001110000000000000000000000000",-- A7
"000000000101010000000000000000000000000000",-- A8
"000000000101010010000000000000000000000000",-- A9
"000000000101010100000000000000000000000000",-- AA
"000000000101010110000000000000000000000000",-- AB
"000000000101011000000000000000000000000000",-- AC
"000000000101011010000000000000000000000000",-- AD
"000000000101011100000000000000000000000000",-- AE
"000000000101011110000000000000000000000000",-- AF

"000000000101100000000000000000000000000000",-- B0
"000000000101100010000000000000000000000000",-- B1
"000000000101100100000000000000000000000000",-- B2
"000000000101100110000000000000000000000000",-- B3
"000000000101101000000000000000000000000000",-- B4
"000000000101101010000000000000000000000000",-- B5
"000000000101101100000000000000000000000000",-- B6
"000000000101101110000000000000000000000000",-- B7
"000000000101110000000000000000000000000000",-- B8
"000000000101110010000000000000000000000000",-- B9
"000000000101110100000000000000000000000000",-- BA
"000000000101110110000000000000000000000000",-- BB
"000000000101111000000000000000000000000000",-- BC
"000000000101111010000000000000000000000000",-- BD
"000000000101111100000000000000000000000000",-- BE
"000000000101111110000000000000000000000000",-- BF

"000000000110000000000000000000000000000000",-- C0
"000000000110000010000000000000000000000000",-- C1
"000000000110000100000000000000000000000000",-- C2
"000000000110000110000000000000000000000000",-- C3
"000000000110001000000000000000000000000000",-- C4
"000000000110001010000000000000000000000000",-- C5
"000000000110001100000000000000000000000000",-- C6
"000000000110001110000000000000000000000000",-- C7
"000000000110010000000000000000000000000000",-- C8
"000000000110010010000000000000000000000000",-- C9
"000000000110010100000000000000000000000000",-- CA
"000000000110010110000000000000000000000000",-- CB
"000000000110011000000000000000000000000000",-- CC
"000000000110011010000000000000000000000000",-- CD
"000000000110011100000000000000000000000000",-- CE
"000000000110011110000000000000000000000000",-- CF

"000000000110100000000000000000000000000000",-- D0
"000000000110100010000000000000000000000000",-- D1
"000000000110100100000000000000000000000000",-- D2
"000000000110100110000000000000000000000000",-- D3
"000000000110101000000000000000000000000000",-- D4
"000000000110101010000000000000000000000000",-- D5
"000000000110101100000000000000000000000000",-- D6
"000000000110101110000000000000000000000000",-- D7
"000000000110110000000000000000000000000000",-- D8
"000000000110110010000000000000000000000000",-- D9
"000000000110110100000000000000000000000000",-- DA
"000000000110110110000000000000000000000000",-- DB
"000000000110111000000000000000000000000000",-- DC
"000000000110111010000000000000000000000000",-- DD
"000000000110111100000000000000000000000000",-- DE
"000000000110111110000000000000000000000000",-- DF

"000000000111000000000000000000000000000000",-- E0
"000000000111000010000000000000000000000000",-- E1
"000000000111000100000000000000000000000000",-- E2
"000000000111000110000000000000000000000000",-- E3
"000000000111001000000000000000000000000000",-- E4
"000000000111001010000000000000000000000000",-- E5
"000000000111001100000000000000000000000000",-- E6
"000000000111001110000000000000000000000000",-- E7
"000000000111010000000000000000000000000000",-- E8
"000000000111010010000000000000000000000000",-- E9
"000000000111010100000000000000000000000000",-- EA
"000000000111010110000000000000000000000000",-- EB
"000000000111011000000000000000000000000000",-- EC
"000000000111011010000000000000000000000000",-- ED
"000000000111011100000000000000000000000000",-- EE
"000000000111011110000000000000000000000000",-- EF

"000000000111100000000000000000000000000000",-- F0
"000000000111100010000000000000000000000000",-- F1
"000000000111100100000000000000000000000000",-- F2
"000000000111100110000000000000000000000000",-- F3
"000000000111101000000000000000000000000000",-- F4
"000000000111101010000000000000000000000000",-- F5
"000000000111101100000000000000000000000000",-- F6
"000000000111101110000000000000000000000000",-- F7

"000000000111110000000000000000000000000000",-- F8
"000000000111110010000000000000000000000000",-- F9
"000000000111110100000000000000000000000000",-- FA
"000000000111110110000000000000000000000000",-- FB
"000000000111111000000000000000000000000000",-- FC
"000000000111111010000000000000000000000000",-- FD
"000000000111111100000000000000000000000000",-- FE
"000000000111111110000000000000000000000000" -- FF
);
signal content_at_address : std_logic_vector(41 downto 0); 
begin
content_at_address <= control_mem(to_integer(unsigned(IN_CAR(8 downto 0)))) after 2ns;
FL <= content_at_address(0); -- 0
RZ <= content_at_address(1); -- 1
RN <= content_at_address(2); -- 2
RC <= content_at_address(3); -- 3
RV <= content_at_address(4); -- 4
MW <= content_at_address(5); -- 5
MM <= content_at_address(6); -- 6
RW <= content_at_address(7); -- 7
MD <= content_at_address(8); -- 8
FS <= content_at_address(13 downto 9); -- 9 to 13
MB <= content_at_address(14); -- 14
TB <= content_at_address(15); -- 15
TA <= content_at_address(16); -- 16
TD <= content_at_address(17); -- 17
PL <= content_at_address(18); -- 18
PI <= content_at_address(19); -- 19
IL <= content_at_address(20); -- 20
MC <= content_at_address(21); -- 21
MS <= content_at_address(24 downto 22); -- 22 to 24
NA <= content_at_address(41 downto 25); -- 25 to 41
end Behavioral;

