--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : REGISTER_FLIP_FLOP                                           ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE PlatformIndependent OF REGISTER_FLIP_FLOP IS 

   -----------------------------------------------------------------------------
   -- Here all used signals are defined                                       --
   -----------------------------------------------------------------------------
   SIGNAL s_state_reg                        : std_logic_vector( (NrOfBits-1) DOWNTO 0 );

BEGIN
   Q <= s_state_reg;

   make_memory : PROCESS( clock , Reset , ClockEnable , Tick , D )
   BEGIN
      IF (Reset = '1') THEN s_state_reg <= (OTHERS => '0');
      ELSIF (ActiveLevel = 1) THEN
         IF (Clock'event AND (Clock = '1')) THEN
            IF (ClockEnable = '1' AND Tick = '1') THEN
               s_state_reg <= D;
            END IF;
         END IF;
      ELSIF (ActiveLevel = 0) THEN
         IF (Clock'event AND (Clock = '0')) THEN
         IF (ClockEnable = '1' AND Tick = '1') THEN
               s_state_reg <= D;
            END IF;
         END IF;
      END IF;
   END PROCESS make_memory;
END PlatformIndependent;
