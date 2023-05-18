--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : Arithmetic_Logic_Unit                                        ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE PlatformIndependent OF Arithmetic_Logic_Unit IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------
   COMPONENT NOR_GATE_8_INPUTS
      GENERIC ( BubblesMask               : INTEGER);
      PORT ( Input_1                   : IN  std_logic;
             Input_2                   : IN  std_logic;
             Input_3                   : IN  std_logic;
             Input_4                   : IN  std_logic;
             Input_5                   : IN  std_logic;
             Input_6                   : IN  std_logic;
             Input_7                   : IN  std_logic;
             Input_8                   : IN  std_logic;
             Result                    : OUT std_logic);
   END COMPONENT;

   COMPONENT AND_GATE
      GENERIC ( BubblesMask               : INTEGER);
      PORT ( Input_1                   : IN  std_logic;
             Input_2                   : IN  std_logic;
             Result                    : OUT std_logic);
   END COMPONENT;

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

   COMPONENT XOR_GATE_BUS_ONEHOT
      GENERIC ( BubblesMask               : INTEGER;
                NrOfBits                  : INTEGER);
      PORT ( Input_1                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             Input_2                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             Result                    : OUT std_logic_vector( (NrOfBits-1) DOWNTO 0 ));
   END COMPONENT;

   COMPONENT OR_GATE
      GENERIC ( BubblesMask               : INTEGER);
      PORT ( Input_1                   : IN  std_logic;
             Input_2                   : IN  std_logic;
             Result                    : OUT std_logic);
   END COMPONENT;

   COMPONENT Multiplexer_bus_8
      GENERIC ( NrOfBits                  : INTEGER);
      PORT ( Enable                    : IN  std_logic;
             MuxIn_0                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             MuxIn_1                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             MuxIn_2                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             MuxIn_3                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             MuxIn_4                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             MuxIn_5                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             MuxIn_6                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             MuxIn_7                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             Sel                       : IN  std_logic_vector( 2 DOWNTO 0 );
             MuxOut                    : OUT std_logic_vector( (NrOfBits-1) DOWNTO 0 ));
   END COMPONENT;

   COMPONENT Adder
      GENERIC ( ExtendedBits              : INTEGER;
                NrOfBits                  : INTEGER);
      PORT ( CarryIn                   : IN  std_logic;
             DataA                     : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             DataB                     : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             CarryOut                  : OUT std_logic;
             Result                    : OUT std_logic_vector( (NrOfBits-1) DOWNTO 0 ));
   END COMPONENT;

   COMPONENT Subtractor
      GENERIC ( ExtendedBits              : INTEGER;
                NrOfBits                  : INTEGER);
      PORT ( BorrowIn                  : IN  std_logic;
             DataA                     : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             DataB                     : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             BorrowOut                 : OUT std_logic;
             Result                    : OUT std_logic_vector( (NrOfBits-1) DOWNTO 0 ));
   END COMPONENT;

   COMPONENT Shifter_8_bit
      GENERIC ( ShifterMode               : INTEGER);
      PORT ( DataA                     : IN  std_logic_vector( 7 DOWNTO 0 );
             ShiftAmount               : IN  std_logic_vector( 2 DOWNTO 0 );
             Result                    : OUT std_logic_vector( 7 DOWNTO 0 ));
   END COMPONENT;

   COMPONENT REGISTER_FLIP_FLOP
      GENERIC ( ActiveLevel               : INTEGER;
                NrOfBits                  : INTEGER);
      PORT ( Clock                     : IN  std_logic;
             ClockEnable               : IN  std_logic;
             D                         : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             Reset                     : IN  std_logic;
             Tick                      : IN  std_logic;
             Q                         : OUT std_logic_vector( (NrOfBits-1) DOWNTO 0 ));
   END COMPONENT;


   -----------------------------------------------------------------------------
   -- Here all used signals are defined                                       --
   -----------------------------------------------------------------------------
   SIGNAL s_LOGISIM_BUS_0                    : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_10                   : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_12                   : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_13                   : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_17                   : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_23                   : std_logic_vector( 2 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_25                   : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_28                   : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_29                   : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_32                   : std_logic_vector( 2 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_34                   : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_37                   : std_logic_vector( 2 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_38                   : std_logic_vector( 2 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_4                    : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_5                    : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_7                    : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_NET_1                    : std_logic;
   SIGNAL s_LOGISIM_NET_11                   : std_logic;
   SIGNAL s_LOGISIM_NET_14                   : std_logic;
   SIGNAL s_LOGISIM_NET_15                   : std_logic;
   SIGNAL s_LOGISIM_NET_16                   : std_logic;
   SIGNAL s_LOGISIM_NET_2                    : std_logic;
   SIGNAL s_LOGISIM_NET_20                   : std_logic;
   SIGNAL s_LOGISIM_NET_22                   : std_logic;
   SIGNAL s_LOGISIM_NET_24                   : std_logic;
   SIGNAL s_LOGISIM_NET_31                   : std_logic;
   SIGNAL s_LOGISIM_NET_33                   : std_logic;
   SIGNAL s_LOGISIM_NET_35                   : std_logic;
   SIGNAL s_LOGISIM_NET_36                   : std_logic;
   SIGNAL s_LOGISIM_NET_39                   : std_logic;
   SIGNAL s_LOGISIM_NET_40                   : std_logic;
   SIGNAL s_LOGISIM_NET_41                   : std_logic;
   SIGNAL s_LOGISIM_NET_42                   : std_logic;
   SIGNAL s_LOGISIM_NET_43                   : std_logic;
   SIGNAL s_LOGISIM_NET_8                    : std_logic;
   SIGNAL s_LOGISIM_NET_9                    : std_logic;

BEGIN

   -----------------------------------------------------------------------------
   -- Here all input connections are defined                                  --
   -----------------------------------------------------------------------------
   s_LOGISIM_BUS_10(7 DOWNTO 0)       <= Accummulator_In;
   s_LOGISIM_NET_15                   <= LOAD_Control;
   s_LOGISIM_NET_9                    <= Main_Clock;
   s_LOGISIM_NET_11                   <= Master_Clock;
   s_LOGISIM_NET_24                   <= FLAG_LATCH_control;
   s_LOGISIM_BUS_32(2 DOWNTO 0)       <= FUNCTION_control;
   s_LOGISIM_NET_14                   <= FUNCTION_LATCH_control;
   s_LOGISIM_BUS_25(7 DOWNTO 0)       <= Data_In;

   -----------------------------------------------------------------------------
   -- Here all output connections are defined                                 --
   -----------------------------------------------------------------------------
   Result                             <= s_LOGISIM_BUS_29(7 DOWNTO 0);
   Z_flag                             <= s_LOGISIM_NET_33;
   C_Flag                             <= s_LOGISIM_NET_16;

   -----------------------------------------------------------------------------
   -- Here all in-lined components are defined                                --
   -----------------------------------------------------------------------------
   s_LOGISIM_NET_39 <= '0';

   s_LOGISIM_NET_40 <= '0';

   s_LOGISIM_NET_41 <= '0';

   s_LOGISIM_BUS_37(2 DOWNTO 0) <= std_logic_vector(to_unsigned(1,3));

   s_LOGISIM_BUS_38(2 DOWNTO 0) <= std_logic_vector(to_unsigned(1,3));

   s_LOGISIM_NET_35 <= '0';

   s_LOGISIM_NET_36 <= '0';

   s_LOGISIM_NET_43 <= '0';

   s_LOGISIM_BUS_34(7 DOWNTO 0) <= std_logic_vector(to_unsigned(0,8));


   -----------------------------------------------------------------------------
   -- Here all normal components are defined                                  --
   -----------------------------------------------------------------------------
   GATE_1 : NOR_GATE_8_INPUTS
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_BUS_29(7),
                 Input_2                            => s_LOGISIM_BUS_29(6),
                 Input_3                            => s_LOGISIM_BUS_29(5),
                 Input_4                            => s_LOGISIM_BUS_29(4),
                 Input_5                            => s_LOGISIM_BUS_29(3),
                 Input_6                            => s_LOGISIM_BUS_29(2),
                 Input_7                            => s_LOGISIM_BUS_29(1),
                 Input_8                            => s_LOGISIM_BUS_29(0),
                 Result                             => s_LOGISIM_NET_22);

   GATE_2 : AND_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_24,
                 Input_2                            => s_LOGISIM_NET_9,
                 Result                             => s_LOGISIM_NET_8);

   GATE_3 : AND_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_15,
                 Input_2                            => s_LOGISIM_NET_9,
                 Result                             => s_LOGISIM_NET_42);

   GATE_4 : AND_GATE_BUS
      GENERIC MAP ( BubblesMask                        => 0,
                    NrOfBits                           => 8)
      PORT MAP ( Input_1                            => s_LOGISIM_BUS_10(7 DOWNTO 0),
                 Input_2                            => s_LOGISIM_BUS_0(7 DOWNTO 0),
                 Result                             => s_LOGISIM_BUS_17(7 DOWNTO 0));

   GATE_5 : OR_GATE_BUS
      GENERIC MAP ( BubblesMask                        => 0,
                    NrOfBits                           => 8)
      PORT MAP ( Input_1                            => s_LOGISIM_BUS_10(7 DOWNTO 0),
                 Input_2                            => s_LOGISIM_BUS_0(7 DOWNTO 0),
                 Result                             => s_LOGISIM_BUS_12(7 DOWNTO 0));

   GATE_6 : XOR_GATE_BUS_ONEHOT
      GENERIC MAP ( BubblesMask                        => 0,
                    NrOfBits                           => 8)
      PORT MAP ( Input_1                            => s_LOGISIM_BUS_10(7 DOWNTO 0),
                 Input_2                            => s_LOGISIM_BUS_0(7 DOWNTO 0),
                 Result                             => s_LOGISIM_BUS_7(7 DOWNTO 0));

   GATE_7 : AND_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_9,
                 Input_2                            => s_LOGISIM_NET_14,
                 Result                             => s_LOGISIM_NET_31);

   GATE_8 : OR_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_1,
                 Input_2                            => s_LOGISIM_NET_2,
                 Result                             => s_LOGISIM_NET_20);

   MUX_1 : Multiplexer_bus_8
      GENERIC MAP ( NrOfBits                           => 8)
      PORT MAP ( Enable                             => '1',
                 MuxIn_0                            => s_LOGISIM_BUS_17(7 DOWNTO 0),
                 MuxIn_1                            => s_LOGISIM_BUS_12(7 DOWNTO 0),
                 MuxIn_2                            => s_LOGISIM_BUS_7(7 DOWNTO 0),
                 MuxIn_3                            => s_LOGISIM_BUS_5(7 DOWNTO 0),
                 MuxIn_4                            => s_LOGISIM_BUS_28(7 DOWNTO 0),
                 MuxIn_5                            => s_LOGISIM_BUS_4(7 DOWNTO 0),
                 MuxIn_6                            => s_LOGISIM_BUS_13(7 DOWNTO 0),
                 MuxIn_7                            => s_LOGISIM_BUS_34(7 DOWNTO 0),
                 MuxOut                             => s_LOGISIM_BUS_29(7 DOWNTO 0),
                 Sel                                => s_LOGISIM_BUS_23(2 DOWNTO 0));

   ADDER2C_1 : Adder
      GENERIC MAP ( ExtendedBits                       => 9,
                    NrOfBits                           => 8)
      PORT MAP ( CarryIn                            => s_LOGISIM_NET_35,
                 CarryOut                           => s_LOGISIM_NET_1,
                 DataA                              => s_LOGISIM_BUS_10(7 DOWNTO 0),
                 DataB                              => s_LOGISIM_BUS_0(7 DOWNTO 0),
                 Result                             => s_LOGISIM_BUS_5(7 DOWNTO 0));

   SUBTRACTOR2C_1 : Subtractor
      GENERIC MAP ( ExtendedBits                       => 9,
                    NrOfBits                           => 8)
      PORT MAP ( BorrowIn                           => s_LOGISIM_NET_36,
                 BorrowOut                          => s_LOGISIM_NET_2,
                 DataA                              => s_LOGISIM_BUS_10(7 DOWNTO 0),
                 DataB                              => s_LOGISIM_BUS_0(7 DOWNTO 0),
                 Result                             => s_LOGISIM_BUS_28(7 DOWNTO 0));

   Shifter_1 : Shifter_8_bit
      GENERIC MAP ( ShifterMode                        => 2)
      PORT MAP ( DataA                              => s_LOGISIM_BUS_0(7 DOWNTO 0),
                 Result                             => s_LOGISIM_BUS_4(7 DOWNTO 0),
                 ShiftAmount                        => s_LOGISIM_BUS_37(2 DOWNTO 0));

   Shifter_2 : Shifter_8_bit
      GENERIC MAP ( ShifterMode                        => 0)
      PORT MAP ( DataA                              => s_LOGISIM_BUS_0(7 DOWNTO 0),
                 Result                             => s_LOGISIM_BUS_13(7 DOWNTO 0),
                 ShiftAmount                        => s_LOGISIM_BUS_38(2 DOWNTO 0));

   REGISTER_FILE_1 : REGISTER_FLIP_FLOP
      GENERIC MAP ( ActiveLevel                        => 1,
                    NrOfBits                           => 1)
      PORT MAP ( Clock                              => LOGISIM_CLOCK_TREE_0(4),
                 ClockEnable                        => s_LOGISIM_NET_8,
                 D(0)                               => s_LOGISIM_NET_22,
                 Q(0)                               => s_LOGISIM_NET_33,
                 Reset                              => s_LOGISIM_NET_39,
                 Tick                               => LOGISIM_CLOCK_TREE_0(2));

   REGISTER_FILE_2 : REGISTER_FLIP_FLOP
      GENERIC MAP ( ActiveLevel                        => 1,
                    NrOfBits                           => 1)
      PORT MAP ( Clock                              => LOGISIM_CLOCK_TREE_0(4),
                 ClockEnable                        => s_LOGISIM_NET_8,
                 D(0)                               => s_LOGISIM_NET_20,
                 Q(0)                               => s_LOGISIM_NET_16,
                 Reset                              => s_LOGISIM_NET_40,
                 Tick                               => LOGISIM_CLOCK_TREE_0(2));

   REGISTER_FILE_3 : REGISTER_FLIP_FLOP
      GENERIC MAP ( ActiveLevel                        => 1,
                    NrOfBits                           => 8)
      PORT MAP ( Clock                              => LOGISIM_CLOCK_TREE_0(4),
                 ClockEnable                        => s_LOGISIM_NET_42,
                 D                                  => s_LOGISIM_BUS_25(7 DOWNTO 0),
                 Q                                  => s_LOGISIM_BUS_0(7 DOWNTO 0),
                 Reset                              => s_LOGISIM_NET_41,
                 Tick                               => LOGISIM_CLOCK_TREE_0(2));

   REGISTER_FILE_4 : REGISTER_FLIP_FLOP
      GENERIC MAP ( ActiveLevel                        => 1,
                    NrOfBits                           => 3)
      PORT MAP ( Clock                              => LOGISIM_CLOCK_TREE_0(4),
                 ClockEnable                        => s_LOGISIM_NET_31,
                 D                                  => s_LOGISIM_BUS_32(2 DOWNTO 0),
                 Q                                  => s_LOGISIM_BUS_23(2 DOWNTO 0),
                 Reset                              => s_LOGISIM_NET_43,
                 Tick                               => LOGISIM_CLOCK_TREE_0(2));


END PlatformIndependent;
