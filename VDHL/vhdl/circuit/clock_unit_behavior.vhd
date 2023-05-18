--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : clock_unit                                                   ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE PlatformIndependent OF clock_unit IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------
   COMPONENT AND_GATE
      GENERIC ( BubblesMask               : INTEGER);
      PORT ( Input_1                   : IN  std_logic;
             Input_2                   : IN  std_logic;
             Result                    : OUT std_logic);
   END COMPONENT;

   COMPONENT NOT_GATE
      PORT ( Input_1                   : IN  std_logic;
             Result                    : OUT std_logic);
   END COMPONENT;

   COMPONENT OR_GATE
      GENERIC ( BubblesMask               : INTEGER);
      PORT ( Input_1                   : IN  std_logic;
             Input_2                   : IN  std_logic;
             Result                    : OUT std_logic);
   END COMPONENT;

   COMPONENT Multiplexer_2
      PORT ( Enable                    : IN  std_logic;
             MuxIn_0                   : IN  std_logic;
             MuxIn_1                   : IN  std_logic;
             Sel                       : IN  std_logic;
             MuxOut                    : OUT std_logic);
   END COMPONENT;

   COMPONENT D_FLIPFLOP
      GENERIC ( ActiveLevel               : INTEGER);
      PORT ( Clock                     : IN  std_logic;
             D                         : IN  std_logic;
             Preset                    : IN  std_logic;
             Reset                     : IN  std_logic;
             Tick                      : IN  std_logic;
             Q                         : OUT std_logic;
             Q_bar                     : OUT std_logic);
   END COMPONENT;

   COMPONENT J_K_FLIPFLOP
      GENERIC ( ActiveLevel               : INTEGER);
      PORT ( Clock                     : IN  std_logic;
             J                         : IN  std_logic;
             K                         : IN  std_logic;
             Preset                    : IN  std_logic;
             Reset                     : IN  std_logic;
             Tick                      : IN  std_logic;
             Q                         : OUT std_logic;
             Q_bar                     : OUT std_logic);
   END COMPONENT;

   COMPONENT S_R_FLIPFLOP
      GENERIC ( ActiveLevel               : INTEGER);
      PORT ( Clock                     : IN  std_logic;
             Preset                    : IN  std_logic;
             R                         : IN  std_logic;
             Reset                     : IN  std_logic;
             S                         : IN  std_logic;
             Tick                      : IN  std_logic;
             Q                         : OUT std_logic;
             Q_bar                     : OUT std_logic);
   END COMPONENT;


   -----------------------------------------------------------------------------
   -- Here all used signals are defined                                       --
   -----------------------------------------------------------------------------
   SIGNAL s_LOGISIM_NET_0                    : std_logic;
   SIGNAL s_LOGISIM_NET_1                    : std_logic;
   SIGNAL s_LOGISIM_NET_10                   : std_logic;
   SIGNAL s_LOGISIM_NET_11                   : std_logic;
   SIGNAL s_LOGISIM_NET_12                   : std_logic;
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
   SIGNAL s_LOGISIM_NET_23                   : std_logic;
   SIGNAL s_LOGISIM_NET_24                   : std_logic;
   SIGNAL s_LOGISIM_NET_25                   : std_logic;
   SIGNAL s_LOGISIM_NET_26                   : std_logic;
   SIGNAL s_LOGISIM_NET_27                   : std_logic;
   SIGNAL s_LOGISIM_NET_28                   : std_logic;
   SIGNAL s_LOGISIM_NET_29                   : std_logic;
   SIGNAL s_LOGISIM_NET_3                    : std_logic;
   SIGNAL s_LOGISIM_NET_30                   : std_logic;
   SIGNAL s_LOGISIM_NET_31                   : std_logic;
   SIGNAL s_LOGISIM_NET_32                   : std_logic;
   SIGNAL s_LOGISIM_NET_33                   : std_logic;
   SIGNAL s_LOGISIM_NET_34                   : std_logic;
   SIGNAL s_LOGISIM_NET_35                   : std_logic;
   SIGNAL s_LOGISIM_NET_4                    : std_logic;
   SIGNAL s_LOGISIM_NET_5                    : std_logic;
   SIGNAL s_LOGISIM_NET_6                    : std_logic;
   SIGNAL s_LOGISIM_NET_7                    : std_logic;
   SIGNAL s_LOGISIM_NET_8                    : std_logic;
   SIGNAL s_LOGISIM_NET_9                    : std_logic;

