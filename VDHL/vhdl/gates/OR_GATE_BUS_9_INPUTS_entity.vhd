--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : OR_GATE_BUS_9_INPUTS                                         ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY OR_GATE_BUS_9_INPUTS IS
   GENERIC ( BubblesMask               : INTEGER;
             NrOfBits                  : INTEGER);
   PORT ( Input_1                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
          Input_2                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
          Input_3                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
          Input_4                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
          Input_5                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
          Input_6                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
          Input_7                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
          Input_8                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
          Input_9                   : IN  std_logic_vector( (NrOfBits-1) DOWNTO 0 );
          Result                    : OUT std_logic_vector( (NrOfBits-1) DOWNTO 0 ));
END OR_GATE_BUS_9_INPUTS;

