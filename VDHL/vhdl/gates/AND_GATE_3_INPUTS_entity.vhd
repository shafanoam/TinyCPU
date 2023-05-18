--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : AND_GATE_3_INPUTS                                            ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY AND_GATE_3_INPUTS IS
   GENERIC ( BubblesMask               : INTEGER);
   PORT ( Input_1                   : IN  std_logic;
          Input_2                   : IN  std_logic;
          Input_3                   : IN  std_logic;
          Result                    : OUT std_logic);
END AND_GATE_3_INPUTS;

