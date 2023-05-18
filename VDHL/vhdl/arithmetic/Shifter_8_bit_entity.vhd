--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : Shifter_8_bit                                                ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Shifter_8_bit IS
   GENERIC ( ShifterMode               : INTEGER);
   PORT ( DataA                     : IN  std_logic_vector( 7 DOWNTO 0 );
          ShiftAmount               : IN  std_logic_vector( 2 DOWNTO 0 );
          Result                    : OUT std_logic_vector( 7 DOWNTO 0 ));
END Shifter_8_bit;

