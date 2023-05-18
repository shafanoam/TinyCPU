--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : Comparator                                                   ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Comparator IS
   GENERIC ( TwosComplement            : INTEGER;
             NrOfBits                  : INTEGER);
   PORT ( DataA                     : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
          DataB                     : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
          A_EQ_B                    : OUT std_logic;
          A_GT_B                    : OUT std_logic;
          A_LT_B                    : OUT std_logic);
END Comparator;

