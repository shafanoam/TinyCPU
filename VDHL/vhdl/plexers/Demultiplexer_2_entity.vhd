--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : Demultiplexer_2                                              ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Demultiplexer_2 IS
   PORT ( DemuxIn                   : IN  std_logic;
          Enable                    : IN  std_logic;
          Sel                       : IN  std_logic;
          DemuxOut_0                : OUT std_logic;
          DemuxOut_1                : OUT std_logic);
END Demultiplexer_2;

