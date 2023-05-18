--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : OR_GATE                                                      ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE PlatformIndependent OF OR_GATE IS 

   -----------------------------------------------------------------------------
   -- Here all used signals are defined                                       --
   -----------------------------------------------------------------------------
   SIGNAL s_real_input_1                     : std_logic;
   SIGNAL s_real_input_2                     : std_logic;
   SIGNAL s_signal_invert_mask               : std_logic_vector( 1 DOWNTO 0 );

BEGIN

   -----------------------------------------------------------------------------
   -- Here the bubbles are processed                                          --
   -----------------------------------------------------------------------------
   s_signal_invert_mask <= std_logic_vector(to_unsigned(BubblesMask,2));
   s_real_input_1  <= NOT( Input_1 )
                         WHEN s_signal_invert_mask(0) = '1' ELSE
                      Input_1;
   s_real_input_2  <= NOT( Input_2 )
                         WHEN s_signal_invert_mask(1) = '1' ELSE
                      Input_2;

   -----------------------------------------------------------------------------
   -- Here the functionality is defined                                       --
   -----------------------------------------------------------------------------
   Result <= s_real_input_1 OR
             s_real_input_2;

END PlatformIndependent;
