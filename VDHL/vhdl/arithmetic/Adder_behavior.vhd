--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : Adder                                                        ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE PlatformIndependent OF Adder IS 

   -----------------------------------------------------------------------------
   -- Here all used signals are defined                                       --
   -----------------------------------------------------------------------------
   SIGNAL s_extended_dataA                   : std_logic_vector( (ExtendedBits-1) DOWNTO 0 );
   SIGNAL s_extended_dataB                   : std_logic_vector( (ExtendedBits-1) DOWNTO 0 );
   SIGNAL s_sum_result                       : std_logic_vector( (ExtendedBits-1) DOWNTO 0 );

BEGIN
   s_extended_dataA <= "0"&DataA;
   s_extended_dataB <= "0"&DataB;
   s_sum_result     <= std_logic_vector(unsigned(s_extended_dataA)+
                                        unsigned(s_extended_dataB)+
                                        (""&CarryIn));

   Result <= s_sum_result( (NrOfBits-1) DOWNTO 0 );
   CarryOut <= s_sum_result(ExtendedBits-1);
END PlatformIndependent;
