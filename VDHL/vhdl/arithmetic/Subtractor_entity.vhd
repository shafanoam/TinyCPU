--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : Subtractor                                                   ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Subtractor IS
   GENERIC ( ExtendedBits              : INTEGER;
             NrOfBits                  : INTEGER);
   PORT ( BorrowIn                  : IN  std_logic;
          DataA                     : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
          DataB                     : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
          BorrowOut                 : OUT std_logic;
          Result                    : OUT std_logic_vector( (NrOfBits-1) DOWNTO 0 ));
END Subtractor;

