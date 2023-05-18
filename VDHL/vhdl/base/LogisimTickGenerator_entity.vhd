--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : LogisimTickGenerator                                         ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY LogisimTickGenerator IS
   GENERIC ( NrOfBits                  : INTEGER;
             ReloadValue               : INTEGER);
   PORT ( FPGAClock                 : IN  std_logic;
          FPGATick                  : OUT std_logic);
END LogisimTickGenerator;

