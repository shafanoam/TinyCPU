--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : Multiplexer_bus_8                                            ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Multiplexer_bus_8 IS
   GENERIC ( NrOfBits                  : INTEGER);
   PORT ( Enable                    : IN  std_logic;
          MuxIn_0                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
          MuxIn_1                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
          MuxIn_2                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
          MuxIn_3                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
          MuxIn_4                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
          MuxIn_5                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
          MuxIn_6                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
          MuxIn_7                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
          Sel                       : IN  std_logic_vector( 2 DOWNTO 0 );
          MuxOut                    : OUT std_logic_vector( (NrOfBits-1) DOWNTO 0 ));
END Multiplexer_bus_8;

