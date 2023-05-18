--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : Subtractor                                                   ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE PlatformIndependent OF Subtractor IS 

   -----------------------------------------------------------------------------
   -- Here all used signals are defined                                       --
   -----------------------------------------------------------------------------
   SIGNAL s_carry                            : std_logic;
   SIGNAL s_extended_dataA                   : std_logic_vector( (ExtendedBits-1) DOWNTO 0 );
   SIGNAL s_extended_dataB                   : std_logic_vector( (ExtendedBits-1) DOWNTO 0 );
   SIGNAL s_inverted_dataB                   : std_logic_vector( (NrOfBits-1) DOWNTO 0 );
   SIGNAL s_sum_result                       : std_logic_vector( (ExtendedBits-1) DOWNTO 0 );

BEGIN
   s_inverted_dataB <= NOT(DataB);
   s_extended_dataA <= "0"&DataA;
   s_extended_dataB <= "0"&s_inverted_dataB;
   s_carry          <= NOT(BorrowIn);
   s_sum_result     <= std_logic_vector(unsigned(s_extended_dataA)+
                       unsigned(s_extended_dataB)+
                       (""&s_carry));

   Result <= s_sum_result( (NrOfBits-1) DOWNTO 0 );
   BorrowOut <= NOT(s_sum_result(ExtendedBits-1));
END PlatformIndependent;
