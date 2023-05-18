--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : J_K_FLIPFLOP                                                 ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY J_K_FLIPFLOP IS
   GENERIC ( ActiveLevel               : INTEGER);
   PORT ( Clock                     : IN  std_logic;
          J                         : IN  std_logic;
          K                         : IN  std_logic;
          Preset                    : IN  std_logic;
          Reset                     : IN  std_logic;
          Tick                      : IN  std_logic;
          Q                         : OUT std_logic;
          Q_bar                     : OUT std_logic);
END J_K_FLIPFLOP;

