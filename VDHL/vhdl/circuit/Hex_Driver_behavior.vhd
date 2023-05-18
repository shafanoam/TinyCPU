--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : Hex_Driver                                                   ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE PlatformIndependent OF Hex_Driver IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------
   COMPONENT Multiplexer_bus_2
      GENERIC ( NrOfBits                  : INTEGER);
      PORT ( Enable                    : IN  std_logic;
             MuxIn_0                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             MuxIn_1                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             Sel                       : IN  std_logic;
             MuxOut                    : OUT std_logic_vector( (NrOfBits-1) DOWNTO 0 ));
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
   SIGNAL s_LOGISIM_BUS_1                    : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_4                    : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_5                    : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_LOGISIM_NET_0                    : std_logic;
   SIGNAL s_LOGISIM_NET_10                   : std_logic;
   SIGNAL s_LOGISIM_NET_11                   : std_logic;
   SIGNAL s_LOGISIM_NET_12                   : std_logic;
   SIGNAL s_LOGISIM_NET_13                   : std_logic;
   SIGNAL s_LOGISIM_NET_2                    : std_logic;
   SIGNAL s_LOGISIM_NET_3                    : std_logic;
   SIGNAL s_LOGISIM_NET_6                    : std_logic;
   SIGNAL s_LOGISIM_NET_8                    : std_logic;

BEGIN

   -----------------------------------------------------------------------------
   -- Here all input connections are defined                                  --
   -----------------------------------------------------------------------------
   s_LOGISIM_BUS_4(7 DOWNTO 0)        <= Data_In;
   s_LOGISIM_NET_8                    <= LOAD_control;
   s_LOGISIM_NET_2                    <= Master_clock;

   -----------------------------------------------------------------------------
   -- Here all output connections are defined                                 --
   -----------------------------------------------------------------------------
   Data_Out                           <= s_LOGISIM_BUS_5(3 DOWNTO 0);
   Digit_Select                       <= s_LOGISIM_NET_3;
   All_Out                            <= s_LOGISIM_BUS_1(7 DOWNTO 0);

   -----------------------------------------------------------------------------
   -- Here all in-lined components are defined                                --
   -----------------------------------------------------------------------------
   s_LOGISIM_NET_10 <= '0';

   s_LOGISIM_NET_6 <= '0';

   s_LOGISIM_NET_13 <= '1';

   s_LOGISIM_NET_12 <= '1';

   s_LOGISIM_NET_11 <= '0';


   -----------------------------------------------------------------------------
   -- Here all normal components are defined                                  --
   -----------------------------------------------------------------------------
   MUX_1 : Multiplexer_bus_2
      GENERIC MAP ( NrOfBits                           => 4)
      PORT MAP ( Enable                             => '1',
                 MuxIn_0                            => s_LOGISIM_BUS_1(3 DOWNTO 0),
                 MuxIn_1                            => s_LOGISIM_BUS_1(7 DOWNTO 4),
                 MuxOut                             => s_LOGISIM_BUS_5(3 DOWNTO 0),
                 Sel                                => s_LOGISIM_NET_3);

   REGISTER_FILE_1 : REGISTER_FLIP_FLOP
      GENERIC MAP ( ActiveLevel                        => 1,
                    NrOfBits                           => 8)
      PORT MAP ( Clock                              => LOGISIM_CLOCK_TREE_0(4),
                 ClockEnable                        => s_LOGISIM_NET_8,
                 D                                  => s_LOGISIM_BUS_4(7 DOWNTO 0),
                 Q                                  => s_LOGISIM_BUS_1(7 DOWNTO 0),
                 Reset                              => s_LOGISIM_NET_10,
                 Tick                               => LOGISIM_CLOCK_TREE_0(2));

   COUNTER_1 : LogisimCounter
      GENERIC MAP ( ClkEdge                            => 1,
                    max_val                            => 1,
                    mode                               => 0,
                    width                              => 1)
      PORT MAP ( ClockEnable                        => LOGISIM_CLOCK_TREE_0(2),
                 CompareOut                         => s_LOGISIM_NET_0,
                 CountValue(0)                      => s_LOGISIM_NET_3,
                 Enable                             => s_LOGISIM_NET_13,
                 GlobalClock                        => LOGISIM_CLOCK_TREE_0(4),
                 LoadData(0)                        => s_LOGISIM_NET_6,
                 Up_n_Down                          => s_LOGISIM_NET_12,
                 clear                              => s_LOGISIM_NET_11,
                 load                               => s_LOGISIM_NET_0);


END PlatformIndependent;
