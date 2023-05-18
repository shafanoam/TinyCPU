--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : Arithmetic_Logic_Unit                                        ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Arithmetic_Logic_Unit IS
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
END Arithmetic_Logic_Unit;

