--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : REGISTER_FLIP_FLOP                                           ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY REGISTER_FLIP_FLOP IS
   GENERIC ( ActiveLevel               : INTEGER;
             NrOfBits                  : INTEGER);
   PORT ( Clock                     : IN  std_logic;
          ClockEnable               : IN  std_logic;
          D                         : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
          Reset                     : IN  std_logic;
          Tick                      : IN  std_logic;
          Q                         : OUT std_logic_vector( (NrOfBits-1) DOWNTO 0 ));
END REGISTER_FLIP_FLOP;

