--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : LogisimCounter                                               ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY LogisimCounter IS
   GENERIC ( mode                      : INTEGER;
             ClkEdge                   : INTEGER;
             max_val                   : INTEGER;
             width                     : INTEGER);
   PORT ( ClockEnable               : IN  std_logic;
          Enable                    : IN  std_logic;
          GlobalClock               : IN  std_logic;
          LoadData                  : IN  std_logic_vector( (width-1) DOWNTO 0 );
          Up_n_Down                 : IN  std_logic;
          clear                     : IN  std_logic;
          load                      : IN  std_logic;
          CompareOut                : OUT std_logic;
          CountValue                : OUT std_logic_vector( (width-1) DOWNTO 0 ));
END LogisimCounter;

