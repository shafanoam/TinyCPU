--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : LogisimToplevelShell                                         ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY LogisimToplevelShell IS
   PORT ( Button_1_0                : IN  std_logic;
          Button_2_0                : IN  std_logic;
          Button_3_0                : IN  std_logic;
          Button_4_0                : IN  std_logic;
          Button_5_0                : IN  std_logic;
          FPGA_GlobalClock          : IN  std_logic;
          Main_Switches_sw_1        : IN  std_logic;
          Main_Switches_sw_10       : IN  std_logic;
          Main_Switches_sw_11       : IN  std_logic;
          Main_Switches_sw_12       : IN  std_logic;
          Main_Switches_sw_13       : IN  std_logic;
          Main_Switches_sw_14       : IN  std_logic;
          Main_Switches_sw_15       : IN  std_logic;
          Main_Switches_sw_16       : IN  std_logic;
          Main_Switches_sw_2        : IN  std_logic;
          Main_Switches_sw_3        : IN  std_logic;
          Main_Switches_sw_4        : IN  std_logic;
          Main_Switches_sw_5        : IN  std_logic;
          Main_Switches_sw_6        : IN  std_logic;
          Main_Switches_sw_7        : IN  std_logic;
          Main_Switches_sw_8        : IN  std_logic;
          Main_Switches_sw_9        : IN  std_logic;
          n_Hex_Digit_Display_1_DecimalPoint: OUT std_logic;
          n_Hex_Digit_Display_1_Segment_A: OUT std_logic;
          n_Hex_Digit_Display_1_Segment_B: OUT std_logic;
          n_Hex_Digit_Display_1_Segment_C: OUT std_logic;
          n_Hex_Digit_Display_1_Segment_D: OUT std_logic;
          n_Hex_Digit_Display_1_Segment_E: OUT std_logic;
          n_Hex_Digit_Display_1_Segment_F: OUT std_logic;
          n_Hex_Digit_Display_1_Segment_G: OUT std_logic;
          n_Output_1_0              : OUT std_logic;
          n_Output_2_0              : OUT std_logic);
END LogisimToplevelShell;

