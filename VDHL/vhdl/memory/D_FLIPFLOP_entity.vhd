--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : D_FLIPFLOP                                                   ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY D_FLIPFLOP IS
   GENERIC ( ActiveLevel               : INTEGER);
   PORT ( Clock                     : IN  std_logic;
          D                         : IN  std_logic;
          Preset                    : IN  std_logic;
          Reset                     : IN  std_logic;
          Tick                      : IN  std_logic;
          Q                         : OUT std_logic;
          Q_bar                     : OUT std_logic);
END D_FLIPFLOP;

