--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : Multiplexer_2                                                ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Multiplexer_2 IS
   PORT ( Enable                    : IN  std_logic;
          MuxIn_0                   : IN  std_logic;
          MuxIn_1                   : IN  std_logic;
          Sel                       : IN  std_logic;
          MuxOut                    : OUT std_logic);
END Multiplexer_2;

