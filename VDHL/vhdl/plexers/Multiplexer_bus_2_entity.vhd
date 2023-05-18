--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : Multiplexer_bus_2                                            ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Multiplexer_bus_2 IS
   GENERIC ( NrOfBits                  : INTEGER);
   PORT ( Enable                    : IN  std_logic;
          MuxIn_0                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
          MuxIn_1                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
          Sel                       : IN  std_logic;
          MuxOut                    : OUT std_logic_vector( (NrOfBits-1) DOWNTO 0 ));
END Multiplexer_bus_2;

