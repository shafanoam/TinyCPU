--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : Reg_Selector                                                 ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE PlatformIndependent OF Reg_Selector IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------
   COMPONENT OR_GATE
      GENERIC ( BubblesMask               : INTEGER);
      PORT ( Input_1                   : IN  std_logic;
             Input_2                   : IN  std_logic;
             Result                    : OUT std_logic);
   END COMPONENT;

   COMPONENT Demultiplexer_4
      PORT ( DemuxIn                   : IN  std_logic;
             Enable                    : IN  std_logic;
             Sel                       : IN  std_logic_vector( 1 DOWNTO 0 );
             DemuxOut_0                : OUT std_logic;
             DemuxOut_1                : OUT std_logic;
             DemuxOut_2                : OUT std_logic;
             DemuxOut_3                : OUT std_logic);
   END COMPONENT;


   -----------------------------------------------------------------------------
   -- Here all used signals are defined                                       --
   -----------------------------------------------------------------------------
   SIGNAL s_LOGISIM_BUS_5                    : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_LOGISIM_NET_0                    : std_logic;
   SIGNAL s_LOGISIM_NET_1                    : std_logic;
   SIGNAL s_LOGISIM_NET_10                   : std_logic;
   SIGNAL s_LOGISIM_NET_11                   : std_logic;
   SIGNAL s_LOGISIM_NET_12                   : std_logic;
   SIGNAL s_LOGISIM_NET_2                    : std_logic;
   SIGNAL s_LOGISIM_NET_3                    : std_logic;
   SIGNAL s_LOGISIM_NET_4                    : std_logic;
   SIGNAL s_LOGISIM_NET_6                    : std_logic;
   SIGNAL s_LOGISIM_NET_7                    : std_logic;
   SIGNAL s_LOGISIM_NET_8                    : std_logic;
   SIGNAL s_LOGISIM_NET_9                    : std_logic;

BEGIN

   -----------------------------------------------------------------------------
   -- Here all input connections are defined                                  --
   -----------------------------------------------------------------------------
   s_LOGISIM_NET_10                   <= LOAD_A_control;
   s_LOGISIM_BUS_5(1 DOWNTO 0)        <= Reg_Select;
   s_LOGISIM_NET_11                   <= CODED_REG_LOAD_control;
   s_LOGISIM_NET_12                   <= CODED_REG_OUT_control;

   -----------------------------------------------------------------------------
   -- Here all output connections are defined                                 --
   -----------------------------------------------------------------------------
   Load_A                             <= s_LOGISIM_NET_9;
   Out_A                              <= s_LOGISIM_NET_4;
   Load_B                             <= s_LOGISIM_NET_8;
   Out_B                              <= s_LOGISIM_NET_0;
   Load_C                             <= s_LOGISIM_NET_3;
   Out_C                              <= s_LOGISIM_NET_6;
   Load_D                             <= s_LOGISIM_NET_2;
   Out_D                              <= s_LOGISIM_NET_7;

   -----------------------------------------------------------------------------
   -- Here all normal components are defined                                  --
   -----------------------------------------------------------------------------
   GATE_1 : OR_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_1,
                 Input_2                            => s_LOGISIM_NET_10,
                 Result                             => s_LOGISIM_NET_9);

   DEMUX_1 : Demultiplexer_4
      PORT MAP ( DemuxIn                            => s_LOGISIM_NET_11,
                 DemuxOut_0                         => s_LOGISIM_NET_1,
                 DemuxOut_1                         => s_LOGISIM_NET_8,
                 DemuxOut_2                         => s_LOGISIM_NET_3,
                 DemuxOut_3                         => s_LOGISIM_NET_2,
                 Enable                             => '1',
                 Sel                                => s_LOGISIM_BUS_5(1 DOWNTO 0));

   DEMUX_2 : Demultiplexer_4
      PORT MAP ( DemuxIn                            => s_LOGISIM_NET_12,
                 DemuxOut_0                         => s_LOGISIM_NET_4,
                 DemuxOut_1                         => s_LOGISIM_NET_0,
                 DemuxOut_2                         => s_LOGISIM_NET_6,
                 DemuxOut_3                         => s_LOGISIM_NET_7,
                 Enable                             => '1',
                 Sel                                => s_LOGISIM_BUS_5(1 DOWNTO 0));


END PlatformIndependent;
