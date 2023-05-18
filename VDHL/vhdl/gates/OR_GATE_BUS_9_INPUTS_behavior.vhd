--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : OR_GATE_BUS_9_INPUTS                                         ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE PlatformIndependent OF OR_GATE_BUS_9_INPUTS IS 

   -----------------------------------------------------------------------------
   -- Here all used signals are defined                                       --
   -----------------------------------------------------------------------------
   SIGNAL s_real_input_1                     : std_logic_vector( (NrOfBits-1) DOWNTO 0 );
   SIGNAL s_real_input_2                     : std_logic_vector( (NrOfBits-1) DOWNTO 0 );
   SIGNAL s_real_input_3                     : std_logic_vector( (NrOfBits-1) DOWNTO 0 );
   SIGNAL s_real_input_4                     : std_logic_vector( (NrOfBits-1) DOWNTO 0 );
   SIGNAL s_real_input_5                     : std_logic_vector( (NrOfBits-1) DOWNTO 0 );
   SIGNAL s_real_input_6                     : std_logic_vector( (NrOfBits-1) DOWNTO 0 );
   SIGNAL s_real_input_7                     : std_logic_vector( (NrOfBits-1) DOWNTO 0 );
   SIGNAL s_real_input_8                     : std_logic_vector( (NrOfBits-1) DOWNTO 0 );
   SIGNAL s_real_input_9                     : std_logic_vector( (NrOfBits-1) DOWNTO 0 );
   SIGNAL s_signal_invert_mask               : std_logic_vector( 8 DOWNTO 0 );

BEGIN

   -----------------------------------------------------------------------------
   -- Here the bubbles are processed                                          --
   -----------------------------------------------------------------------------
   s_signal_invert_mask <= std_logic_vector(to_unsigned(BubblesMask,9));
   s_real_input_1  <= NOT( Input_1 )
                         WHEN s_signal_invert_mask(0) = '1' ELSE
                      Input_1;
   s_real_input_2  <= NOT( Input_2 )
                         WHEN s_signal_invert_mask(1) = '1' ELSE
                      Input_2;
   s_real_input_3  <= NOT( Input_3 )
                         WHEN s_signal_invert_mask(2) = '1' ELSE
                      Input_3;
   s_real_input_4  <= NOT( Input_4 )
                         WHEN s_signal_invert_mask(3) = '1' ELSE
                      Input_4;
   s_real_input_5  <= NOT( Input_5 )
                         WHEN s_signal_invert_mask(4) = '1' ELSE
                      Input_5;
   s_real_input_6  <= NOT( Input_6 )
                         WHEN s_signal_invert_mask(5) = '1' ELSE
                      Input_6;
   s_real_input_7  <= NOT( Input_7 )
                         WHEN s_signal_invert_mask(6) = '1' ELSE
                      Input_7;
   s_real_input_8  <= NOT( Input_8 )
                         WHEN s_signal_invert_mask(7) = '1' ELSE
                      Input_8;
   s_real_input_9  <= NOT( Input_9 )
                         WHEN s_signal_invert_mask(8) = '1' ELSE
                      Input_9;

   -----------------------------------------------------------------------------
   -- Here the functionality is defined                                       --
   -----------------------------------------------------------------------------
   Result <= s_real_input_1 OR
             s_real_input_2 OR
             s_real_input_3 OR
             s_real_input_4 OR
             s_real_input_5 OR
             s_real_input_6 OR
             s_real_input_7 OR
             s_real_input_8 OR
             s_real_input_9;

END PlatformIndependent;
