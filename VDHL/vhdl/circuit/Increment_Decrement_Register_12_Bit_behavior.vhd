--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : Increment_Decrement_Register_12_Bit                          ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE PlatformIndependent OF Increment_Decrement_Register_12_Bit IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------
   COMPONENT AND_GATE
      GENERIC ( BubblesMask               : INTEGER);
      PORT ( Input_1                   : IN  std_logic;
             Input_2                   : IN  std_logic;
             Result                    : OUT std_logic);
   END COMPONENT;

   COMPONENT OR_GATE
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

   COMPONENT AND_GATE_3_INPUTS
      GENERIC ( BubblesMask               : INTEGER);
      PORT ( Input_1                   : IN  std_logic;
             Input_2                   : IN  std_logic;
             Input_3                   : IN  std_logic;
             Result                    : OUT std_logic);
   END COMPONENT;

   COMPONENT LogisimCounter
      GENERIC ( mode                      : INTEGER;
                ClkEdge                   : INTEGER;
                max_val                   : INTEGER;
                width                     : INTEGER);
      PORT ( ClockEnable               : IN  std_logic;
             Enable                    : IN  std_logic;
             GlobalClock               : IN  std_logic;
             LoadData                  : IN  std_logic_vector( (width-1) DOWNTO 0 );
             Up_n_Down                 : IN  std_logic;
             clear                     : IN  std_logic;
             load                      : IN  std_logic;
             CompareOut                : OUT std_logic;
             CountValue                : OUT std_logic_vector( (width-1) DOWNTO 0 ));
   END COMPONENT;


   -----------------------------------------------------------------------------
   -- Here all used signals are defined                                       --
   -----------------------------------------------------------------------------
   SIGNAL s_LOGISIM_BUS_15                   : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_31                   : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_6                    : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_7                    : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_9                    : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_NET_0                    : std_logic;
   SIGNAL s_LOGISIM_NET_1                    : std_logic;
   SIGNAL s_LOGISIM_NET_10                   : std_logic;
   SIGNAL s_LOGISIM_NET_12                   : std_logic;
   SIGNAL s_LOGISIM_NET_13                   : std_logic;
   SIGNAL s_LOGISIM_NET_14                   : std_logic;
   SIGNAL s_LOGISIM_NET_16                   : std_logic;
   SIGNAL s_LOGISIM_NET_17                   : std_logic;
   SIGNAL s_LOGISIM_NET_18                   : std_logic;
   SIGNAL s_LOGISIM_NET_19                   : std_logic;
   SIGNAL s_LOGISIM_NET_2                    : std_logic;
   SIGNAL s_LOGISIM_NET_20                   : std_logic;
   SIGNAL s_LOGISIM_NET_21                   : std_logic;
   SIGNAL s_LOGISIM_NET_22                   : std_logic;
   SIGNAL s_LOGISIM_NET_27                   : std_logic;
   SIGNAL s_LOGISIM_NET_28                   : std_logic;
   SIGNAL s_LOGISIM_NET_29                   : std_logic;
   SIGNAL s_LOGISIM_NET_3                    : std_logic;
   SIGNAL s_LOGISIM_NET_30                   : std_logic;
   SIGNAL s_LOGISIM_NET_32                   : std_logic;
   SIGNAL s_LOGISIM_NET_33                   : std_logic;
   SIGNAL s_LOGISIM_NET_5                    : std_logic;
   SIGNAL s_LOGISIM_NET_8                    : std_logic;

