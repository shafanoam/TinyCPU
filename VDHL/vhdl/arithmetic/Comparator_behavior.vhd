--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : Comparator                                                   ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE PlatformIndependent OF Comparator IS 

   -----------------------------------------------------------------------------
   -- Here all used signals are defined                                       --
   -----------------------------------------------------------------------------
   SIGNAL s_signed_greater                   : std_logic;
   SIGNAL s_signed_less                      : std_logic;
   SIGNAL s_unsigned_greater                 : std_logic;
   SIGNAL s_unsigned_less                    : std_logic;

BEGIN
   s_signed_less      <= '1' WHEN signed(DataA) < signed(DataB) ELSE '0';
   s_unsigned_less    <= '1' WHEN unsigned(DataA) < unsigned(DataB) ELSE '0';
   s_signed_greater   <= '1' WHEN signed(DataA) > signed(DataB) ELSE '0';
   s_unsigned_greater <= '1' WHEN unsigned(DataA) > unsigned(DataB) ELSE '0';

   A_EQ_B <= '1' WHEN DataA = DataB ELSE '0';
   A_GT_B <= s_signed_greater WHEN TwosComplement=1 ELSE s_unsigned_greater;
   A_LT_B <= s_signed_less    WHEN TwosComplement=1 ELSE s_unsigned_less;
END PlatformIndependent;
