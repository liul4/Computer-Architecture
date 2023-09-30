library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity VCNZ_FlipFlops_tb is
end VCNZ_FlipFlops_tb;
architecture Behavioral of VCNZ_FlipFlops_tb is
COMPONENT VCNZ_FlipFlops
Port (V, C, N, Z, FL, clock : in std_logic;
        Reset : in std_logic_vector(3 downto 0);
        VCNZ : OUT std_logic_vector(3 downto 0));
END COMPONENT;
signal V, C, N, Z, FL, clock : std_logic := '0';
signal Reset : std_logic_vector(3 downto 0) := (others => '0');
signal VCNZ : std_logic_vector(3 downto 0) := (others => '0');
constant PERIOD : time := 20ns;
begin
uut: VCNZ_FlipFlops PORT MAP (
  V=>V,
  C=>C,
  N=>N,
  Z=>Z,
  FL=>FL,
  clock=>clock,
  Reset=>Reset,
  VCNZ=>VCNZ
);
clock <= not clock after PERIOD/2;
stim_proc: process
  begin
  FL<='0';
  N<='1';
  Z<='0';
  V<='1';
  C<='0';
  Reset<="1000";
  wait until clock'event and clock='1';
  FL<='1';
  wait until clock'event and clock='1';
  Reset<="0010";
  wait until clock'event and clock='1';
  FL<='0';
  N<='0';
  Z<='1';
  V<='1';
  C<='1';
  wait until clock'event and clock='1';
  FL<='1';
  Reset<="0100";
  wait until clock'event and clock='1';
  Reset<="0001";
  wait until clock'event and clock='1';
    end process;
end;