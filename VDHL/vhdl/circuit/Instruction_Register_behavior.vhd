--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : Instruction_Register                                         ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE PlatformIndependent OF Instruction_Register IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------
   COMPONENT AND_GATE_BUS
      GENERIC ( BubblesMask               : INTEGER;
                NrOfBits                  : INTEGER);
      PORT ( Input_1                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             Input_2                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             Result                    : OUT std_logic_vector( (NrOfBits-1) DOWNTO 0 ));
   END COMPONENT;

   COMPONENT OR_GATE_BUS
      GENERIC ( BubblesMask               : INTEGER;
                NrOfBits                  : INTEGER);
      PORT ( Input_1                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             Input_2                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             Result                    : OUT std_logic_vector( (NrOfBits-1) DOWNTO 0 ));
   END COMPONENT;

   COMPONENT AND_GATE
      GENERIC ( BubblesMask               : INTEGER);
      PORT ( Input_1                   : IN  std_logic;
             Input_2                   : IN  std_logic;
             Result                    : OUT std_logic);
   END COMPONENT;

   COMPONENT Register_8_Bit
      PORT ( LOAD_control              : IN  std_logic;
             LOGISIM_CLOCK_TREE_0      : IN  std_logic_vector( 4 DOWNTO 0 );
             Main_Clock                : IN  std_logic;
             Master_Clock              : IN  std_logic;
             OUT_control               : IN  std_logic;
             Value_In                  : IN  std_logic_vector( 7 DOWNTO 0 );
             Perma_Out                 : OUT std_logic_vector( 7 DOWNTO 0 );
             Value_Out                 : OUT std_logic_vector( 7 DOWNTO 0 ));
   END COMPONENT;


   -----------------------------------------------------------------------------
   -- Here all used signals are defined                                       --
   -----------------------------------------------------------------------------
   SIGNAL s_LOGISIM_BUS_0                    : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_10                   : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_11                   : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_12                   : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_23                   : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_24                   : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_5                    : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_6                    : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_8                    : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_9                    : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_LOGISIM_NET_1                    : std_logic;
   SIGNAL s_LOGISIM_NET_13                   : std_logic;
   SIGNAL s_LOGISIM_NET_14                   : std_logic;
   SIGNAL s_LOGISIM_NET_15                   : std_logic;
   SIGNAL s_LOGISIM_NET_16                   : std_logic;
   SIGNAL s_LOGISIM_NET_17                   : std_logic;
   SIGNAL s_LOGISIM_NET_18                   : std_logic;
   SIGNAL s_LOGISIM_NET_19                   : std_logic;
   SIGNAL s_LOGISIM_NET_2                    : std_logic;
   SIGNAL s_LOGISIM_NET_20                   : std_logic;
   SIGNAL s_LOGISIM_NET_21                   : std_logic;
   SIGNAL s_LOGISIM_NET_22                   : std_logic;
   SIGNAL s_LOGISIM_NET_25                   : std_logic;
   SIGNAL s_LOGISIM_NET_3                    : std_logic;
   SIGNAL s_LOGISIM_NET_4                    : std_logic;
   SIGNAL s_LOGISIM_NET_7                    : std_logic;

