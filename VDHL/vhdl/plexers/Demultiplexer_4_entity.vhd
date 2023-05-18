--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : Demultiplexer_4                                              ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Demultiplexer_4 IS
   PORT ( DemuxIn                   : IN  std_logic;
          Enable                    : IN  std_logic;
          Sel                       : IN  std_logic_vector( 1 DOWNTO 0 );
          DemuxOut_0                : OUT std_logic;
          DemuxOut_1                : OUT std_logic;
          DemuxOut_2                : OUT std_logic;
          DemuxOut_3                : OUT std_logic);
END Demultiplexer_4;

