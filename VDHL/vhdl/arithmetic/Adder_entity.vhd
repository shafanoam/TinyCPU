--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : Adder                                                        ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Adder IS
   GENERIC ( ExtendedBits              : INTEGER;
             NrOfBits                  : INTEGER);
   PORT ( CarryIn                   : IN  std_logic;
          DataA                     : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
          DataB                     : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
          CarryOut                  : OUT std_logic;
          Result                    : OUT std_logic_vector( (NrOfBits-1) DOWNTO 0 ));
END Adder;

