--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : Hex_Driver                                                   ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Hex_Driver IS
   PORT ( Data_In                   : IN  std_logic_vector( 7 DOWNTO 0 );
          LOAD_control              : IN  std_logic;
          LOGISIM_CLOCK_TREE_0      : IN  std_logic_vector( 4 DOWNTO 0 );
          Master_clock              : IN  std_logic;
          All_Out                   : OUT std_logic_vector( 7 DOWNTO 0 );
          Data_Out                  : OUT std_logic_vector( 3 DOWNTO 0 );
          Digit_Select              : OUT std_logic);
END Hex_Driver;

