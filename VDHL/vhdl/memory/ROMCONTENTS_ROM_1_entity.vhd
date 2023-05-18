--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : ROMCONTENTS_ROM_1                                            ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY ROMCONTENTS_ROM_1 IS
   PORT ( Address                   : IN  std_logic_vector( 6 DOWNTO 0 );
          Data                      : OUT std_logic_vector( 31 DOWNTO 0 ));
END ROMCONTENTS_ROM_1;

