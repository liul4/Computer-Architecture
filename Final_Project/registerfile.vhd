library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity registerfile is
Port ( 
Write : in std_logic;
DR,SA,SB : in std_logic_vector(4 downto 0);
Clk : in std_logic;
TD, TA, TB : in std_logic;
data : in std_logic_vector(31 downto 0);
Adata : out std_logic_vector(31 downto 0);
Bdata : out std_logic_vector(31 downto 0)
);
end registerfile;

architecture Behavioral of registerfile is

COMPONENT decoder
PORT(
A : IN std_logic_vector;
Q0 : OUT std_logic;
Q1 : OUT std_logic;
Q2 : OUT std_logic;
Q3 : OUT std_logic;
Q4 : OUT std_logic;
Q5 : OUT std_logic;
Q6 : OUT std_logic;
Q7 : OUT std_logic;
Q8 : OUT std_logic;
Q9 : OUT std_logic;
Q10 : OUT std_logic;
Q11 : OUT std_logic;
Q12 : OUT std_logic;
Q13 : OUT std_logic;
Q14 : OUT std_logic;
Q15 : OUT std_logic;
Q16 : OUT std_logic;
Q17 : OUT std_logic;
Q18 : OUT std_logic;
Q19 : OUT std_logic;
Q20 : OUT std_logic;
Q21 : OUT std_logic;
Q22 : OUT std_logic;
Q23 : OUT std_logic;
Q24 : OUT std_logic;
Q25 : OUT std_logic;
Q26 : OUT std_logic;
Q27 : OUT std_logic;
Q28 : OUT std_logic;
Q29 : OUT std_logic;
Q30 : OUT std_logic;
Q31 : OUT std_logic
);
END COMPONENT;

COMPONENT Mux32_32bit
PORT( in0 : IN std_logic_vector(31 downto 0);
in1 : IN std_logic_vector(31 downto 0);
in2 : IN std_logic_vector(31 downto 0);
in3 : IN std_logic_vector(31 downto 0);
in4 : IN std_logic_vector(31 downto 0);
in5 : IN std_logic_vector(31 downto 0);
in6 : IN std_logic_vector(31 downto 0);
in7 : IN std_logic_vector(31 downto 0);
in8 : IN std_logic_vector(31 downto 0);
in9 : IN std_logic_vector(31 downto 0);
in10 : IN std_logic_vector(31 downto 0);
in11 : IN std_logic_vector(31 downto 0);
in12 : IN std_logic_vector(31 downto 0);
in13 : IN std_logic_vector(31 downto 0);
in14 : IN std_logic_vector(31 downto 0);
in15 : IN std_logic_vector(31 downto 0);
in16 : IN std_logic_vector(31 downto 0);
in17 : IN std_logic_vector(31 downto 0);
in18 : IN std_logic_vector(31 downto 0);
in19 : IN std_logic_vector(31 downto 0);
in20 : IN std_logic_vector(31 downto 0);
in21 : IN std_logic_vector(31 downto 0);
in22 : IN std_logic_vector(31 downto 0);
in23 : IN std_logic_vector(31 downto 0);
in24 : IN std_logic_vector(31 downto 0);
in25 : IN std_logic_vector(31 downto 0);
in26 : IN std_logic_vector(31 downto 0);
in27 : IN std_logic_vector(31 downto 0);
in28 : IN std_logic_vector(31 downto 0);
in29 : IN std_logic_vector(31 downto 0);
in30 : IN std_logic_vector(31 downto 0);
in31 : IN std_logic_vector(31 downto 0);
s : in  STD_LOGIC_VECTOR (4 downto 0);
Z : OUT std_logic_vector(31 downto 0)
);
END COMPONENT;


COMPONENT reg
PORT(
D : IN std_logic_vector(31 downto 0);
load : IN std_logic;
Clk : IN std_logic;
Q : OUT std_logic_vector(31 downto 0)
);
END COMPONENT;
COMPONENT And_Gate
Port ( 
in1 : in std_logic;
in2 : in std_logic;
O: out std_logic
);
END COMPONENT;


