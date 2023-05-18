--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : XOR_GATE_BUS_ONEHOT                                          ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY XOR_GATE_BUS_ONEHOT IS
   GENERIC ( BubblesMask               : INTEGER;
             NrOfBits                  : INTEGER);
   PORT ( Input_1                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
          Input_2                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
          Result                    : OUT std_logic_vector( (NrOfBits-1) DOWNTO 0 ));
END XOR_GATE_BUS_ONEHOT;

