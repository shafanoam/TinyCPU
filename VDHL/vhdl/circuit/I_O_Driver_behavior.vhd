--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : I_O_Driver                                                   ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE PlatformIndependent OF I_O_Driver IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------
   COMPONENT NOT_GATE
      PORT ( Input_1                   : IN  std_logic;
             Result                    : OUT std_logic);
   END COMPONENT;

   COMPONENT AND_GATE
      GENERIC ( BubblesMask               : INTEGER);
      PORT ( Input_1                   : IN  std_logic;
             Input_2                   : IN  std_logic;
             Result                    : OUT std_logic);
   END COMPONENT;

   COMPONENT Comparator
      GENERIC ( TwosComplement            : INTEGER;
                NrOfBits                  : INTEGER);
      PORT ( DataA                     : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             DataB                     : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             A_EQ_B                    : OUT std_logic;
             A_GT_B                    : OUT std_logic;
             A_LT_B                    : OUT std_logic);
   END COMPONENT;


   -----------------------------------------------------------------------------
   -- Here all used signals are defined                                       --
   -----------------------------------------------------------------------------
   SIGNAL s_LOGISIM_BUS_13                   : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_14                   : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_5                    : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_7                    : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_LOGISIM_NET_0                    : std_logic;
   SIGNAL s_LOGISIM_NET_1                    : std_logic;
   SIGNAL s_LOGISIM_NET_10                   : std_logic;
   SIGNAL s_LOGISIM_NET_11                   : std_logic;
   SIGNAL s_LOGISIM_NET_12                   : std_logic;
   SIGNAL s_LOGISIM_NET_15                   : std_logic;
   SIGNAL s_LOGISIM_NET_2                    : std_logic;
   SIGNAL s_LOGISIM_NET_3                    : std_logic;
   SIGNAL s_LOGISIM_NET_4                    : std_logic;
   SIGNAL s_LOGISIM_NET_6                    : std_logic;
   SIGNAL s_LOGISIM_NET_8                    : std_logic;
   SIGNAL s_LOGISIM_NET_9                    : std_logic;

BEGIN

   -----------------------------------------------------------------------------
   -- Here all input connections are defined                                  --
   -----------------------------------------------------------------------------
   s_LOGISIM_BUS_14(7 DOWNTO 0)       <= RAM_DATA_IN;
   s_LOGISIM_NET_0                    <= RAM_LOAD_control;
   s_LOGISIM_NET_4                    <= RAM_STORE_control;
   s_LOGISIM_BUS_5(11 DOWNTO 0)       <= RAM_ADDRESS_IN;

   -----------------------------------------------------------------------------
   -- Here all output connections are defined                                 --
   -----------------------------------------------------------------------------
   HEX_WRITE                          <= s_LOGISIM_NET_6;
   SWITCH_BUTTON_READ                 <= s_LOGISIM_NET_15;
   RAM_ADRESS_OUT                     <= s_LOGISIM_BUS_5(11 DOWNTO 0);
   DATA_OUT                           <= s_LOGISIM_BUS_14(7 DOWNTO 0);
   RAM_LOAD_OUT                       <= s_LOGISIM_NET_8;
   RAM_STORE_OUT                      <= s_LOGISIM_NET_9;

   -----------------------------------------------------------------------------
   -- Here all in-lined components are defined                                --
   -----------------------------------------------------------------------------
   s_LOGISIM_BUS_7(11 DOWNTO 0) <= std_logic_vector(to_unsigned(4095,12));

   s_LOGISIM_BUS_13(11 DOWNTO 0) <= std_logic_vector(to_unsigned(4094,12));


   -----------------------------------------------------------------------------
   -- Here all normal components are defined                                  --
   -----------------------------------------------------------------------------
   GATE_1 : NOT_GATE
      PORT MAP ( Input_1                            => s_LOGISIM_NET_3,
                 Result                             => s_LOGISIM_NET_12);

   GATE_2 : AND_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_3,
                 Input_2                            => s_LOGISIM_NET_4,
                 Result                             => s_LOGISIM_NET_6);

   GATE_3 : AND_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_12,
                 Input_2                            => s_LOGISIM_NET_4,
                 Result                             => s_LOGISIM_NET_10);

   GATE_4 : AND_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_12,
                 Input_2                            => s_LOGISIM_NET_0,
                 Result                             => s_LOGISIM_NET_2);

   GATE_5 : NOT_GATE
      PORT MAP ( Input_1                            => s_LOGISIM_NET_1,
                 Result                             => s_LOGISIM_NET_11);

   GATE_6 : AND_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_1,
                 Input_2                            => s_LOGISIM_NET_2,
                 Result                             => s_LOGISIM_NET_15);

   GATE_7 : AND_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_11,
                 Input_2                            => s_LOGISIM_NET_2,
                 Result                             => s_LOGISIM_NET_8);

   GATE_8 : AND_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_11,
                 Input_2                            => s_LOGISIM_NET_10,
                 Result                             => s_LOGISIM_NET_9);

   Comparator_1 : Comparator
      GENERIC MAP ( NrOfBits                           => 12,
                    TwosComplement                     => 0)
      PORT MAP ( A_EQ_B                             => s_LOGISIM_NET_3,
                 A_GT_B                             => OPEN,
                 A_LT_B                             => OPEN,
                 DataA                              => s_LOGISIM_BUS_5(11 DOWNTO 0),
                 DataB                              => s_LOGISIM_BUS_7(11 DOWNTO 0));

   Comparator_2 : Comparator
      GENERIC MAP ( NrOfBits                           => 12,
                    TwosComplement                     => 0)
      PORT MAP ( A_EQ_B                             => s_LOGISIM_NET_1,
                 A_GT_B                             => OPEN,
                 A_LT_B                             => OPEN,
                 DataA                              => s_LOGISIM_BUS_5(11 DOWNTO 0),
                 DataB                              => s_LOGISIM_BUS_13(11 DOWNTO 0));


END PlatformIndependent;
