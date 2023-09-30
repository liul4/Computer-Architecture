----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.01.2022 00:22:40
-- Design Name: 
-- Module Name: Datapath - Behavioral
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

entity Datapath is
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
end Datapath;

architecture Behavioral of Datapath is
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
COMPONENT Function_Unit
Port (
    A : in STD_LOGIC_VECTOR (31 downto 0);
    B : in STD_LOGIC_VECTOR (31 downto 0);
    Gsel : in STD_LOGIC_VECTOR (3 downto 0);
    Hsel : in STD_LOGIC_VECTOR (1 downto 0);
    MFsel : in STD_LOGIC;
    F : out STD_LOGIC_VECTOR (31 downto 0);
    C,V,Z,N:out STD_LOGIC
 );
END COMPONENT;
COMPONENT Mux2_32bit
Port ( A : in STD_LOGIC;
           In0 : in STD_LOGIC_VECTOR (31 downto 0);
           In1 : in STD_LOGIC_VECTOR (31 downto 0);
           Z : out STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;
signal a,b,busA, busB, Bsignal, Fsignal, d : STD_LOGIC_VECTOR (31 downto 0 );
begin
RF0: registerfile port map (Write,DR,SA,SB,Clk,TD,TA,TB,d,a,b);
MuxB: Mux2_32bit port map (MB,b,constantIn,Bsignal);
busA<=a;
busB<=Bsignal;
Aout<=a;
Bout<=Bsignal;
FU0: Function_Unit port map (busA,busB,FS(3 downto 0),FS(3 downto 2),FS(4),Fsignal,C,V,Z,N);
MuxD: Mux2_32bit port map (MD,Fsignal,data,d);
end Behavioral;
