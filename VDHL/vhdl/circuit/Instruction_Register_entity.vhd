--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : Instruction_Register                                         ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Instruction_Register IS
   PORT ( LOAD_control              : IN  std_logic;
          LOGISIM_CLOCK_TREE_0      : IN  std_logic_vector( 4 DOWNTO 0 );
          Main_Clock                : IN  std_logic;
          Master_Clock              : IN  std_logic;
          REG1_OUT_control          : IN  std_logic;
          REG2_OUT_control          : IN  std_logic;
          Value_In                  : IN  std_logic_vector( 7 DOWNTO 0 );
          Out_To_Microcode_ROM      : OUT std_logic_vector( 3 DOWNTO 0 );
          Reg_Select                : OUT std_logic_vector( 1 DOWNTO 0 ));
END Instruction_Register;

