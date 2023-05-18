--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : Increment_Decrement_Register_12_Bit                          ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Increment_Decrement_Register_12_Bit IS
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
END Increment_Decrement_Register_12_Bit;

