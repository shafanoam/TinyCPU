--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : LogisimTickGenerator                                         ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE PlatformIndependent OF LogisimTickGenerator IS 

   -----------------------------------------------------------------------------
   -- Here all used signals are defined                                       --
   -----------------------------------------------------------------------------
   SIGNAL s_count_next                       : std_logic_vector( (NrOfBits-1) DOWNTO 0 );
   SIGNAL s_tick_next                        : std_logic;
   SIGNAL s_count_reg                        : std_logic_vector( (NrOfBits-1) DOWNTO 0 );
   SIGNAL s_tick_reg                         : std_logic;

BEGIN

   -----------------------------------------------------------------------------
   -- Here the Output is defined                                              --
   -----------------------------------------------------------------------------
   FPGATick <= s_tick_reg;

   -----------------------------------------------------------------------------
   -- Here the update logic is defined                                        --
   -----------------------------------------------------------------------------
   s_tick_next   <= '1' WHEN s_count_reg = std_logic_vector(to_unsigned(0,NrOfBits)) ELSE '0';
   s_count_next  <= (OTHERS => '0') WHEN s_tick_reg /= '0' AND s_tick_reg /= '1' ELSE -- For simulation only!
                    std_logic_vector(to_unsigned((ReloadValue-1),NrOfBits)) WHEN s_tick_next = '1' ELSE
                    std_logic_vector(unsigned(s_count_reg)-1);

   -----------------------------------------------------------------------------
   -- Here the flipflops are defined                                          --
   -----------------------------------------------------------------------------
   make_tick : PROCESS( FPGAClock , s_tick_next )
   BEGIN
      IF (FPGAClock'event AND (FPGAClock = '1')) THEN
         s_tick_reg <= s_tick_next;
      END IF;
   END PROCESS make_tick;

   make_counter : PROCESS( FPGAClock , s_count_next )
   BEGIN
      IF (FPGAClock'event AND (FPGAClock = '1')) THEN
         s_count_reg <= s_count_next;
      END IF;
   END PROCESS make_counter;
END PlatformIndependent;