-- signals
signal load_reg0, load_reg1, load_reg2, load_reg3, load_reg4, load_reg5, load_reg6, load_reg7, load_reg8, load_reg9, load_reg10, load_reg11, load_reg12, load_reg13, load_reg14, load_reg15, load_reg16, load_reg17, load_reg18, load_reg19, load_reg20, load_reg21, load_reg22, load_reg23, load_reg24, load_reg25, load_reg26, load_reg27, load_reg28, load_reg29, load_reg30, load_reg31, load_reg32 : std_logic;
signal reg0_q, reg1_q, reg2_q, reg3_q, reg4_q, reg5_q, reg6_q, reg7_q, reg8_q, reg9_q, reg10_q, reg11_q, reg12_q, reg13_q, reg14_q, reg15_q, reg16_q, reg17_q, reg18_q, reg19_q, reg20_q, reg21_q, reg22_q, reg23_q, reg24_q, reg25_q, reg26_q, reg27_q, reg28_q, reg29_q, reg30_q, reg31_q, reg32_q : std_logic_vector(31 downto 0);
signal r0_q, r1_q, r2_q, r3_q, r4_q, r5_q, r6_q, r7_q, r8_q, r9_q, r10_q, r11_q, r12_q, r13_q, r14_q, r15_q, r16_q, r17_q, r18_q, r19_q, r20_q, r21_q, r22_q, r23_q, r24_q, r25_q, r26_q, r27_q, r28_q, r29_q, r30_q, r31_q, r32_q : std_logic;
signal aout, bout: std_logic_vector(31 downto 0);
begin
-- Destination register decoder
des_decoder_5to32: decoder PORT MAP(
A => DR,
Q0 => load_reg0,
Q1 => load_reg1,
Q2 => load_reg2,
Q3 => load_reg3,
Q4 => load_reg4,
Q5 => load_reg5,
Q6 => load_reg6,
Q7 => load_reg7,
Q8 => load_reg8,
Q9 => load_reg9,
Q10 => load_reg10,
Q11 => load_reg11,
Q12 => load_reg12,
Q13 => load_reg13,
Q14 => load_reg14,
Q15 => load_reg15,
Q16 => load_reg16,
Q17 => load_reg17,
Q18 => load_reg18,
Q19 => load_reg19,
Q20 => load_reg20,
Q21 => load_reg21,
Q22 => load_reg22,
Q23 => load_reg23,
Q24 => load_reg24,
Q25 => load_reg25,
Q26 => load_reg26,
Q27 => load_reg27,
Q28 => load_reg28,
Q29 => load_reg29,
Q30 => load_reg30,
Q31 => load_reg31
);

