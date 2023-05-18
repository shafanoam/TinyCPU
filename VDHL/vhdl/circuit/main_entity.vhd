--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : main                                                         ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY main IS
   PORT ( LOGISIM_CLOCK_TREE_0      : IN  std_logic_vector( 4 DOWNTO 0 );
          LOGISIM_INPUT_BUBBLES     : IN  std_logic_vector( 20 DOWNTO 0 );
          CURRENT_ADDRESS           : OUT std_logic_vector( 11 DOWNTO 0 );
          DATA_BUS                  : OUT std_logic_vector( 7 DOWNTO 0 );
          LOGISIM_OUTPUT_BUBBLES    : OUT std_logic_vector( 23 DOWNTO 0 );
          Output_1                  : OUT std_logic;
          Output_2                  : OUT std_logic;
          Output_bus_1              : OUT std_logic_vector( 11 DOWNTO 0 );
          Reg_Select_Bus            : OUT std_logic_vector( 1 DOWNTO 0 ));
END main;

