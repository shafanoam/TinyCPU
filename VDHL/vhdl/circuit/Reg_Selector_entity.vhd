--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : Reg_Selector                                                 ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Reg_Selector IS
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
END Reg_Selector;

