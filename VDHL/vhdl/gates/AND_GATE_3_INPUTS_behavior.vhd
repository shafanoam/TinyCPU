--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : AND_GATE_3_INPUTS                                            ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE PlatformIndependent OF AND_GATE_3_INPUTS IS 

   -----------------------------------------------------------------------------
   -- Here all used signals are defined                                       --
   -----------------------------------------------------------------------------
   SIGNAL s_real_input_1                     : std_logic;
   SIGNAL s_real_input_2                     : std_logic;
   SIGNAL s_real_input_3                     : std_logic;
   SIGNAL s_signal_invert_mask               : std_logic_vector( 2 DOWNTO 0 );

BEGIN

   -----------------------------------------------------------------------------
   -- Here the bubbles are processed                                          --
   -----------------------------------------------------------------------------
   s_signal_invert_mask <= std_logic_vector(to_unsigned(BubblesMask,3));
   s_real_input_1  <= NOT( Input_1 )
                         WHEN s_signal_invert_mask(0) = '1' ELSE
                      Input_1;
   s_real_input_2  <= NOT( Input_2 )
                         WHEN s_signal_invert_mask(1) = '1' ELSE
                      Input_2;
   s_real_input_3  <= NOT( Input_3 )
                         WHEN s_signal_invert_mask(2) = '1' ELSE
                      Input_3;

   -----------------------------------------------------------------------------
   -- Here the functionality is defined                                       --
   -----------------------------------------------------------------------------
   Result <= s_real_input_1 AND
             s_real_input_2 AND
             s_real_input_3;

END PlatformIndependent;