r0_q <= load_reg0 and Write and (not TD);
reg00: reg PORT MAP(
D => data,
load => r0_q,
Clk => Clk,
Q => reg0_q
);
r1_q <= load_reg1 and Write and (not TD);
-- register 1
reg01: reg PORT MAP(
D => data,
load => r1_q,
Clk => Clk,
Q => reg1_q
);
r2_q <= load_reg2 and Write and (not TD);
-- register 2
reg02: reg PORT MAP(
D => data,
load => r2_q,
Clk => Clk,
Q => reg2_q
);
r3_q <= load_reg3 and Write and (not TD);
-- register 3
reg03: reg PORT MAP(
D => data,
load => r3_q,
Clk => Clk,
Q => reg3_q
);
r4_q <= load_reg4 and Write and (not TD);
-- register 4
reg04: reg PORT MAP(
D => data,
load => r4_q,
Clk => Clk,
Q => reg4_q
);
r5_q <= load_reg5 and Write and (not TD);
-- register 5
reg05: reg PORT MAP(
D => data,
load => r5_q,
Clk => Clk,
Q => reg5_q
);
r6_q <= load_reg6 and Write and (not TD);
-- register 6
reg06: reg PORT MAP(
D => data,
load => r6_q,
Clk => Clk,
Q => reg6_q
);
r7_q <= load_reg7 and Write and (not TD);
-- register 7
reg07: reg PORT MAP(
D => data,
load => r7_q,
Clk => Clk,
Q => reg7_q
);
r8_q <= load_reg8 and Write and (not TD);
-- register 8
reg08: reg PORT MAP(
D => data,
load => r8_q,
Clk => Clk,
Q => reg8_q
);
r9_q <= load_reg9 and Write and (not TD);
-- register 9
reg09: reg PORT MAP(
D => data,
load => r9_q,
Clk => Clk,
Q => reg9_q
);
r10_q <= load_reg10 and Write and (not TD);
-- register 10
reg10: reg PORT MAP(
D => data,
load => r10_q,
Clk => Clk,
Q => reg10_q
);
r11_q <= load_reg11 and Write and (not TD);
reg11: reg PORT MAP(
D => data,
load => r11_q,
Clk => Clk,
Q => reg11_q
);
r12_q <= load_reg12 and Write and (not TD);
-- register 12
reg12: reg PORT MAP(
D => data,
load => r12_q,
Clk => Clk,
Q => reg12_q
);
r13_q <= load_reg13 and Write and (not TD);
-- register 13
reg13: reg PORT MAP(
D => data,
load => r13_q,
Clk => Clk,
Q => reg13_q
);
r14_q <= load_reg14 and Write and (not TD);
-- register 14
reg14: reg PORT MAP(
D => data,
load => r14_q,
Clk => Clk,
Q => reg14_q
);
r15_q <= load_reg15 and Write and (not TD);
-- register 15
reg15: reg PORT MAP(
D => data,
load => r15_q,
Clk => Clk,
Q => reg15_q
);
r16_q <= load_reg16 and Write and (not TD);
-- register 16
reg16: reg PORT MAP(
D => data,
load => r16_q,
Clk => Clk,
Q => reg16_q
);
r17_q<=load_reg17 and Write and (not TD);
-- register 17
reg17: reg PORT MAP(
D => data,
load => r17_q,
Clk => Clk,
Q => reg17_q
);
r18_q <= load_reg18 and Write and (not TD);
-- register 18
reg18: reg PORT MAP(
D => data,
load => r18_q,
Clk => Clk,
Q => reg18_q
);
r19_q <= load_reg19 and Write and (not TD);
-- register 19
reg19: reg PORT MAP(
D => data,
load => r19_q,
Clk => Clk,
Q => reg19_q
);
r20_q <= load_reg20 and Write and (not TD);
-- register 20
reg20: reg PORT MAP(
D => data,
load => r20_q,
Clk => Clk,
Q => reg20_q
);
r21_q <= load_reg21 and Write and (not TD);
-- register 21
reg21: reg PORT MAP(
D => data,
load => r21_q,
Clk => Clk,
Q => reg21_q
);
r22_q<= load_reg22  and Write and (not TD);
-- register 22
reg22: reg PORT MAP(
D => data,
load => r22_q,
Clk => Clk,
Q => reg22_q
);
r23_q <= load_reg23 and Write and (not TD);
-- register 23
reg23: reg PORT MAP(
D => data,
load => r23_q,
Clk => Clk,
Q => reg23_q
);
r24_q <= load_reg24 and Write and (not TD);
-- register 24
reg24: reg PORT MAP(
D => data,
load => r24_q,
Clk => Clk,
Q => reg24_q
);
r25_q <= load_reg25 and Write and (not TD);
-- register 25
reg25: reg PORT MAP(
D => data,
load => r25_q,
Clk => Clk,
Q => reg25_q
);
r26_q <= load_reg26 and Write and (not TD);
-- register 26
reg26: reg PORT MAP(
D => data,
load => r26_q,
Clk => Clk,
Q => reg26_q
);
r27_q<=load_reg27 and Write and (not TD);
-- register 27
reg27: reg PORT MAP(
D => data,
load => r27_q,
Clk => Clk,
Q => reg27_q
);
r28_q <= load_reg28 and Write and (not TD);
-- register 28
reg28: reg PORT MAP(
D => data,
load => r28_q,
Clk => Clk,
Q => reg28_q
);
r29_q <= load_reg29 and Write and (not TD);
-- register 29
reg29: reg PORT MAP(
D => data,
load => r29_q,
Clk => Clk,
Q => reg29_q
);
r30_q<= load_reg30  and Write and (not TD);
-- register 30
reg30: reg PORT MAP(
D => data,
load =>  r30_q,
Clk => Clk,
Q => reg30_q
);
r31_q<= load_reg31 and Write and (not TD);
-- register 31
reg31: reg PORT MAP(
D => data,
load => r31_q,
Clk => Clk,
Q => reg31_q
);
r32_q<= TD and Write;
tempreg32: reg PORT MAP(
D => data,
load => r32_q,
Clk => Clk,
Q => reg32_q
);

mux32_32_1: Mux32_32bit port map (reg0_q, reg1_q, reg2_q, reg3_q, reg4_q, reg5_q, reg6_q, reg7_q, reg8_q, reg9_q, reg10_q, reg11_q, reg12_q, reg13_q, reg14_q, reg15_q, reg16_q, reg17_q, reg18_q, reg19_q, reg20_q, reg21_q, reg22_q, reg23_q, reg24_q, reg25_q, reg26_q, reg27_q, reg28_q, reg29_q, reg30_q, reg31_q,SA,aout);
Adata<=reg32_q when TA = '1' else
       aout when TA = '0' else
       "00000000000000000000000000000000";
mux32_32_2: Mux32_32bit port map (reg0_q, reg1_q, reg2_q, reg3_q, reg4_q, reg5_q, reg6_q, reg7_q, reg8_q, reg9_q, reg10_q, reg11_q, reg12_q, reg13_q, reg14_q, reg15_q, reg16_q, reg17_q, reg18_q, reg19_q, reg20_q, reg21_q, reg22_q, reg23_q, reg24_q, reg25_q, reg26_q, reg27_q, reg28_q, reg29_q, reg30_q, reg31_q,SB,bout);
Bdata<=reg32_q when TB = '1' else
       bout when TB = '0' else
       "00000000000000000000000000000000";
end Behavioral;