BEGIN

   -----------------------------------------------------------------------------
   -- Here all input connections are defined                                  --
   -----------------------------------------------------------------------------
   s_LOGISIM_NET_20                   <= Switch_14_Clock_Mode;
   s_LOGISIM_NET_21                   <= Switch_13_Clock_Step;
   s_LOGISIM_NET_23                   <= Switch_15_Main_Mode;
   s_LOGISIM_NET_1                    <= MASTER_CLOCK;
   s_LOGISIM_NET_16                   <= Halt;
   s_LOGISIM_NET_11                   <= Switch_12;
   s_LOGISIM_NET_0                    <= UART_Unhalt;

   -----------------------------------------------------------------------------
   -- Here all output connections are defined                                 --
   -----------------------------------------------------------------------------
   Main_Clock                         <= s_LOGISIM_NET_9;
   Inverse_Clock                      <= s_LOGISIM_NET_19;

   -----------------------------------------------------------------------------
   -- Here all in-lined components are defined                                --
   -----------------------------------------------------------------------------
   s_LOGISIM_NET_28 <= '0';

   s_LOGISIM_NET_27 <= '0';

   s_LOGISIM_NET_31 <= '0';

   s_LOGISIM_NET_30 <= '0';

   s_LOGISIM_NET_33 <= '0';

   s_LOGISIM_NET_32 <= '0';

   s_LOGISIM_NET_35 <= '0';

   s_LOGISIM_NET_34 <= '0';


   -----------------------------------------------------------------------------
   -- Here all normal components are defined                                  --
   -----------------------------------------------------------------------------
   GATE_1 : AND_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_23,
                 Input_2                            => s_LOGISIM_NET_9,
                 Result                             => s_LOGISIM_NET_5);

   GATE_2 : AND_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_20,
                 Input_2                            => s_LOGISIM_NET_6,
                 Result                             => s_LOGISIM_NET_14);

   GATE_3 : AND_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_21,
                 Input_2                            => s_LOGISIM_NET_6,
                 Result                             => s_LOGISIM_NET_15);

   GATE_4 : NOT_GATE
      PORT MAP ( Input_1                            => s_LOGISIM_NET_5,
                 Result                             => s_LOGISIM_NET_7);

   GATE_5 : NOT_GATE
      PORT MAP ( Input_1                            => s_LOGISIM_NET_26,
                 Result                             => s_LOGISIM_NET_24);

   GATE_6 : AND_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_14,
                 Input_2                            => s_LOGISIM_NET_7,
                 Result                             => s_LOGISIM_NET_4);

   GATE_7 : AND_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_15,
                 Input_2                            => s_LOGISIM_NET_7,
                 Result                             => s_LOGISIM_NET_2);

   GATE_8 : NOT_GATE
      PORT MAP ( Input_1                            => s_LOGISIM_NET_29,
                 Result                             => s_LOGISIM_NET_25);

   GATE_9 : AND_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_11,
                 Input_2                            => s_LOGISIM_NET_24,
                 Result                             => s_LOGISIM_NET_13);

   GATE_10 : AND_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_0,
                 Input_2                            => s_LOGISIM_NET_25,
                 Result                             => s_LOGISIM_NET_10);

   GATE_11 : AND_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_7,
                 Input_2                            => s_LOGISIM_NET_6,
                 Result                             => s_LOGISIM_NET_12);

   GATE_12 : OR_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_13,
                 Input_2                            => s_LOGISIM_NET_10,
                 Result                             => s_LOGISIM_NET_8);

   GATE_13 : AND_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_16,
                 Input_2                            => s_LOGISIM_NET_19,
                 Result                             => s_LOGISIM_NET_3);

   GATE_14 : NOT_GATE
      PORT MAP ( Input_1                            => s_LOGISIM_NET_2,
                 Result                             => s_LOGISIM_NET_22);

   MUX_1 : Multiplexer_2
      PORT MAP ( Enable                             => '1',
                 MuxIn_0                            => s_LOGISIM_NET_18,
                 MuxIn_1                            => s_LOGISIM_NET_22,
                 MuxOut                             => s_LOGISIM_NET_19,
                 Sel                                => s_LOGISIM_NET_4);

   MUX_2 : Multiplexer_2
      PORT MAP ( Enable                             => '1',
                 MuxIn_0                            => s_LOGISIM_NET_17,
                 MuxIn_1                            => s_LOGISIM_NET_2,
                 MuxOut                             => s_LOGISIM_NET_9,
                 Sel                                => s_LOGISIM_NET_4);

   FF_LATCH_1 : D_FLIPFLOP
      GENERIC MAP ( ActiveLevel                        => 1)
      PORT MAP ( Clock                              => LOGISIM_CLOCK_TREE_0(4),
                 D                                  => s_LOGISIM_NET_11,
                 Preset                             => s_LOGISIM_NET_28,
                 Q                                  => s_LOGISIM_NET_26,
                 Q_bar                              => OPEN,
                 Reset                              => s_LOGISIM_NET_27,
                 Tick                               => LOGISIM_CLOCK_TREE_0(2));

   FF_LATCH_2 : D_FLIPFLOP
      GENERIC MAP ( ActiveLevel                        => 1)
      PORT MAP ( Clock                              => LOGISIM_CLOCK_TREE_0(4),
                 D                                  => s_LOGISIM_NET_0,
                 Preset                             => s_LOGISIM_NET_31,
                 Q                                  => s_LOGISIM_NET_29,
                 Q_bar                              => OPEN,
                 Reset                              => s_LOGISIM_NET_30,
                 Tick                               => LOGISIM_CLOCK_TREE_0(2));

   FF_LATCH_3 : J_K_FLIPFLOP
      GENERIC MAP ( ActiveLevel                        => 1)
      PORT MAP ( Clock                              => LOGISIM_CLOCK_TREE_0(4),
                 J                                  => s_LOGISIM_NET_12,
                 K                                  => s_LOGISIM_NET_12,
                 Preset                             => s_LOGISIM_NET_33,
                 Q                                  => s_LOGISIM_NET_17,
                 Q_bar                              => s_LOGISIM_NET_18,
                 Reset                              => s_LOGISIM_NET_32,
                 Tick                               => LOGISIM_CLOCK_TREE_0(2));

   FF_LATCH_4 : S_R_FLIPFLOP
      GENERIC MAP ( ActiveLevel                        => 1)
      PORT MAP ( Clock                              => LOGISIM_CLOCK_TREE_0(4),
                 Preset                             => s_LOGISIM_NET_35,
                 Q                                  => OPEN,
                 Q_bar                              => s_LOGISIM_NET_6,
                 R                                  => s_LOGISIM_NET_8,
                 Reset                              => s_LOGISIM_NET_34,
                 S                                  => s_LOGISIM_NET_3,
                 Tick                               => LOGISIM_CLOCK_TREE_0(2));


END PlatformIndependent;
