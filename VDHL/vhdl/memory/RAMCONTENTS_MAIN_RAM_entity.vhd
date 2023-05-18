--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : RAMCONTENTS_MAIN_RAM                                         ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY RAMCONTENTS_MAIN_RAM IS
   PORT ( Address                   : IN  std_logic_vector( 11 DOWNTO 0 );
          Clock                     : IN  std_logic;
          DataIn                    : IN  std_logic_vector( 7 DOWNTO 0 );
          OE                        : IN  std_logic;
          Tick                      : IN  std_logic;
          WE                        : IN  std_logic;
          DataOut                   : OUT std_logic_vector( 7 DOWNTO 0 ));
END RAMCONTENTS_MAIN_RAM;

