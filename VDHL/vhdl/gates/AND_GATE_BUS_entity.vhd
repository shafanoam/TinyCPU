--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : AND_GATE_BUS                                                 ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY AND_GATE_BUS IS
   GENERIC ( BubblesMask               : INTEGER;
             NrOfBits                  : INTEGER);
   PORT ( Input_1                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
          Input_2                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
          Result                    : OUT std_logic_vector( (NrOfBits-1) DOWNTO 0 ));
END AND_GATE_BUS;

