library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Microprocessor1 is
Port ( Clk,RW,TD,TA,TB,MB,MM,MW,MD : in std_logic;
       DR,SA,SB,FS : in std_logic_vector(4 downto 0);
       constantIn,InstructionAddress: in std_logic_vector(31 downto 0);
       V,C,N,Z: out std_logic;
       Data_out: out std_logic_vector(31 downto 0)
);
end Microprocessor1;

architecture Behavioral of Microprocessor1 is
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
COMPONENT Memory32Bit
Port (address : in std_logic_vector(31 downto 0);
write_data : in std_logic_vector(31 downto 0);
write_enable : in std_logic;
clock : in std_logic;
read_data : out std_logic_vector(31 downto 0));
END COMPONENT;
COMPONENT Mux2_32bit
Port ( A : in STD_LOGIC;
           In0 : in STD_LOGIC_VECTOR (31 downto 0);
           In1 : in STD_LOGIC_VECTOR (31 downto 0);
           Z : out STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;
signal a,b,busA, busB, Bsignal, Fsignal, d,MemoryAddress,DataOut,zero_out,M_out,PC_in : STD_LOGIC_VECTOR (31 downto 0 );
signal MS : STD_LOGIC_VECTOR (2 downto 0 );
signal NA,car_s,Opcode,Mux_c : STD_LOGIC_VECTOR (16 downto 0 );
signal Reset,VCNZ_out : STD_LOGIC_VECTOR (3 downto 0 );
signal Z1,C1,A0,A1: STD_LOGIC;
begin
D0: Datapath port map (RW,DR,SA,SB,TD,TA,TB,FS,DataOut,constantIn,MB,MD,Clk,busA,busB,C,V,Z,N);
M32: Memory32Bit port map (M_out,busB,MW,Clk,DataOut);
MuxM: Mux2_32bit port map (MM,busA,InstructionAddress,M_out);
Data_out<=dataout;
end Behavioral;
