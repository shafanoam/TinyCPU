--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : LogisimToplevelShell                                         ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE PlatformIndependent OF LogisimToplevelShell IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------
   COMPONENT LogisimTickGenerator
      GENERIC ( NrOfBits                  : INTEGER;
                ReloadValue               : INTEGER);
      PORT ( FPGAClock                 : IN  std_logic;
             FPGATick                  : OUT std_logic);
   END COMPONENT;

   COMPONENT LogisimClockComponent
      GENERIC ( NrOfBits                  : INTEGER;
                LowTicks                  : INTEGER;
                HighTicks                 : INTEGER);
      PORT ( ClockTick                 : IN  std_logic;
             GlobalClock               : IN  std_logic;
             ClockBus                  : OUT std_logic_vector( 4 DOWNTO 0 ));
   END COMPONENT;

   COMPONENT main
      PORT ( LOGISIM_CLOCK_TREE_0      : IN  std_logic_vector( 4 DOWNTO 0 );
             LOGISIM_INPUT_BUBBLES     : IN  std_logic_vector( 20 DOWNTO 0 );
             CURRENT_ADDRESS           : OUT std_logic_vector( 11 DOWNTO 0 );
             DATA_BUS                  : OUT std_logic_vector( 7 DOWNTO 0 );
             LOGISIM_OUTPUT_BUBBLES    : OUT std_logic_vector( 23 DOWNTO 0 );
             Output_1                  : OUT std_logic;
             Output_2                  : OUT std_logic;
             Output_bus_1              : OUT std_logic_vector( 11 DOWNTO 0 );
             Reg_Select_Bus            : OUT std_logic_vector( 1 DOWNTO 0 ));
   END COMPONENT;


   -----------------------------------------------------------------------------
   -- Here all used signals are defined                                       --
   -----------------------------------------------------------------------------
   SIGNAL s_CURRENT_ADDRESS                  : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_DATA_BUS                         : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_FPGA_Tick                        : std_logic;
   SIGNAL s_LOGISIM_CLOCK_TREE_0             : std_logic_vector( 4 DOWNTO 0 );
   SIGNAL s_LOGISIM_INPUT_BUBBLES            : std_logic_vector( 20 DOWNTO 0 );
   SIGNAL s_LOGISIM_OUTPUT_BUBBLES           : std_logic_vector( 23 DOWNTO 0 );
   SIGNAL s_Output_1                         : std_logic;
   SIGNAL s_Output_2                         : std_logic;
   SIGNAL s_Output_bus_1                     : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_Reg_Select_Bus                   : std_logic_vector( 1 DOWNTO 0 );

