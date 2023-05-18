--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : LogisimClockComponent                                        ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY LogisimClockComponent IS
   GENERIC ( NrOfBits                  : INTEGER;
             LowTicks                  : INTEGER;
             HighTicks                 : INTEGER);
   PORT ( ClockTick                 : IN  std_logic;
          GlobalClock               : IN  std_logic;
          ClockBus                  : OUT std_logic_vector( 4 DOWNTO 0 ));
END LogisimClockComponent;