BEGIN

   -----------------------------------------------------------------------------
   -- Here all wiring is defined                                              --
   -----------------------------------------------------------------------------
   s_LOGISIM_BUS_31(0)                <= s_LOGISIM_NET_5;
   s_LOGISIM_BUS_31(1)                <= s_LOGISIM_NET_5;
   s_LOGISIM_BUS_31(2)                <= s_LOGISIM_NET_5;
   s_LOGISIM_BUS_31(3)                <= s_LOGISIM_NET_5;
   s_LOGISIM_BUS_31(4)                <= s_LOGISIM_NET_5;
   s_LOGISIM_BUS_31(5)                <= s_LOGISIM_NET_5;
   s_LOGISIM_BUS_31(6)                <= s_LOGISIM_NET_5;
   s_LOGISIM_BUS_31(7)                <= s_LOGISIM_NET_5;
   s_LOGISIM_BUS_31(8)                <= s_LOGISIM_NET_5;
   s_LOGISIM_BUS_31(9)                <= s_LOGISIM_NET_5;
   s_LOGISIM_BUS_31(10)               <= s_LOGISIM_NET_5;
   s_LOGISIM_BUS_31(11)               <= s_LOGISIM_NET_5;
   s_LOGISIM_NET_27                   <= s_LOGISIM_BUS_9(0);
   s_LOGISIM_BUS_7(0)                 <= s_LOGISIM_NET_27;
   s_LOGISIM_NET_28                   <= s_LOGISIM_BUS_9(1);
   s_LOGISIM_BUS_7(1)                 <= s_LOGISIM_NET_28;
   s_LOGISIM_NET_29                   <= s_LOGISIM_BUS_9(2);
   s_LOGISIM_BUS_7(2)                 <= s_LOGISIM_NET_29;
   s_LOGISIM_NET_30                   <= s_LOGISIM_BUS_9(3);
   s_LOGISIM_BUS_7(3)                 <= s_LOGISIM_NET_30;

   -----------------------------------------------------------------------------
   -- Here all input connections are defined                                  --
   -----------------------------------------------------------------------------
   s_LOGISIM_BUS_9(7 DOWNTO 0)        <= Value_In;
   s_LOGISIM_NET_0                    <= Main_Clock;
   s_LOGISIM_NET_21                   <= LOAD_HIGH_Control;
   s_LOGISIM_NET_16                   <= LOAD_LOW_Control;
   s_LOGISIM_NET_3                    <= Increment;
   s_LOGISIM_NET_8                    <= Decrement;
   s_LOGISIM_NET_19                   <= Master_Clock;
   s_LOGISIM_NET_1                    <= Perma_Out;
   s_LOGISIM_NET_22                   <= OUT_control;

   -----------------------------------------------------------------------------
   -- Here all output connections are defined                                 --
   -----------------------------------------------------------------------------
   Value_Out                          <= s_LOGISIM_BUS_15(11 DOWNTO 0);

   -----------------------------------------------------------------------------
   -- Here all in-lined components are defined                                --
   -----------------------------------------------------------------------------
   s_LOGISIM_NET_32 <= '0';

   s_LOGISIM_NET_33 <= '0';


   -----------------------------------------------------------------------------
   -- Here all normal components are defined                                  --
   -----------------------------------------------------------------------------
   GATE_5 : AND_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_0,
                 Input_2                            => s_LOGISIM_NET_22,
                 Result                             => s_LOGISIM_NET_10);

   GATE_6 : OR_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_1,
                 Input_2                            => s_LOGISIM_NET_10,
                 Result                             => s_LOGISIM_NET_5);

   GATE_7 : AND_GATE_BUS
      GENERIC MAP ( BubblesMask                        => 0,
                    NrOfBits                           => 12)
      PORT MAP ( Input_1                            => s_LOGISIM_BUS_31(11 DOWNTO 0),
                 Input_2                            => s_LOGISIM_BUS_6(11 DOWNTO 0),
                 Result                             => s_LOGISIM_BUS_15(11 DOWNTO 0));

   GATE_8 : AND_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_0,
                 Input_2                            => s_LOGISIM_NET_16,
                 Result                             => s_LOGISIM_NET_12);

   GATE_9 : AND_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_21,
                 Input_2                            => s_LOGISIM_NET_0,
                 Result                             => s_LOGISIM_NET_17);

   GATE_10 : OR_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_3,
                 Input_2                            => s_LOGISIM_NET_8,
                 Result                             => s_LOGISIM_NET_20);

   GATE_11 : AND_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_0,
                 Input_2                            => s_LOGISIM_NET_20,
                 Result                             => s_LOGISIM_NET_14);

   GATE_12 : OR_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_3,
                 Input_2                            => s_LOGISIM_NET_8,
                 Result                             => s_LOGISIM_NET_13);

   GATE_13 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_13,
                 Input_2                            => s_LOGISIM_NET_0,
                 Input_3                            => s_LOGISIM_NET_18,
                 Result                             => s_LOGISIM_NET_2);

   COUNTER_1 : LogisimCounter
      GENERIC MAP ( ClkEdge                            => 1,
                    max_val                            => 255,
                    mode                               => 0,
                    width                              => 8)
      PORT MAP ( ClockEnable                        => LOGISIM_CLOCK_TREE_0(2),
                 CompareOut                         => s_LOGISIM_NET_18,
                 CountValue                         => s_LOGISIM_BUS_6(7 DOWNTO 0),
                 Enable                             => s_LOGISIM_NET_14,
                 GlobalClock                        => LOGISIM_CLOCK_TREE_0(4),
                 LoadData                           => s_LOGISIM_BUS_9(7 DOWNTO 0),
                 Up_n_Down                          => s_LOGISIM_NET_3,
                 clear                              => s_LOGISIM_NET_32,
                 load                               => s_LOGISIM_NET_12);

   COUNTER_2 : LogisimCounter
      GENERIC MAP ( ClkEdge                            => 1,
                    max_val                            => 15,
                    mode                               => 0,
                    width                              => 4)
      PORT MAP ( ClockEnable                        => LOGISIM_CLOCK_TREE_0(2),
                 CompareOut                         => OPEN,
                 CountValue                         => s_LOGISIM_BUS_6(11 DOWNTO 8),
                 Enable                             => s_LOGISIM_NET_2,
                 GlobalClock                        => LOGISIM_CLOCK_TREE_0(4),
                 LoadData                           => s_LOGISIM_BUS_7(3 DOWNTO 0),
                 Up_n_Down                          => s_LOGISIM_NET_3,
                 clear                              => s_LOGISIM_NET_33,
                 load                               => s_LOGISIM_NET_17);


END PlatformIndependent;
