library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Microprocessor32Bit is
Port ( Clk : in std_logic
);
end Microprocessor32Bit;

architecture Behavioral of Microprocessor32Bit is
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
COMPONENT ControlMemory
Port (   IN_CAR : in std_logic_vector(16 downto 0);
         NA : out std_logic_vector(16 downto 0);
         MS : out std_logic_vector(2 downto 0);
         MC, IL, PI, PL : out std_logic;
         FS : out std_logic_vector(4 downto 0);
         TD, TA, TB, MB, MD, RW, MM, MW, RV, RC, RN, RZ, FL : out std_logic);
END COMPONENT;
COMPONENT VCNZ_FlipFlops
Port (V, C, N, Z, FL, clock : in std_logic;
        Reset : in std_logic_vector(3 downto 0);
        VCNZ : OUT std_logic_vector(3 downto 0));
END COMPONENT;
COMPONENT CAR
Port ( muxC: in std_logic_vector(16 downto 0);
       muxS, clock : in std_logic;
       CAR_out: inout std_logic_vector(16 downto 0)
);
END COMPONENT;
COMPONENT IR
Port ( IR_in: in std_logic_vector(31 downto 0);
       IL, clock: in std_logic;
       Opcode: out std_logic_vector(16 downto 0);
       DR, SA, SB: out std_logic_vector(4 downto 0)
);
END COMPONENT;
COMPONENT PC
Port ( PC_in: in std_logic_vector(31 downto 0);
       PL, PI, clock: in std_logic; 
       PC_out: INout std_logic_vector(31 downto 0)
);
END COMPONENT;
COMPONENT Multiplexer1Bit_8to1
    Port ( 
    Z1,C1,N,Z,V,C,A1,A0: in STD_LOGIC;
    S: in STD_LOGIC_VECTOR (2 downto 0);
    M_out: out STD_LOGIC
    );
END COMPONENT;
COMPONENT ExtendLogic
Port ( DR, SB: in std_logic_vector(4 downto 0);
       Extend_out: out std_logic_vector(31 downto 0)
);
END COMPONENT;
COMPONENT ZeroFillLogic
Port ( SB: in std_logic_vector(4 downto 0);
       zero_out: out std_logic_vector(31 downto 0)
);
END COMPONENT;
component MUX2to1_17bit19336852
port ( 
    A : in STD_LOGIC;
    In0 : in STD_LOGIC_VECTOR (16 downto 0);
    In1 : in STD_LOGIC_VECTOR (16 downto 0);
    Z : out STD_LOGIC_VECTOR (16 downto 0)
      );
end component;
signal busA, busB, d,InstructionAddress,MemoryAddress,DataOut,zero_out,M_out,PC_in : STD_LOGIC_VECTOR (31 downto 0 );
signal FL,RZ,RN,RC,RV,MW,MM,RW,MD,MB,TB,TA,TD,PL,PI,IL,MC,C,V,N,Z,Mux_s : STD_LOGIC;
signal MS : STD_LOGIC_VECTOR (2 downto 0 );
signal NA,car_s,Opcode,Mux_c : STD_LOGIC_VECTOR (16 downto 0 );
signal DR,SA,SB,FS : STD_LOGIC_VECTOR (4 downto 0 );
signal Reset,VCNZ_out : STD_LOGIC_VECTOR (3 downto 0 );
signal Z1,C1,A0,A1: STD_LOGIC;
begin
car_s<="00000000000000000";
D0: Datapath port map (RW,DR,SA,SB,TD,TA,TB,FS,d,zero_out,MB,MD,Clk,busA,busB,C,V,Z,N);
M32: Memory32Bit port map (MemoryAddress,busB,MW,Clk,DataOut);
MuxM: Mux2_32bit port map (MM,busA,InstructionAddress,M_out);
CM: ControlMemory port map (car_s,NA,MS,MC, IL, PI, PL,FS,TD, TA, TB, MB, MD, RW, MM, MW, RV, RC, RN, RZ, FL);
Reset(0) <= RC;
Reset(1) <= RV;
Reset(2) <= RZ;
Reset(3) <= RN;
VCNZ: VCNZ_FlipFlops port map (V, C, N, Z, FL, Clk,Reset,VCNZ_out);
CAR1: CAR port map (Mux_c,Mux_s,Clk,car_s);
IR1: IR port map (DataOut,IL,Clk,Opcode,DR, SA, SB);
PC1: PC port map (PC_in,PL, PI, Clk,InstructionAddress);
Z1<=not VCNZ_out(2);
C1<=not VCNZ_out(0);
A1<='1';
A0<='0';
MuxS: Multiplexer1Bit_8to1 port map (Z1,C1,VCNZ_out(3),VCNZ_out(2),VCNZ_out(1),VCNZ_out(0),A1,A0,MS,Mux_s);
Extend: ExtendLogic port map (DR, SB,PC_in);
zerofill: ZeroFillLogic port map (SB,zero_out);
MuxC: MUX2to1_17bit19336852 port map (MC, NA, Opcode, Mux_c);
end Behavioral;
