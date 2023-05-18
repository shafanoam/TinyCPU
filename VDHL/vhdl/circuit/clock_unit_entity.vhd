--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : clock_unit                                                   ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY clock_unit IS
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
END clock_unit;

