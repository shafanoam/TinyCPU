--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : Register_8_Bit                                               ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE PlatformIndependent OF Register_8_Bit IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------
   COMPONENT AND_GATE
      GENERIC ( BubblesMask               : INTEGER);
      PORT ( Input_1                   : IN  std_logic;
             Input_2                   : IN  std_logic;
             Result                    : OUT std_logic);
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
   SIGNAL s_LOGISIM_BUS_2                    : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_5                    : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_7                    : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_NET_0                    : std_logic;
   SIGNAL s_LOGISIM_NET_1                    : std_logic;
   SIGNAL s_LOGISIM_NET_3                    : std_logic;
   SIGNAL s_LOGISIM_NET_4                    : std_logic;
   SIGNAL s_LOGISIM_NET_6                    : std_logic;
   SIGNAL s_LOGISIM_NET_8                    : std_logic;
   SIGNAL s_LOGISIM_NET_9                    : std_logic;

BEGIN

   -----------------------------------------------------------------------------
   -- Here all input connections are defined                                  --
   -----------------------------------------------------------------------------
   s_LOGISIM_NET_3                    <= OUT_control;
   s_LOGISIM_NET_0                    <= Main_Clock;
   s_LOGISIM_NET_4                    <= Master_Clock;
   s_LOGISIM_BUS_2(7 DOWNTO 0)        <= Value_In;
   s_LOGISIM_NET_6                    <= LOAD_control;

   -----------------------------------------------------------------------------
   -- Here all output connections are defined                                 --
   -----------------------------------------------------------------------------
   Value_Out                          <= s_LOGISIM_BUS_7(7 DOWNTO 0);
   Perma_Out                          <= s_LOGISIM_BUS_5(7 DOWNTO 0);

   -----------------------------------------------------------------------------
   -- Here all in-lined components are defined                                --
   -----------------------------------------------------------------------------
   s_LOGISIM_NET_9 <= '0';

   s_LOGISIM_BUS_7<= s_LOGISIM_BUS_5 WHEN s_LOGISIM_NET_8 = '1' ELSE (OTHERS => 'Z');

   -----------------------------------------------------------------------------
   -- Here all normal components are defined                                  --
   -----------------------------------------------------------------------------
   GATE_1 : AND_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_3,
                 Input_2                            => s_LOGISIM_NET_0,
                 Result                             => s_LOGISIM_NET_8);

   GATE_2 : AND_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_6,
                 Input_2                            => s_LOGISIM_NET_0,
                 Result                             => s_LOGISIM_NET_1);

   REGISTER_FILE_1 : REGISTER_FLIP_FLOP
      GENERIC MAP ( ActiveLevel                        => 1,
                    NrOfBits                           => 8)
      PORT MAP ( Clock                              => LOGISIM_CLOCK_TREE_0(4),
                 ClockEnable                        => s_LOGISIM_NET_1,
                 D                                  => s_LOGISIM_BUS_2(7 DOWNTO 0),
                 Q                                  => s_LOGISIM_BUS_5(7 DOWNTO 0),
                 Reset                              => s_LOGISIM_NET_9,
                 Tick                               => LOGISIM_CLOCK_TREE_0(2));


END PlatformIndependent;
