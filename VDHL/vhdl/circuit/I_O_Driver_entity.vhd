--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : I_O_Driver                                                   ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY I_O_Driver IS
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
END I_O_Driver;

