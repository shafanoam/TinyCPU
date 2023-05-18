--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : main                                                         ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE PlatformIndependent OF main IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------
   COMPONENT OR_GATE
      GENERIC ( BubblesMask               : INTEGER);
      PORT ( Input_1                   : IN  std_logic;
             Input_2                   : IN  std_logic;
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

   COMPONENT OR_GATE_BUS_9_INPUTS
      GENERIC ( BubblesMask               : INTEGER;
                NrOfBits                  : INTEGER);
      PORT ( Input_1                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             Input_2                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             Input_3                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             Input_4                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             Input_5                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             Input_6                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             Input_7                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             Input_8                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             Input_9                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             Result                    : OUT std_logic_vector( (NrOfBits-1) DOWNTO 0 ));
   END COMPONENT;

   COMPONENT NOT_GATE
      PORT ( Input_1                   : IN  std_logic;
             Result                    : OUT std_logic);
   END COMPONENT;

   COMPONENT OR_GATE_3_INPUTS
      GENERIC ( BubblesMask               : INTEGER);
      PORT ( Input_1                   : IN  std_logic;
             Input_2                   : IN  std_logic;
             Input_3                   : IN  std_logic;
             Result                    : OUT std_logic);
   END COMPONENT;

   COMPONENT OR_GATE_BUS_3_INPUTS
      GENERIC ( BubblesMask               : INTEGER;
                NrOfBits                  : INTEGER);
      PORT ( Input_1                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             Input_2                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             Input_3                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             Result                    : OUT std_logic_vector( (NrOfBits-1) DOWNTO 0 ));
   END COMPONENT;

   COMPONENT OR_GATE_BUS
      GENERIC ( BubblesMask               : INTEGER;
                NrOfBits                  : INTEGER);
      PORT ( Input_1                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             Input_2                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
             Result                    : OUT std_logic_vector( (NrOfBits-1) DOWNTO 0 ));
   END COMPONENT;

   COMPONENT Demultiplexer_2
      PORT ( DemuxIn                   : IN  std_logic;
             Enable                    : IN  std_logic;
             Sel                       : IN  std_logic;
             DemuxOut_0                : OUT std_logic;
             DemuxOut_1                : OUT std_logic);
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

   COMPONENT ROMCONTENTS_ROM_1
      PORT ( Address                   : IN  std_logic_vector( 6 DOWNTO 0 );
             Data                      : OUT std_logic_vector( 31 DOWNTO 0 ));
   END COMPONENT;

   COMPONENT RAMCONTENTS_CALL_STACK
      PORT ( Address                   : IN  std_logic_vector( 7 DOWNTO 0 );
             Clock                     : IN  std_logic;
             DataIn                    : IN  std_logic_vector( 11 DOWNTO 0 );
             OE                        : IN  std_logic;
             Tick                      : IN  std_logic;
             WE                        : IN  std_logic;
             DataOut                   : OUT std_logic_vector( 11 DOWNTO 0 ));
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

   COMPONENT RAMCONTENTS_MAIN_RAM
      PORT ( Address                   : IN  std_logic_vector( 11 DOWNTO 0 );
             Clock                     : IN  std_logic;
             DataIn                    : IN  std_logic_vector( 7 DOWNTO 0 );
             OE                        : IN  std_logic;
             Tick                      : IN  std_logic;
             WE                        : IN  std_logic;
             DataOut                   : OUT std_logic_vector( 7 DOWNTO 0 ));
   END COMPONENT;

   COMPONENT Arithmetic_Logic_Unit
      PORT ( Accummulator_In           : IN  std_logic_vector( 7 DOWNTO 0 );
             Data_In                   : IN  std_logic_vector( 7 DOWNTO 0 );
             FLAG_LATCH_control        : IN  std_logic;
             FUNCTION_LATCH_control    : IN  std_logic;
             FUNCTION_control          : IN  std_logic_vector( 2 DOWNTO 0 );
             LOAD_Control              : IN  std_logic;
             LOGISIM_CLOCK_TREE_0      : IN  std_logic_vector( 4 DOWNTO 0 );
             Main_Clock                : IN  std_logic;
             Master_Clock              : IN  std_logic;
             C_Flag                    : OUT std_logic;
             Result                    : OUT std_logic_vector( 7 DOWNTO 0 );
             Z_flag                    : OUT std_logic);
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

   COMPONENT Instruction_Register
      PORT ( LOAD_control              : IN  std_logic;
             LOGISIM_CLOCK_TREE_0      : IN  std_logic_vector( 4 DOWNTO 0 );
             Main_Clock                : IN  std_logic;
             Master_Clock              : IN  std_logic;
             REG1_OUT_control          : IN  std_logic;
             REG2_OUT_control          : IN  std_logic;
             Value_In                  : IN  std_logic_vector( 7 DOWNTO 0 );
             Out_To_Microcode_ROM      : OUT std_logic_vector( 3 DOWNTO 0 );
             Reg_Select                : OUT std_logic_vector( 1 DOWNTO 0 ));
   END COMPONENT;

   COMPONENT Increment_Decrement_Register_12_Bit
      PORT ( Decrement                 : IN  std_logic;
             Increment                 : IN  std_logic;
             LOAD_HIGH_Control         : IN  std_logic;
             LOAD_LOW_Control          : IN  std_logic;
             LOGISIM_CLOCK_TREE_0      : IN  std_logic_vector( 4 DOWNTO 0 );
             Main_Clock                : IN  std_logic;
             Master_Clock              : IN  std_logic;
             OUT_control               : IN  std_logic;
             Perma_Out                 : IN  std_logic;
             Value_In                  : IN  std_logic_vector( 7 DOWNTO 0 );
             Value_Out                 : OUT std_logic_vector( 11 DOWNTO 0 ));
   END COMPONENT;

   COMPONENT Hex_Driver
      PORT ( Data_In                   : IN  std_logic_vector( 7 DOWNTO 0 );
             LOAD_control              : IN  std_logic;
             LOGISIM_CLOCK_TREE_0      : IN  std_logic_vector( 4 DOWNTO 0 );
             Master_clock              : IN  std_logic;
             All_Out                   : OUT std_logic_vector( 7 DOWNTO 0 );
             Data_Out                  : OUT std_logic_vector( 3 DOWNTO 0 );
             Digit_Select              : OUT std_logic);
   END COMPONENT;

   COMPONENT I_O_Driver
      PORT ( LOGISIM_CLOCK_TREE_0      : IN  std_logic_vector( 4 DOWNTO 0 );
             RAM_ADDRESS_IN            : IN  std_logic_vector( 11 DOWNTO 0 );
             RAM_DATA_IN               : IN  std_logic_vector( 7 DOWNTO 0 );
             RAM_LOAD_control          : IN  std_logic;
             RAM_STORE_control         : IN  std_logic;
             DATA_OUT                  : OUT std_logic_vector( 7 DOWNTO 0 );
             HEX_WRITE                 : OUT std_logic;
             RAM_ADRESS_OUT            : OUT std_logic_vector( 11 DOWNTO 0 );
             RAM_LOAD_OUT              : OUT std_logic;
             RAM_STORE_OUT             : OUT std_logic;
             SWITCH_BUTTON_READ        : OUT std_logic);
   END COMPONENT;

   COMPONENT clock_unit
      PORT ( Halt                      : IN  std_logic;
             LOGISIM_CLOCK_TREE_0      : IN  std_logic_vector( 4 DOWNTO 0 );
             MASTER_CLOCK              : IN  std_logic;
             Switch_12                 : IN  std_logic;
             Switch_13_Clock_Step      : IN  std_logic;
             Switch_14_Clock_Mode      : IN  std_logic;
             Switch_15_Main_Mode       : IN  std_logic;
             UART_Unhalt               : IN  std_logic;
             Inverse_Clock             : OUT std_logic;
             Main_Clock                : OUT std_logic);
   END COMPONENT;

   COMPONENT Reg_Selector
      PORT ( CODED_REG_LOAD_control    : IN  std_logic;
             CODED_REG_OUT_control     : IN  std_logic;
             LOAD_A_control            : IN  std_logic;
             LOGISIM_CLOCK_TREE_0      : IN  std_logic_vector( 4 DOWNTO 0 );
             Reg_Select                : IN  std_logic_vector( 1 DOWNTO 0 );
             Load_A                    : OUT std_logic;
             Load_B                    : OUT std_logic;
             Load_C                    : OUT std_logic;
             Load_D                    : OUT std_logic;
             Out_A                     : OUT std_logic;
             Out_B                     : OUT std_logic;
             Out_C                     : OUT std_logic;
             Out_D                     : OUT std_logic);
   END COMPONENT;


   -----------------------------------------------------------------------------
   -- Here all used signals are defined                                       --
   -----------------------------------------------------------------------------
   SIGNAL s_LOGISIM_BUS_1                    : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_108                  : std_logic_vector( 2 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_110                  : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_111                  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_113                  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_121                  : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_122                  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_124                  : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_126                  : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_128                  : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_129                  : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_132                  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_138                  : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_139                  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_14                   : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_141                  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_143                  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_146                  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_15                   : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_150                  : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_162                  : std_logic_vector( 6 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_163                  : std_logic_vector( 31 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_175                  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_178                  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_20                   : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_21                   : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_22                   : std_logic_vector( 2 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_23                   : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_24                   : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_25                   : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_38                   : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_41                   : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_42                   : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_43                   : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_48                   : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_49                   : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_50                   : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_51                   : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_54                   : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_57                   : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_58                   : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_59                   : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_60                   : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_65                   : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_73                   : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_75                   : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_78                   : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_8                    : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_82                   : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_83                   : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_85                   : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_87                   : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_88                   : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_91                   : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_92                   : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_96                   : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_97                   : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_LOGISIM_NET_0                    : std_logic;
   SIGNAL s_LOGISIM_NET_100                  : std_logic;
   SIGNAL s_LOGISIM_NET_101                  : std_logic;
   SIGNAL s_LOGISIM_NET_102                  : std_logic;
   SIGNAL s_LOGISIM_NET_104                  : std_logic;
   SIGNAL s_LOGISIM_NET_105                  : std_logic;
   SIGNAL s_LOGISIM_NET_106                  : std_logic;
   SIGNAL s_LOGISIM_NET_107                  : std_logic;
   SIGNAL s_LOGISIM_NET_109                  : std_logic;
   SIGNAL s_LOGISIM_NET_11                   : std_logic;
   SIGNAL s_LOGISIM_NET_112                  : std_logic;
   SIGNAL s_LOGISIM_NET_115                  : std_logic;
   SIGNAL s_LOGISIM_NET_116                  : std_logic;
   SIGNAL s_LOGISIM_NET_119                  : std_logic;
   SIGNAL s_LOGISIM_NET_12                   : std_logic;
   SIGNAL s_LOGISIM_NET_120                  : std_logic;
   SIGNAL s_LOGISIM_NET_13                   : std_logic;
   SIGNAL s_LOGISIM_NET_130                  : std_logic;
   SIGNAL s_LOGISIM_NET_131                  : std_logic;
   SIGNAL s_LOGISIM_NET_133                  : std_logic;
   SIGNAL s_LOGISIM_NET_134                  : std_logic;
   SIGNAL s_LOGISIM_NET_135                  : std_logic;
   SIGNAL s_LOGISIM_NET_140                  : std_logic;
   SIGNAL s_LOGISIM_NET_142                  : std_logic;
   SIGNAL s_LOGISIM_NET_145                  : std_logic;
   SIGNAL s_LOGISIM_NET_147                  : std_logic;
   SIGNAL s_LOGISIM_NET_149                  : std_logic;
   SIGNAL s_LOGISIM_NET_153                  : std_logic;
   SIGNAL s_LOGISIM_NET_155                  : std_logic;
   SIGNAL s_LOGISIM_NET_156                  : std_logic;
   SIGNAL s_LOGISIM_NET_158                  : std_logic;
   SIGNAL s_LOGISIM_NET_159                  : std_logic;
   SIGNAL s_LOGISIM_NET_16                   : std_logic;
   SIGNAL s_LOGISIM_NET_160                  : std_logic;
   SIGNAL s_LOGISIM_NET_161                  : std_logic;
   SIGNAL s_LOGISIM_NET_164                  : std_logic;
   SIGNAL s_LOGISIM_NET_165                  : std_logic;
   SIGNAL s_LOGISIM_NET_166                  : std_logic;
   SIGNAL s_LOGISIM_NET_167                  : std_logic;
   SIGNAL s_LOGISIM_NET_168                  : std_logic;
   SIGNAL s_LOGISIM_NET_169                  : std_logic;
   SIGNAL s_LOGISIM_NET_17                   : std_logic;
   SIGNAL s_LOGISIM_NET_170                  : std_logic;
   SIGNAL s_LOGISIM_NET_171                  : std_logic;
   SIGNAL s_LOGISIM_NET_172                  : std_logic;
   SIGNAL s_LOGISIM_NET_173                  : std_logic;
   SIGNAL s_LOGISIM_NET_174                  : std_logic;
   SIGNAL s_LOGISIM_NET_176                  : std_logic;
   SIGNAL s_LOGISIM_NET_177                  : std_logic;
   SIGNAL s_LOGISIM_NET_179                  : std_logic;
   SIGNAL s_LOGISIM_NET_19                   : std_logic;
   SIGNAL s_LOGISIM_NET_2                    : std_logic;
   SIGNAL s_LOGISIM_NET_27                   : std_logic;
   SIGNAL s_LOGISIM_NET_28                   : std_logic;
   SIGNAL s_LOGISIM_NET_29                   : std_logic;
   SIGNAL s_LOGISIM_NET_3                    : std_logic;
   SIGNAL s_LOGISIM_NET_32                   : std_logic;
   SIGNAL s_LOGISIM_NET_35                   : std_logic;
   SIGNAL s_LOGISIM_NET_36                   : std_logic;
   SIGNAL s_LOGISIM_NET_37                   : std_logic;
   SIGNAL s_LOGISIM_NET_4                    : std_logic;
   SIGNAL s_LOGISIM_NET_40                   : std_logic;
   SIGNAL s_LOGISIM_NET_44                   : std_logic;
   SIGNAL s_LOGISIM_NET_45                   : std_logic;
   SIGNAL s_LOGISIM_NET_47                   : std_logic;
   SIGNAL s_LOGISIM_NET_5                    : std_logic;
   SIGNAL s_LOGISIM_NET_55                   : std_logic;
   SIGNAL s_LOGISIM_NET_6                    : std_logic;
   SIGNAL s_LOGISIM_NET_61                   : std_logic;
   SIGNAL s_LOGISIM_NET_62                   : std_logic;
   SIGNAL s_LOGISIM_NET_63                   : std_logic;
   SIGNAL s_LOGISIM_NET_66                   : std_logic;
   SIGNAL s_LOGISIM_NET_68                   : std_logic;
   SIGNAL s_LOGISIM_NET_71                   : std_logic;
   SIGNAL s_LOGISIM_NET_72                   : std_logic;
   SIGNAL s_LOGISIM_NET_76                   : std_logic;
   SIGNAL s_LOGISIM_NET_77                   : std_logic;
   SIGNAL s_LOGISIM_NET_79                   : std_logic;
   SIGNAL s_LOGISIM_NET_89                   : std_logic;
   SIGNAL s_LOGISIM_NET_9                    : std_logic;
   SIGNAL s_LOGISIM_NET_93                   : std_logic;
   SIGNAL s_LOGISIM_NET_98                   : std_logic;
   SIGNAL s_LOGISIM_NET_99                   : std_logic;

BEGIN

   -----------------------------------------------------------------------------
   -- Here all clock generator connections are defined                        --
   -----------------------------------------------------------------------------
   s_LOGISIM_NET_0                    <= LOGISIM_CLOCK_TREE_0(0);

   -----------------------------------------------------------------------------
   -- Here all wiring is defined                                              --
   -----------------------------------------------------------------------------
   s_LOGISIM_BUS_122(6)               <= s_LOGISIM_NET_2;
   s_LOGISIM_BUS_110(6)               <= s_LOGISIM_NET_2;
   s_LOGISIM_NET_4                    <= s_LOGISIM_BUS_163(10);
   s_LOGISIM_BUS_15(0)                <= s_LOGISIM_NET_4;
   s_LOGISIM_BUS_15(1)                <= s_LOGISIM_NET_4;
   s_LOGISIM_BUS_15(2)                <= s_LOGISIM_NET_4;
   s_LOGISIM_BUS_15(3)                <= s_LOGISIM_NET_4;
   s_LOGISIM_BUS_15(4)                <= s_LOGISIM_NET_4;
   s_LOGISIM_BUS_15(5)                <= s_LOGISIM_NET_4;
   s_LOGISIM_BUS_15(6)                <= s_LOGISIM_NET_4;
   s_LOGISIM_BUS_15(7)                <= s_LOGISIM_NET_4;
   s_LOGISIM_NET_9                    <= s_LOGISIM_BUS_163(3);
   s_LOGISIM_BUS_14(0)                <= s_LOGISIM_NET_9;
   s_LOGISIM_BUS_14(1)                <= s_LOGISIM_NET_9;
   s_LOGISIM_BUS_14(2)                <= s_LOGISIM_NET_9;
   s_LOGISIM_BUS_14(3)                <= s_LOGISIM_NET_9;
   s_LOGISIM_BUS_14(4)                <= s_LOGISIM_NET_9;
   s_LOGISIM_BUS_14(5)                <= s_LOGISIM_NET_9;
   s_LOGISIM_BUS_14(6)                <= s_LOGISIM_NET_9;
   s_LOGISIM_BUS_14(7)                <= s_LOGISIM_NET_9;
   s_LOGISIM_NET_11                   <= s_LOGISIM_BUS_163(15);
   s_LOGISIM_BUS_78(0)                <= s_LOGISIM_NET_11;
   s_LOGISIM_BUS_78(1)                <= s_LOGISIM_NET_11;
   s_LOGISIM_BUS_78(2)                <= s_LOGISIM_NET_11;
   s_LOGISIM_BUS_78(3)                <= s_LOGISIM_NET_11;
   s_LOGISIM_BUS_78(4)                <= s_LOGISIM_NET_11;
   s_LOGISIM_BUS_78(5)                <= s_LOGISIM_NET_11;
   s_LOGISIM_BUS_78(6)                <= s_LOGISIM_NET_11;
   s_LOGISIM_BUS_78(7)                <= s_LOGISIM_NET_11;
   s_LOGISIM_BUS_78(8)                <= s_LOGISIM_NET_11;
   s_LOGISIM_BUS_78(9)                <= s_LOGISIM_NET_11;
   s_LOGISIM_BUS_78(10)               <= s_LOGISIM_NET_11;
   s_LOGISIM_BUS_78(11)               <= s_LOGISIM_NET_11;
   s_LOGISIM_BUS_113(0)               <= s_LOGISIM_NET_12;
   s_LOGISIM_BUS_113(1)               <= s_LOGISIM_NET_12;
   s_LOGISIM_BUS_113(2)               <= s_LOGISIM_NET_12;
   s_LOGISIM_BUS_113(3)               <= s_LOGISIM_NET_12;
   s_LOGISIM_BUS_113(4)               <= s_LOGISIM_NET_12;
   s_LOGISIM_BUS_113(5)               <= s_LOGISIM_NET_12;
   s_LOGISIM_BUS_113(6)               <= s_LOGISIM_NET_12;
   s_LOGISIM_BUS_113(7)               <= s_LOGISIM_NET_12;
   s_LOGISIM_BUS_59(0)                <= s_LOGISIM_NET_13;
   s_LOGISIM_BUS_59(1)                <= s_LOGISIM_NET_13;
   s_LOGISIM_BUS_59(2)                <= s_LOGISIM_NET_13;
   s_LOGISIM_BUS_59(3)                <= s_LOGISIM_NET_13;
   s_LOGISIM_BUS_59(4)                <= s_LOGISIM_NET_13;
   s_LOGISIM_BUS_59(5)                <= s_LOGISIM_NET_13;
   s_LOGISIM_BUS_59(6)                <= s_LOGISIM_NET_13;
   s_LOGISIM_BUS_59(7)                <= s_LOGISIM_NET_13;
   s_LOGISIM_BUS_111(0)               <= s_LOGISIM_NET_16;
   s_LOGISIM_BUS_111(1)               <= s_LOGISIM_NET_16;
   s_LOGISIM_BUS_111(2)               <= s_LOGISIM_NET_16;
   s_LOGISIM_BUS_111(3)               <= s_LOGISIM_NET_16;
   s_LOGISIM_BUS_111(4)               <= s_LOGISIM_NET_16;
   s_LOGISIM_BUS_111(5)               <= s_LOGISIM_NET_16;
   s_LOGISIM_BUS_111(6)               <= s_LOGISIM_NET_16;
   s_LOGISIM_BUS_111(7)               <= s_LOGISIM_NET_16;
   s_LOGISIM_BUS_57(0)                <= s_LOGISIM_NET_17;
   s_LOGISIM_BUS_57(1)                <= s_LOGISIM_NET_17;
   s_LOGISIM_BUS_57(2)                <= s_LOGISIM_NET_17;
   s_LOGISIM_BUS_57(3)                <= s_LOGISIM_NET_17;
   s_LOGISIM_BUS_57(4)                <= s_LOGISIM_NET_17;
   s_LOGISIM_BUS_57(5)                <= s_LOGISIM_NET_17;
   s_LOGISIM_BUS_57(6)                <= s_LOGISIM_NET_17;
   s_LOGISIM_BUS_57(7)                <= s_LOGISIM_NET_17;
   s_LOGISIM_BUS_122(1)               <= s_LOGISIM_NET_27;
   s_LOGISIM_BUS_110(1)               <= s_LOGISIM_NET_27;
   s_LOGISIM_BUS_20(0)                <= s_LOGISIM_NET_28;
   s_LOGISIM_BUS_20(1)                <= s_LOGISIM_NET_28;
   s_LOGISIM_BUS_20(2)                <= s_LOGISIM_NET_28;
   s_LOGISIM_BUS_20(3)                <= s_LOGISIM_NET_28;
   s_LOGISIM_BUS_20(4)                <= s_LOGISIM_NET_28;
   s_LOGISIM_BUS_20(5)                <= s_LOGISIM_NET_28;
   s_LOGISIM_BUS_20(6)                <= s_LOGISIM_NET_28;
   s_LOGISIM_BUS_20(7)                <= s_LOGISIM_NET_28;
   s_LOGISIM_BUS_91(0)                <= s_LOGISIM_NET_28;
   s_LOGISIM_BUS_91(1)                <= s_LOGISIM_NET_28;
   s_LOGISIM_BUS_91(2)                <= s_LOGISIM_NET_28;
   s_LOGISIM_BUS_91(3)                <= s_LOGISIM_NET_28;
   s_LOGISIM_BUS_91(4)                <= s_LOGISIM_NET_28;
   s_LOGISIM_BUS_91(5)                <= s_LOGISIM_NET_28;
   s_LOGISIM_BUS_91(6)                <= s_LOGISIM_NET_28;
   s_LOGISIM_BUS_91(7)                <= s_LOGISIM_NET_28;
   s_LOGISIM_BUS_91(8)                <= s_LOGISIM_NET_28;
   s_LOGISIM_BUS_91(9)                <= s_LOGISIM_NET_28;
   s_LOGISIM_BUS_91(10)               <= s_LOGISIM_NET_28;
   s_LOGISIM_BUS_91(11)               <= s_LOGISIM_NET_28;
   s_LOGISIM_NET_35                   <= s_LOGISIM_BUS_163(26);
   s_LOGISIM_BUS_126(0)               <= s_LOGISIM_NET_35;
   s_LOGISIM_BUS_126(1)               <= s_LOGISIM_NET_35;
   s_LOGISIM_BUS_126(2)               <= s_LOGISIM_NET_35;
   s_LOGISIM_BUS_126(3)               <= s_LOGISIM_NET_35;
   s_LOGISIM_BUS_126(4)               <= s_LOGISIM_NET_35;
   s_LOGISIM_BUS_126(5)               <= s_LOGISIM_NET_35;
   s_LOGISIM_BUS_126(6)               <= s_LOGISIM_NET_35;
   s_LOGISIM_BUS_126(7)               <= s_LOGISIM_NET_35;
   s_LOGISIM_BUS_126(8)               <= s_LOGISIM_NET_35;
   s_LOGISIM_BUS_126(9)               <= s_LOGISIM_NET_35;
   s_LOGISIM_BUS_126(10)              <= s_LOGISIM_NET_35;
   s_LOGISIM_BUS_126(11)              <= s_LOGISIM_NET_35;
   s_LOGISIM_BUS_138(0)               <= s_LOGISIM_NET_36;
   s_LOGISIM_BUS_138(1)               <= s_LOGISIM_NET_36;
   s_LOGISIM_BUS_138(2)               <= s_LOGISIM_NET_36;
   s_LOGISIM_BUS_138(3)               <= s_LOGISIM_NET_36;
   s_LOGISIM_BUS_138(4)               <= s_LOGISIM_NET_36;
   s_LOGISIM_BUS_138(5)               <= s_LOGISIM_NET_36;
   s_LOGISIM_BUS_138(6)               <= s_LOGISIM_NET_36;
   s_LOGISIM_BUS_138(7)               <= s_LOGISIM_NET_36;
   s_LOGISIM_BUS_138(8)               <= s_LOGISIM_NET_36;
   s_LOGISIM_BUS_138(9)               <= s_LOGISIM_NET_36;
   s_LOGISIM_BUS_138(10)              <= s_LOGISIM_NET_36;
   s_LOGISIM_BUS_138(11)              <= s_LOGISIM_NET_36;
   s_LOGISIM_BUS_122(3)               <= s_LOGISIM_NET_40;
   s_LOGISIM_BUS_110(3)               <= s_LOGISIM_NET_40;
   s_LOGISIM_BUS_96(0)                <= s_LOGISIM_NET_45;
   s_LOGISIM_BUS_96(1)                <= s_LOGISIM_NET_45;
   s_LOGISIM_BUS_96(2)                <= s_LOGISIM_NET_45;
   s_LOGISIM_BUS_96(3)                <= s_LOGISIM_NET_45;
   s_LOGISIM_BUS_96(4)                <= s_LOGISIM_NET_45;
   s_LOGISIM_BUS_96(5)                <= s_LOGISIM_NET_45;
   s_LOGISIM_BUS_96(6)                <= s_LOGISIM_NET_45;
   s_LOGISIM_BUS_96(7)                <= s_LOGISIM_NET_45;
   s_LOGISIM_BUS_97(0)                <= s_LOGISIM_NET_47;
   s_LOGISIM_BUS_97(1)                <= s_LOGISIM_NET_47;
   s_LOGISIM_BUS_97(2)                <= s_LOGISIM_NET_47;
   s_LOGISIM_BUS_97(3)                <= s_LOGISIM_NET_47;
   s_LOGISIM_BUS_97(4)                <= s_LOGISIM_NET_47;
   s_LOGISIM_BUS_97(5)                <= s_LOGISIM_NET_47;
   s_LOGISIM_BUS_97(6)                <= s_LOGISIM_NET_47;
   s_LOGISIM_BUS_97(7)                <= s_LOGISIM_NET_47;
   s_LOGISIM_BUS_124(0)               <= s_LOGISIM_NET_62;
   s_LOGISIM_BUS_124(1)               <= s_LOGISIM_NET_62;
   s_LOGISIM_BUS_124(2)               <= s_LOGISIM_NET_62;
   s_LOGISIM_BUS_124(3)               <= s_LOGISIM_NET_62;
   s_LOGISIM_BUS_124(4)               <= s_LOGISIM_NET_62;
   s_LOGISIM_BUS_124(5)               <= s_LOGISIM_NET_62;
   s_LOGISIM_BUS_124(6)               <= s_LOGISIM_NET_62;
   s_LOGISIM_BUS_124(7)               <= s_LOGISIM_NET_62;
   s_LOGISIM_BUS_124(8)               <= s_LOGISIM_NET_62;
   s_LOGISIM_BUS_124(9)               <= s_LOGISIM_NET_62;
   s_LOGISIM_BUS_124(10)              <= s_LOGISIM_NET_62;
   s_LOGISIM_BUS_124(11)              <= s_LOGISIM_NET_62;
   s_LOGISIM_BUS_122(0)               <= s_LOGISIM_NET_63;
   s_LOGISIM_BUS_110(0)               <= s_LOGISIM_NET_63;
   s_LOGISIM_NET_99                   <= s_LOGISIM_BUS_163(5);
   s_LOGISIM_BUS_108(1)               <= s_LOGISIM_NET_99;
   s_LOGISIM_BUS_122(5)               <= s_LOGISIM_NET_104;
   s_LOGISIM_BUS_110(5)               <= s_LOGISIM_NET_104;
   s_LOGISIM_BUS_122(7)               <= s_LOGISIM_NET_107;
   s_LOGISIM_BUS_110(7)               <= s_LOGISIM_NET_107;
   s_LOGISIM_BUS_122(2)               <= s_LOGISIM_NET_112;
   s_LOGISIM_BUS_110(2)               <= s_LOGISIM_NET_112;
   s_LOGISIM_BUS_122(4)               <= s_LOGISIM_NET_116;
   s_LOGISIM_BUS_110(4)               <= s_LOGISIM_NET_116;
   s_LOGISIM_BUS_85(5)                <= s_LOGISIM_NET_134;
   s_LOGISIM_BUS_85(6)                <= s_LOGISIM_NET_134;
   s_LOGISIM_BUS_85(7)                <= s_LOGISIM_NET_134;
   s_LOGISIM_NET_145                  <= s_LOGISIM_BUS_163(4);
   s_LOGISIM_BUS_108(0)               <= s_LOGISIM_NET_145;
   s_LOGISIM_NET_153                  <= s_LOGISIM_BUS_163(6);
   s_LOGISIM_BUS_108(2)               <= s_LOGISIM_NET_153;

   -----------------------------------------------------------------------------
   -- Here all output connections are defined                                 --
   -----------------------------------------------------------------------------
   DATA_BUS                           <= s_LOGISIM_BUS_24(7 DOWNTO 0);
   Output_bus_1                       <= s_LOGISIM_BUS_51(11 DOWNTO 0);
   Output_1                           <= s_LOGISIM_NET_32;
   Output_2                           <= s_LOGISIM_NET_119;
   CURRENT_ADDRESS                    <= s_LOGISIM_BUS_121(11 DOWNTO 0);
   Reg_Select_Bus                     <= s_LOGISIM_BUS_21(1 DOWNTO 0);

   -----------------------------------------------------------------------------
   -- Here all in-lined components are defined                                --
   -----------------------------------------------------------------------------
   s_LOGISIM_NET_169 <= '0';

   s_LOGISIM_NET_170 <= '0';

   s_LOGISIM_NET_171 <= '0';

   s_LOGISIM_NET_172 <= '0';

   s_LOGISIM_NET_173 <= '0';

   s_LOGISIM_BUS_22(2 DOWNTO 0) <= std_logic_vector(to_unsigned(0,3));

   s_LOGISIM_NET_161 <= '1';

   s_LOGISIM_NET_160 <= '0';

   s_LOGISIM_NET_120 <= '0';

   s_LOGISIM_NET_177 <= '1';

   s_LOGISIM_NET_164 <= '1';

   s_LOGISIM_NET_174 <= '0';

   s_LOGISIM_BUS_175(7 DOWNTO 0) <= std_logic_vector(to_unsigned(0,8));

   s_LOGISIM_NET_176 <= '1';

   s_LOGISIM_NET_19 <= '0';

   s_LOGISIM_NET_134 <= '0';

   s_LOGISIM_NET_166 <= '0';

   s_LOGISIM_NET_167 <= '0';

   s_LOGISIM_NET_168 <= '0';

   s_LOGISIM_NET_165 <= '0';

   s_LOGISIM_NET_179 <= '0';

   s_LOGISIM_NET_155 <= '1';

   s_LOGISIM_BUS_85(0) <= LOGISIM_INPUT_BUBBLES(0);
   s_LOGISIM_BUS_85(1) <= LOGISIM_INPUT_BUBBLES(1);
   s_LOGISIM_BUS_85(4) <= LOGISIM_INPUT_BUBBLES(2);
   s_LOGISIM_BUS_85(3) <= LOGISIM_INPUT_BUBBLES(3);
   s_LOGISIM_BUS_85(2) <= LOGISIM_INPUT_BUBBLES(4);
   s_LOGISIM_NET_28 <= LOGISIM_INPUT_BUBBLES(5);
   s_LOGISIM_NET_79 <= LOGISIM_INPUT_BUBBLES(6);
   s_LOGISIM_NET_71 <= LOGISIM_INPUT_BUBBLES(7);
   s_LOGISIM_NET_3 <= LOGISIM_INPUT_BUBBLES(8);
   s_LOGISIM_BUS_110(11) <= LOGISIM_INPUT_BUBBLES(9);
   s_LOGISIM_BUS_110(10) <= LOGISIM_INPUT_BUBBLES(10);
   s_LOGISIM_BUS_110(9) <= LOGISIM_INPUT_BUBBLES(11);
   s_LOGISIM_BUS_110(8) <= LOGISIM_INPUT_BUBBLES(12);
   s_LOGISIM_NET_107 <= LOGISIM_INPUT_BUBBLES(13);
   s_LOGISIM_NET_2 <= LOGISIM_INPUT_BUBBLES(14);
   s_LOGISIM_NET_104 <= LOGISIM_INPUT_BUBBLES(15);
   s_LOGISIM_NET_116 <= LOGISIM_INPUT_BUBBLES(16);
   s_LOGISIM_NET_40 <= LOGISIM_INPUT_BUBBLES(17);
   s_LOGISIM_NET_112 <= LOGISIM_INPUT_BUBBLES(18);
   s_LOGISIM_NET_27 <= LOGISIM_INPUT_BUBBLES(19);
   s_LOGISIM_NET_63 <= LOGISIM_INPUT_BUBBLES(20);
 
   WITH (s_LOGISIM_BUS_150) SELECT LOGISIM_OUTPUT_BUBBLES( 6 DOWNTO 0) <= 
      "0111111" WHEN "0000",
      "0000110" WHEN "0001",
      "1011011" WHEN "0010",
      "1001111" WHEN "0011",
      "1100110" WHEN "0100",
      "1101101" WHEN "0101",
      "1111101" WHEN "0110",
      "0000111" WHEN "0111",
      "1111111" WHEN "1000",
      "1100111" WHEN "1001",
      "1110111" WHEN "1010",
      "1111100" WHEN "1011",
      "0111001" WHEN "1100",
      "1011110" WHEN "1101",
      "1111001" WHEN "1110",
      "1110001" WHEN OTHERS;
   LOGISIM_OUTPUT_BUBBLES(7) <= s_LOGISIM_NET_166;
 
   WITH (s_LOGISIM_BUS_178) SELECT LOGISIM_OUTPUT_BUBBLES( 14 DOWNTO 8) <= 
      "0111111" WHEN "0000",
      "0000110" WHEN "0001",
      "1011011" WHEN "0010",
      "1001111" WHEN "0011",
      "1100110" WHEN "0100",
      "1101101" WHEN "0101",
      "1111101" WHEN "0110",
      "0000111" WHEN "0111",
      "1111111" WHEN "1000",
      "1100111" WHEN "1001",
      "1110111" WHEN "1010",
      "1111100" WHEN "1011",
      "0111001" WHEN "1100",
      "1011110" WHEN "1101",
      "1111001" WHEN "1110",
      "1110001" WHEN OTHERS;
   LOGISIM_OUTPUT_BUBBLES(15) <= s_LOGISIM_NET_167;
 
   WITH (s_LOGISIM_BUS_178) SELECT LOGISIM_OUTPUT_BUBBLES( 22 DOWNTO 16) <= 
      "0111111" WHEN "0000",
      "0000110" WHEN "0001",
      "1011011" WHEN "0010",
      "1001111" WHEN "0011",
      "1100110" WHEN "0100",
      "1101101" WHEN "0101",
      "1111101" WHEN "0110",
      "0000111" WHEN "0111",
      "1111111" WHEN "1000",
      "1100111" WHEN "1001",
      "1110111" WHEN "1010",
      "1111100" WHEN "1011",
      "0111001" WHEN "1100",
      "1011110" WHEN "1101",
      "1111001" WHEN "1110",
      "1110001" WHEN OTHERS;
   LOGISIM_OUTPUT_BUBBLES(23) <= s_LOGISIM_NET_168;

   -----------------------------------------------------------------------------
   -- Here all normal components are defined                                  --
   -----------------------------------------------------------------------------
   GATE_2 : OR_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_76,
                 Input_2                            => s_LOGISIM_BUS_163(31),
                 Result                             => s_LOGISIM_NET_100);

   GATE_3 : AND_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_100,
                 Input_2                            => s_LOGISIM_NET_93,
                 Result                             => s_LOGISIM_NET_156);

   GATE_4 : AND_GATE_BUS
      GENERIC MAP ( BubblesMask                        => 0,
                    NrOfBits                           => 8)
      PORT MAP ( Input_1                            => s_LOGISIM_BUS_122(7 DOWNTO 0),
                 Input_2                            => s_LOGISIM_BUS_20(7 DOWNTO 0),
                 Result                             => s_LOGISIM_BUS_54(7 DOWNTO 0));

   GATE_5 : AND_GATE_BUS
      GENERIC MAP ( BubblesMask                        => 0,
                    NrOfBits                           => 8)
      PORT MAP ( Input_1                            => s_LOGISIM_BUS_82(7 DOWNTO 0),
                 Input_2                            => s_LOGISIM_BUS_97(7 DOWNTO 0),
                 Result                             => s_LOGISIM_BUS_146(7 DOWNTO 0));

   GATE_6 : AND_GATE_BUS
      GENERIC MAP ( BubblesMask                        => 0,
                    NrOfBits                           => 8)
      PORT MAP ( Input_1                            => s_LOGISIM_BUS_73(7 DOWNTO 0),
                 Input_2                            => s_LOGISIM_BUS_14(7 DOWNTO 0),
                 Result                             => s_LOGISIM_BUS_143(7 DOWNTO 0));

   GATE_7 : AND_GATE_BUS
      GENERIC MAP ( BubblesMask                        => 0,
                    NrOfBits                           => 8)
      PORT MAP ( Input_1                            => s_LOGISIM_BUS_83(7 DOWNTO 0),
                 Input_2                            => s_LOGISIM_BUS_113(7 DOWNTO 0),
                 Result                             => s_LOGISIM_BUS_1(7 DOWNTO 0));

   GATE_8 : AND_GATE_BUS
      GENERIC MAP ( BubblesMask                        => 0,
                    NrOfBits                           => 8)
      PORT MAP ( Input_1                            => s_LOGISIM_BUS_43(7 DOWNTO 0),
                 Input_2                            => s_LOGISIM_BUS_59(7 DOWNTO 0),
                 Result                             => s_LOGISIM_BUS_25(7 DOWNTO 0));

   GATE_9 : OR_GATE_BUS_9_INPUTS
      GENERIC MAP ( BubblesMask                        => 0,
                    NrOfBits                           => 8)
      PORT MAP ( Input_1                            => s_LOGISIM_BUS_146(7 DOWNTO 0),
                 Input_2                            => s_LOGISIM_BUS_143(7 DOWNTO 0),
                 Input_3                            => s_LOGISIM_BUS_1(7 DOWNTO 0),
                 Input_4                            => s_LOGISIM_BUS_25(7 DOWNTO 0),
                 Input_5                            => s_LOGISIM_BUS_54(7 DOWNTO 0),
                 Input_6                            => s_LOGISIM_BUS_88(7 DOWNTO 0),
                 Input_7                            => s_LOGISIM_BUS_49(7 DOWNTO 0),
                 Input_8                            => s_LOGISIM_BUS_132(7 DOWNTO 0),
                 Input_9                            => s_LOGISIM_BUS_41(7 DOWNTO 0),
                 Result                             => s_LOGISIM_BUS_24(7 DOWNTO 0));

   GATE_10 : AND_GATE_BUS
      GENERIC MAP ( BubblesMask                        => 0,
                    NrOfBits                           => 8)
      PORT MAP ( Input_1                            => s_LOGISIM_BUS_48(7 DOWNTO 0),
                 Input_2                            => s_LOGISIM_BUS_96(7 DOWNTO 0),
                 Result                             => s_LOGISIM_BUS_88(7 DOWNTO 0));

   GATE_11 : AND_GATE_BUS
      GENERIC MAP ( BubblesMask                        => 0,
                    NrOfBits                           => 8)
      PORT MAP ( Input_1                            => s_LOGISIM_BUS_58(7 DOWNTO 0),
                 Input_2                            => s_LOGISIM_BUS_15(7 DOWNTO 0),
                 Result                             => s_LOGISIM_BUS_49(7 DOWNTO 0));

   GATE_12 : AND_GATE_BUS
      GENERIC MAP ( BubblesMask                        => 0,
                    NrOfBits                           => 8)
      PORT MAP ( Input_1                            => s_LOGISIM_BUS_139(7 DOWNTO 0),
                 Input_2                            => s_LOGISIM_BUS_111(7 DOWNTO 0),
                 Result                             => s_LOGISIM_BUS_132(7 DOWNTO 0));

   GATE_13 : AND_GATE_BUS
      GENERIC MAP ( BubblesMask                        => 0,
                    NrOfBits                           => 8)
      PORT MAP ( Input_1                            => s_LOGISIM_BUS_50(7 DOWNTO 0),
                 Input_2                            => s_LOGISIM_BUS_57(7 DOWNTO 0),
                 Result                             => s_LOGISIM_BUS_41(7 DOWNTO 0));

   GATE_14 : NOT_GATE
      PORT MAP ( Input_1                            => s_LOGISIM_NET_37,
                 Result                             => s_LOGISIM_NET_158);

   GATE_15 : AND_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_158,
                 Input_2                            => s_LOGISIM_BUS_163(16),
                 Result                             => s_LOGISIM_NET_140);

   GATE_16 : OR_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_140,
                 Input_2                            => s_LOGISIM_NET_66,
                 Input_3                            => s_LOGISIM_NET_135,
                 Result                             => s_LOGISIM_NET_55);

   GATE_17 : NOT_GATE
      PORT MAP ( Input_1                            => s_LOGISIM_NET_102,
                 Result                             => s_LOGISIM_NET_159);

   GATE_18 : AND_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_159,
                 Input_2                            => s_LOGISIM_BUS_163(17),
                 Result                             => s_LOGISIM_NET_66);

   GATE_19 : AND_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_BUS_163(18),
                 Input_2                            => s_LOGISIM_NET_5,
                 Result                             => s_LOGISIM_NET_133);

   GATE_20 : AND_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_5,
                 Input_2                            => s_LOGISIM_BUS_163(19),
                 Result                             => s_LOGISIM_NET_62);

   GATE_21 : AND_GATE_BUS
      GENERIC MAP ( BubblesMask                        => 0,
                    NrOfBits                           => 12)
      PORT MAP ( Input_1                            => s_LOGISIM_BUS_38(11 DOWNTO 0),
                 Input_2                            => s_LOGISIM_BUS_124(11 DOWNTO 0),
                 Result                             => s_LOGISIM_BUS_8(11 DOWNTO 0));

   GATE_22 : OR_GATE_BUS_3_INPUTS
      GENERIC MAP ( BubblesMask                        => 0,
                    NrOfBits                           => 12)
      PORT MAP ( Input_1                            => s_LOGISIM_BUS_8(11 DOWNTO 0),
                 Input_2                            => s_LOGISIM_BUS_92(11 DOWNTO 0),
                 Input_3                            => s_LOGISIM_BUS_129(11 DOWNTO 0),
                 Result                             => s_LOGISIM_BUS_42(11 DOWNTO 0));

   GATE_23 : AND_GATE_BUS
      GENERIC MAP ( BubblesMask                        => 0,
                    NrOfBits                           => 12)
      PORT MAP ( Input_1                            => s_LOGISIM_BUS_60(11 DOWNTO 0),
                 Input_2                            => s_LOGISIM_BUS_78(11 DOWNTO 0),
                 Result                             => s_LOGISIM_BUS_92(11 DOWNTO 0));

   GATE_24 : AND_GATE_BUS
      GENERIC MAP ( BubblesMask                        => 0,
                    NrOfBits                           => 12)
      PORT MAP ( Input_1                            => s_LOGISIM_BUS_65(11 DOWNTO 0),
                 Input_2                            => s_LOGISIM_BUS_126(11 DOWNTO 0),
                 Result                             => s_LOGISIM_BUS_129(11 DOWNTO 0));

   GATE_25 : NOT_GATE
      PORT MAP ( Input_1                            => s_LOGISIM_NET_28,
                 Result                             => s_LOGISIM_NET_36);

   GATE_26 : AND_GATE_BUS
      GENERIC MAP ( BubblesMask                        => 0,
                    NrOfBits                           => 12)
      PORT MAP ( Input_1                            => s_LOGISIM_BUS_42(11 DOWNTO 0),
                 Input_2                            => s_LOGISIM_BUS_138(11 DOWNTO 0),
                 Result                             => s_LOGISIM_BUS_87(11 DOWNTO 0));

   GATE_27 : AND_GATE_BUS
      GENERIC MAP ( BubblesMask                        => 0,
                    NrOfBits                           => 12)
      PORT MAP ( Input_1                            => s_LOGISIM_BUS_110(11 DOWNTO 0),
                 Input_2                            => s_LOGISIM_BUS_91(11 DOWNTO 0),
                 Result                             => s_LOGISIM_BUS_75(11 DOWNTO 0));

   GATE_28 : OR_GATE_BUS
      GENERIC MAP ( BubblesMask                        => 0,
                    NrOfBits                           => 12)
      PORT MAP ( Input_1                            => s_LOGISIM_BUS_87(11 DOWNTO 0),
                 Input_2                            => s_LOGISIM_BUS_75(11 DOWNTO 0),
                 Result                             => s_LOGISIM_BUS_51(11 DOWNTO 0));

   GATE_29 : OR_GATE_BUS
      GENERIC MAP ( BubblesMask                        => 0,
                    NrOfBits                           => 8)
      PORT MAP ( Input_1                            => s_LOGISIM_BUS_122(7 DOWNTO 0),
                 Input_2                            => s_LOGISIM_BUS_85(7 DOWNTO 0),
                 Result                             => s_LOGISIM_BUS_139(7 DOWNTO 0));

   GATE_30 : AND_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_5,
                 Input_2                            => s_LOGISIM_BUS_163(27),
                 Result                             => s_LOGISIM_NET_6);

   GATE_31 : AND_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_36,
                 Input_2                            => s_LOGISIM_NET_6,
                 Result                             => s_LOGISIM_NET_147);

   GATE_32 : NOT_GATE
      PORT MAP ( Input_1                            => s_LOGISIM_NET_32,
                 Result                             => s_LOGISIM_NET_119);

   GATE_33 : OR_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_71,
                 Input_2                            => s_LOGISIM_NET_147,
                 Result                             => s_LOGISIM_NET_68);

   GATE_34 : AND_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_5,
                 Input_2                            => s_LOGISIM_BUS_163(28),
                 Result                             => s_LOGISIM_NET_149);

   GATE_35 : OR_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_NET_3,
                 Input_2                            => s_LOGISIM_NET_61,
                 Result                             => s_LOGISIM_NET_101);

   GATE_36 : AND_GATE
      GENERIC MAP ( BubblesMask                        => 0)
      PORT MAP ( Input_1                            => s_LOGISIM_BUS_163(29),
                 Input_2                            => s_LOGISIM_NET_5,
                 Result                             => s_LOGISIM_NET_61);

   DEMUX_1 : Demultiplexer_2
      PORT MAP ( DemuxIn                            => s_LOGISIM_BUS_163(21),
                 DemuxOut_0                         => s_LOGISIM_NET_135,
                 DemuxOut_1                         => s_LOGISIM_NET_105,
                 Enable                             => '1',
                 Sel                                => s_LOGISIM_BUS_163(20));

   DEMUX_2 : Demultiplexer_2
      PORT MAP ( DemuxIn                            => s_LOGISIM_BUS_163(22),
                 DemuxOut_0                         => s_LOGISIM_NET_109,
                 DemuxOut_1                         => s_LOGISIM_NET_29,
                 Enable                             => '1',
                 Sel                                => s_LOGISIM_BUS_163(20));

   DEMUX_3 : Demultiplexer_2
      PORT MAP ( DemuxIn                            => s_LOGISIM_BUS_163(24),
                 DemuxOut_0                         => s_LOGISIM_NET_98,
                 DemuxOut_1                         => s_LOGISIM_NET_72,
                 Enable                             => '1',
                 Sel                                => s_LOGISIM_BUS_163(23));

   DEMUX_4 : Demultiplexer_2
      PORT MAP ( DemuxIn                            => s_LOGISIM_BUS_163(25),
                 DemuxOut_0                         => s_LOGISIM_NET_77,
                 DemuxOut_1                         => s_LOGISIM_NET_89,
                 Enable                             => '1',
                 Sel                                => s_LOGISIM_BUS_163(23));

   COUNTER_1 : LogisimCounter
      GENERIC MAP ( ClkEdge                            => 1,
                    max_val                            => 7,
                    mode                               => 0,
                    width                              => 3)
      PORT MAP ( ClockEnable                        => LOGISIM_CLOCK_TREE_0(2),
                 CompareOut                         => s_LOGISIM_NET_76,
                 CountValue                         => s_LOGISIM_BUS_162(2 DOWNTO 0),
                 Enable                             => s_LOGISIM_NET_93,
                 GlobalClock                        => LOGISIM_CLOCK_TREE_0(4),
                 LoadData                           => s_LOGISIM_BUS_22(2 DOWNTO 0),
                 Up_n_Down                          => s_LOGISIM_NET_161,
                 clear                              => s_LOGISIM_NET_160,
                 load                               => s_LOGISIM_NET_156);

   ROM_1 : ROMCONTENTS_ROM_1
      PORT MAP ( Address                            => s_LOGISIM_BUS_162(6 DOWNTO 0),
                 Data                               => s_LOGISIM_BUS_163(31 DOWNTO 0));

   RAM_1 : RAMCONTENTS_CALL_STACK
      PORT MAP ( Address                            => s_LOGISIM_BUS_128(7 DOWNTO 0),
                 Clock                              => LOGISIM_CLOCK_TREE_0(4),
                 DataIn                             => s_LOGISIM_BUS_51(11 DOWNTO 0),
                 DataOut                            => s_LOGISIM_BUS_38(11 DOWNTO 0),
                 OE                                 => s_LOGISIM_NET_164,
                 Tick                               => LOGISIM_CLOCK_TREE_0(2),
                 WE                                 => s_LOGISIM_NET_133);

   REGISTER_FILE_1 : REGISTER_FLIP_FLOP
      GENERIC MAP ( ActiveLevel                        => 1,
                    NrOfBits                           => 12)
      PORT MAP ( Clock                              => LOGISIM_CLOCK_TREE_0(4),
                 ClockEnable                        => s_LOGISIM_NET_68,
                 D                                  => s_LOGISIM_BUS_51(11 DOWNTO 0),
                 Q                                  => s_LOGISIM_BUS_121(11 DOWNTO 0),
                 Reset                              => s_LOGISIM_NET_165,
                 Tick                               => LOGISIM_CLOCK_TREE_0(2));

   RAM_2 : RAMCONTENTS_MAIN_RAM
      PORT MAP ( Address                            => s_LOGISIM_BUS_23(11 DOWNTO 0),
                 Clock                              => LOGISIM_CLOCK_TREE_0(4),
                 DataIn                             => s_LOGISIM_BUS_141(7 DOWNTO 0),
                 DataOut                            => s_LOGISIM_BUS_50(7 DOWNTO 0),
                 OE                                 => s_LOGISIM_NET_155,
                 Tick                               => LOGISIM_CLOCK_TREE_0(2),
                 WE                                 => s_LOGISIM_NET_130);


   -----------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                       --
   -----------------------------------------------------------------------------
   Arithmetic_Logic_Unit_1 : Arithmetic_Logic_Unit
      PORT MAP ( Accummulator_In                    => s_LOGISIM_BUS_82(7 DOWNTO 0),
                 C_Flag                             => s_LOGISIM_NET_102,
                 Data_In                            => s_LOGISIM_BUS_24(7 DOWNTO 0),
                 FLAG_LATCH_control                 => s_LOGISIM_BUS_163(8),
                 FUNCTION_LATCH_control             => s_LOGISIM_BUS_163(7),
                 FUNCTION_control                   => s_LOGISIM_BUS_108(2 DOWNTO 0),
                 LOAD_Control                       => s_LOGISIM_BUS_163(9),
                 LOGISIM_CLOCK_TREE_0               => LOGISIM_CLOCK_TREE_0,
                 Main_Clock                         => s_LOGISIM_NET_5,
                 Master_Clock                       => s_LOGISIM_NET_0,
                 Result                             => s_LOGISIM_BUS_73(7 DOWNTO 0),
                 Z_flag                             => s_LOGISIM_NET_37);

   A_ccumulator : Register_8_Bit
      PORT MAP ( LOAD_control                       => s_LOGISIM_NET_106,
                 LOGISIM_CLOCK_TREE_0               => LOGISIM_CLOCK_TREE_0,
                 Main_Clock                         => s_LOGISIM_NET_5,
                 Master_Clock                       => s_LOGISIM_NET_0,
                 OUT_control                        => s_LOGISIM_NET_169,
                 Perma_Out                          => s_LOGISIM_BUS_82(7 DOWNTO 0),
                 Value_In                           => s_LOGISIM_BUS_24(7 DOWNTO 0),
                 Value_Out                          => OPEN);

   B : Register_8_Bit
      PORT MAP ( LOAD_control                       => s_LOGISIM_NET_115,
                 LOGISIM_CLOCK_TREE_0               => LOGISIM_CLOCK_TREE_0,
                 Main_Clock                         => s_LOGISIM_NET_5,
                 Master_Clock                       => s_LOGISIM_NET_0,
                 OUT_control                        => s_LOGISIM_NET_170,
                 Perma_Out                          => s_LOGISIM_BUS_83(7 DOWNTO 0),
                 Value_In                           => s_LOGISIM_BUS_24(7 DOWNTO 0),
                 Value_Out                          => OPEN);

   C : Register_8_Bit
      PORT MAP ( LOAD_control                       => s_LOGISIM_NET_142,
                 LOGISIM_CLOCK_TREE_0               => LOGISIM_CLOCK_TREE_0,
                 Main_Clock                         => s_LOGISIM_NET_5,
                 Master_Clock                       => s_LOGISIM_NET_0,
                 OUT_control                        => s_LOGISIM_NET_171,
                 Perma_Out                          => s_LOGISIM_BUS_43(7 DOWNTO 0),
                 Value_In                           => s_LOGISIM_BUS_24(7 DOWNTO 0),
                 Value_Out                          => OPEN);

   D : Register_8_Bit
      PORT MAP ( LOAD_control                       => s_LOGISIM_NET_131,
                 LOGISIM_CLOCK_TREE_0               => LOGISIM_CLOCK_TREE_0,
                 Main_Clock                         => s_LOGISIM_NET_5,
                 Master_Clock                       => s_LOGISIM_NET_0,
                 OUT_control                        => s_LOGISIM_NET_172,
                 Perma_Out                          => s_LOGISIM_BUS_48(7 DOWNTO 0),
                 Value_In                           => s_LOGISIM_BUS_24(7 DOWNTO 0),
                 Value_Out                          => OPEN);

   T : Register_8_Bit
      PORT MAP ( LOAD_control                       => s_LOGISIM_BUS_163(11),
                 LOGISIM_CLOCK_TREE_0               => LOGISIM_CLOCK_TREE_0,
                 Main_Clock                         => s_LOGISIM_NET_5,
                 Master_Clock                       => s_LOGISIM_NET_0,
                 OUT_control                        => s_LOGISIM_NET_173,
                 Perma_Out                          => s_LOGISIM_BUS_58(7 DOWNTO 0),
                 Value_In                           => s_LOGISIM_BUS_24(7 DOWNTO 0),
                 Value_Out                          => OPEN);

   IR : Instruction_Register
      PORT MAP ( LOAD_control                       => s_LOGISIM_BUS_163(14),
                 LOGISIM_CLOCK_TREE_0               => LOGISIM_CLOCK_TREE_0,
                 Main_Clock                         => s_LOGISIM_NET_5,
                 Master_Clock                       => s_LOGISIM_NET_0,
                 Out_To_Microcode_ROM               => s_LOGISIM_BUS_162(6 DOWNTO 3),
                 REG1_OUT_control                   => s_LOGISIM_BUS_163(12),
                 REG2_OUT_control                   => s_LOGISIM_BUS_163(13),
                 Reg_Select                         => s_LOGISIM_BUS_21(1 DOWNTO 0),
                 Value_In                           => s_LOGISIM_BUS_24(7 DOWNTO 0));

   PC : Increment_Decrement_Register_12_Bit
      PORT MAP ( Decrement                          => s_LOGISIM_NET_109,
                 Increment                          => s_LOGISIM_NET_55,
                 LOAD_HIGH_Control                  => s_LOGISIM_NET_98,
                 LOAD_LOW_Control                   => s_LOGISIM_NET_77,
                 LOGISIM_CLOCK_TREE_0               => LOGISIM_CLOCK_TREE_0,
                 Main_Clock                         => s_LOGISIM_NET_5,
                 Master_Clock                       => s_LOGISIM_NET_0,
                 OUT_control                        => s_LOGISIM_NET_11,
                 Perma_Out                          => s_LOGISIM_NET_174,
                 Value_In                           => s_LOGISIM_BUS_24(7 DOWNTO 0),
                 Value_Out                          => s_LOGISIM_BUS_60(11 DOWNTO 0));

   SP : Increment_Decrement_Register_12_Bit
      PORT MAP ( Decrement                          => s_LOGISIM_NET_29,
                 Increment                          => s_LOGISIM_NET_105,
                 LOAD_HIGH_Control                  => s_LOGISIM_NET_120,
                 LOAD_LOW_Control                   => s_LOGISIM_NET_120,
                 LOGISIM_CLOCK_TREE_0               => LOGISIM_CLOCK_TREE_0,
                 Main_Clock                         => s_LOGISIM_NET_5,
                 Master_Clock                       => s_LOGISIM_NET_0,
                 OUT_control                        => s_LOGISIM_NET_176,
                 Perma_Out                          => s_LOGISIM_NET_177,
                 Value_In                           => s_LOGISIM_BUS_175(7 DOWNTO 0),
                 Value_Out                          => s_LOGISIM_BUS_128(11 DOWNTO 0));

   Programmed_Address_Loader : Increment_Decrement_Register_12_Bit
      PORT MAP ( Decrement                          => s_LOGISIM_NET_19,
                 Increment                          => s_LOGISIM_NET_19,
                 LOAD_HIGH_Control                  => s_LOGISIM_NET_72,
                 LOAD_LOW_Control                   => s_LOGISIM_NET_89,
                 LOGISIM_CLOCK_TREE_0               => LOGISIM_CLOCK_TREE_0,
                 Main_Clock                         => s_LOGISIM_NET_5,
                 Master_Clock                       => s_LOGISIM_NET_0,
                 OUT_control                        => s_LOGISIM_NET_35,
                 Perma_Out                          => s_LOGISIM_NET_19,
                 Value_In                           => s_LOGISIM_BUS_24(7 DOWNTO 0),
                 Value_Out                          => s_LOGISIM_BUS_65(11 DOWNTO 0));

   Hex_Driver_1 : Hex_Driver
      PORT MAP ( All_Out                            => s_LOGISIM_BUS_178(7 DOWNTO 0),
                 Data_In                            => s_LOGISIM_BUS_24(7 DOWNTO 0),
                 Data_Out                           => s_LOGISIM_BUS_150(3 DOWNTO 0),
                 Digit_Select                       => s_LOGISIM_NET_32,
                 LOAD_control                       => s_LOGISIM_NET_44,
                 LOGISIM_CLOCK_TREE_0               => LOGISIM_CLOCK_TREE_0,
                 Master_clock                       => s_LOGISIM_NET_0);

   Memory_Mapped_IO : I_O_Driver
      PORT MAP ( DATA_OUT                           => s_LOGISIM_BUS_141(7 DOWNTO 0),
                 HEX_WRITE                          => s_LOGISIM_NET_44,
                 LOGISIM_CLOCK_TREE_0               => LOGISIM_CLOCK_TREE_0,
                 RAM_ADDRESS_IN                     => s_LOGISIM_BUS_121(11 DOWNTO 0),
                 RAM_ADRESS_OUT                     => s_LOGISIM_BUS_23(11 DOWNTO 0),
                 RAM_DATA_IN                        => s_LOGISIM_BUS_24(7 DOWNTO 0),
                 RAM_LOAD_OUT                       => s_LOGISIM_NET_17,
                 RAM_LOAD_control                   => s_LOGISIM_NET_149,
                 RAM_STORE_OUT                      => s_LOGISIM_NET_130,
                 RAM_STORE_control                  => s_LOGISIM_NET_101,
                 SWITCH_BUTTON_READ                 => s_LOGISIM_NET_16);

   Clock_Generator : clock_unit
      PORT MAP ( Halt                               => s_LOGISIM_BUS_163(30),
                 Inverse_Clock                      => s_LOGISIM_NET_93,
                 LOGISIM_CLOCK_TREE_0               => LOGISIM_CLOCK_TREE_0,
                 MASTER_CLOCK                       => s_LOGISIM_NET_0,
                 Main_Clock                         => s_LOGISIM_NET_5,
                 Switch_12                          => s_LOGISIM_NET_3,
                 Switch_13_Clock_Step               => s_LOGISIM_NET_71,
                 Switch_14_Clock_Mode               => s_LOGISIM_NET_79,
                 Switch_15_Main_Mode                => s_LOGISIM_NET_28,
                 UART_Unhalt                        => s_LOGISIM_NET_179);

   Reg_Selector_1 : Reg_Selector
      PORT MAP ( CODED_REG_LOAD_control             => s_LOGISIM_BUS_163(1),
                 CODED_REG_OUT_control              => s_LOGISIM_BUS_163(2),
                 LOAD_A_control                     => s_LOGISIM_BUS_163(0),
                 LOGISIM_CLOCK_TREE_0               => LOGISIM_CLOCK_TREE_0,
                 Load_A                             => s_LOGISIM_NET_106,
                 Load_B                             => s_LOGISIM_NET_115,
                 Load_C                             => s_LOGISIM_NET_142,
                 Load_D                             => s_LOGISIM_NET_131,
                 Out_A                              => s_LOGISIM_NET_47,
                 Out_B                              => s_LOGISIM_NET_12,
                 Out_C                              => s_LOGISIM_NET_13,
                 Out_D                              => s_LOGISIM_NET_45,
                 Reg_Select                         => s_LOGISIM_BUS_21(1 DOWNTO 0));


END PlatformIndependent;
