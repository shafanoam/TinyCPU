--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : Register_8_Bit                                               ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Register_8_Bit IS
   PORT ( LOAD_control              : IN  std_logic;
          LOGISIM_CLOCK_TREE_0      : IN  std_logic_vector( 4 DOWNTO 0 );
          Main_Clock                : IN  std_logic;
          Master_Clock              : IN  std_logic;
          OUT_control               : IN  std_logic;
          Value_In                  : IN  std_logic_vector( 7 DOWNTO 0 );
          Perma_Out                 : OUT std_logic_vector( 7 DOWNTO 0 );
          Value_Out                 : OUT std_logic_vector( 7 DOWNTO 0 ));
END Register_8_Bit;