BEGIN
   -----------------------------------------------------------------------------
   -- Here all signal adaptations are performed                               --
   -----------------------------------------------------------------------------
   s_LOGISIM_INPUT_BUBBLES(5)            <= Main_Switches_sw_1;
   s_LOGISIM_INPUT_BUBBLES(6)            <= Main_Switches_sw_2;
   s_LOGISIM_INPUT_BUBBLES(7)            <= Main_Switches_sw_3;
   s_LOGISIM_INPUT_BUBBLES(8)            <= Main_Switches_sw_4;
   s_LOGISIM_INPUT_BUBBLES(9)            <= Main_Switches_sw_5;
   s_LOGISIM_INPUT_BUBBLES(10)           <= Main_Switches_sw_6;
   s_LOGISIM_INPUT_BUBBLES(11)           <= Main_Switches_sw_7;
   s_LOGISIM_INPUT_BUBBLES(12)           <= Main_Switches_sw_8;
   s_LOGISIM_INPUT_BUBBLES(13)           <= Main_Switches_sw_9;
   s_LOGISIM_INPUT_BUBBLES(14)           <= Main_Switches_sw_10;
   s_LOGISIM_INPUT_BUBBLES(15)           <= Main_Switches_sw_11;
   s_LOGISIM_INPUT_BUBBLES(16)           <= Main_Switches_sw_12;
   s_LOGISIM_INPUT_BUBBLES(17)           <= Main_Switches_sw_13;
   s_LOGISIM_INPUT_BUBBLES(18)           <= Main_Switches_sw_14;
   s_LOGISIM_INPUT_BUBBLES(19)           <= Main_Switches_sw_15;
   s_LOGISIM_INPUT_BUBBLES(20)           <= Main_Switches_sw_16;
 
   n_Output_1_0                          <= NOT s_Output_1;
 
   s_LOGISIM_INPUT_BUBBLES(1)            <= Button_2_0;
 
   s_LOGISIM_INPUT_BUBBLES(0)            <= Button_1_0;
 
   s_LOGISIM_INPUT_BUBBLES(3)            <= Button_4_0;
 
   s_LOGISIM_INPUT_BUBBLES(4)            <= Button_3_0;
 
   s_LOGISIM_INPUT_BUBBLES(2)            <= Button_5_0;
 
 
 
 
   n_Output_2_0                          <= NOT s_Output_2;
 
 
 
 
   n_Hex_Digit_Display_1_Segment_A       <= NOT s_LOGISIM_OUTPUT_BUBBLES(0);
   n_Hex_Digit_Display_1_Segment_B       <= NOT s_LOGISIM_OUTPUT_BUBBLES(1);
   n_Hex_Digit_Display_1_Segment_C       <= NOT s_LOGISIM_OUTPUT_BUBBLES(2);
   n_Hex_Digit_Display_1_Segment_D       <= NOT s_LOGISIM_OUTPUT_BUBBLES(3);
   n_Hex_Digit_Display_1_Segment_E       <= NOT s_LOGISIM_OUTPUT_BUBBLES(4);
   n_Hex_Digit_Display_1_Segment_F       <= NOT s_LOGISIM_OUTPUT_BUBBLES(5);
   n_Hex_Digit_Display_1_Segment_G       <= NOT s_LOGISIM_OUTPUT_BUBBLES(6);
   n_Hex_Digit_Display_1_DecimalPoint    <= NOT s_LOGISIM_OUTPUT_BUBBLES(7);
 
   -----------------------------------------------------------------------------
   -- Here the clock tree components are defined                              --
   -----------------------------------------------------------------------------
   LogisimTickGenerator_0 : LogisimTickGenerator
      GENERIC MAP ( NrOfBits                           => 18,
                    ReloadValue                        => 195312)
      PORT MAP ( FPGAClock                          => FPGA_GlobalClock,
                 FPGATick                           => s_FPGA_Tick);

   CLOCKGEN_0 : LogisimClockComponent
      GENERIC MAP ( HighTicks                          => 1,
                    LowTicks                           => 1,
                    NrOfBits                           => 1)
      PORT MAP ( ClockBus                           => s_LOGISIM_CLOCK_TREE_0,
                 ClockTick                          => s_FPGA_Tick,
                 GlobalClock                        => FPGA_GlobalClock);


   -----------------------------------------------------------------------------
   -- Here the toplevel component is connected                                --
   -----------------------------------------------------------------------------
   main_0 : main
      PORT MAP ( CURRENT_ADDRESS                    => s_CURRENT_ADDRESS,
                 DATA_BUS                           => s_DATA_BUS,
                 LOGISIM_CLOCK_TREE_0               => s_LOGISIM_CLOCK_TREE_0,
                 LOGISIM_INPUT_BUBBLES              => s_LOGISIM_INPUT_BUBBLES,
                 LOGISIM_OUTPUT_BUBBLES             => s_LOGISIM_OUTPUT_BUBBLES,
                 Output_1                           => s_Output_1,
                 Output_2                           => s_Output_2,
                 Output_bus_1                       => s_Output_bus_1,
                 Reg_Select_Bus                     => s_Reg_Select_Bus);

END PlatformIndependent;