BEGIN

   -----------------------------------------------------------------------------
   -- Here all wiring is defined                                              --
   -----------------------------------------------------------------------------
   s_LOGISIM_BUS_24(0)                <= s_LOGISIM_NET_4;
   s_LOGISIM_BUS_24(1)                <= s_LOGISIM_NET_4;
   s_LOGISIM_BUS_23(0)                <= s_LOGISIM_NET_7;
   s_LOGISIM_BUS_23(1)                <= s_LOGISIM_NET_7;
   s_LOGISIM_NET_15                   <= s_LOGISIM_BUS_8(0);
   s_LOGISIM_BUS_12(0)                <= s_LOGISIM_NET_15;
   s_LOGISIM_NET_16                   <= s_LOGISIM_BUS_8(1);
   s_LOGISIM_BUS_12(1)                <= s_LOGISIM_NET_16;
   s_LOGISIM_NET_17                   <= s_LOGISIM_BUS_8(2);
   s_LOGISIM_BUS_11(0)                <= s_LOGISIM_NET_17;
   s_LOGISIM_NET_18                   <= s_LOGISIM_BUS_8(3);
   s_LOGISIM_BUS_11(1)                <= s_LOGISIM_NET_18;
   s_LOGISIM_NET_19                   <= s_LOGISIM_BUS_8(4);
   s_LOGISIM_BUS_10(0)                <= s_LOGISIM_NET_19;
   s_LOGISIM_NET_20                   <= s_LOGISIM_BUS_8(5);
   s_LOGISIM_BUS_10(1)                <= s_LOGISIM_NET_20;
   s_LOGISIM_NET_21                   <= s_LOGISIM_BUS_8(6);
   s_LOGISIM_BUS_10(2)                <= s_LOGISIM_NET_21;
   s_LOGISIM_NET_22                   <= s_LOGISIM_BUS_8(7);
   s_LOGISIM_BUS_10(3)                <= s_LOGISIM_NET_22;

   -----------------------------------------------------------------------------
   -- Here all input connections are defined                                  --
   -----------------------------------------------------------------------------
   s_LOGISIM_NET_13                   <= REG1_OUT_control;
   s_LOGISIM_NET_14                   <= REG2_OUT_control;
   s_LOGISIM_NET_3                    <= Master_Clock;
   s_LOGISIM_NET_2                    <= Main_Clock;
   s_LOGISIM_NET_1                    <= LOAD_control;
   s_LOGISIM_BUS_0(7 DOWNTO 0)        <= Value_In;

   -----------------------------------------------------------------------------
   -- Here all output connections are defined                                 --
   -----------------------------------------------------------------------------
   Out_To_Microcode_ROM               <= s_LOGISIM_BUS_10(3 DOWNTO 0);
   Reg_Select                         <= s_LOGISIM_BUS_9(1 DOWNTO 0);

   -----------------------------------------------------------------------------
   -- Here all in-lined components are defined                                --
   -----------------------------------------------------------------------------
   s_LOGISIM_NET_25 <= '1';


   -----------------------------------------------------------------------------
   -- Here all normal components are defined                                  --
   -----------------------------------------------------------------------------
   GATE_1 : AND_GATE_BUS
      GENERIC MAP ( BubblesMask                        => 0,
                    NrOfBits                           => 2)
      PORT MAP ( Input_1                            => s_LOGISIM_BUS_23(1 DOWNTO 0),
                 Input_2                            => s_LOGISIM_BUS_12(1 DOWNTO 0),
                 Result                             => s_LOGISIM_BUS_5(1 DOWNTO 0));

   GATE_2 : AND_GATE_BUS
      GENERIC MAP ( BubblesMask                        => 0,
                    NrOfBits                           => 2)
      PORT MAP ( Input_1                            => s_LOGISIM_BUS_11(1 DOWNTO 0),
                 Input_2                            => s_LOGISIM_BUS_24(1 DOWNTO 0),
                 Result                             => s_LOGISIM_BUS_6(1 DOWNTO 0));

   GATE_3 : OR_GATE_BUS
      GENERIC MAP ( BubblesMask                        => 0,
                    NrOfBits                           => 2)
      PORT MAP ( Input_1                            => s_LOGISIM_BUS_5(1 DOWNTO 0),
                 Input_2                            => s_LOGISIM_BUS_6(1 DOWNTO 0),
                 Result                             => s_LOGISIM_BUS_9(1 DOWNTO 0));

   GATE_4 : AND_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_2,
                 Input_2                            => s_LOGISIM_NET_13,
                 Result                             => s_LOGISIM_NET_4);

   GATE_5 : AND_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_2,
                 Input_2                            => s_LOGISIM_NET_14,
                 Result                             => s_LOGISIM_NET_7);


   -----------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                       --
   -----------------------------------------------------------------------------
   Register_8_Bit_1 : Register_8_Bit
      PORT MAP ( LOAD_control                       => s_LOGISIM_NET_1,
                 LOGISIM_CLOCK_TREE_0               => LOGISIM_CLOCK_TREE_0,
                 Main_Clock                         => s_LOGISIM_NET_2,
                 Master_Clock                       => s_LOGISIM_NET_3,
                 OUT_control                        => s_LOGISIM_NET_25,
                 Perma_Out                          => s_LOGISIM_BUS_8(7 DOWNTO 0),
                 Value_In                           => s_LOGISIM_BUS_0(7 DOWNTO 0),
                 Value_Out                          => OPEN);


END PlatformIndependent;
