--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : LogisimClockComponent                                        ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE PlatformIndependent OF LogisimClockComponent IS 

   -----------------------------------------------------------------------------
   -- Here all used signals are defined                                       --
   -----------------------------------------------------------------------------
   SIGNAL s_counter_is_zero                  : std_logic;
   SIGNAL s_counter_next                     : std_logic_vector( (NrOfBits-1) DOWNTO 0 );
   SIGNAL s_counter_reg                      : std_logic_vector( (NrOfBits-1) DOWNTO 0 );
   SIGNAL s_derived_clock_reg                : std_logic;
   SIGNAL s_output_regs                      : std_logic_vector( 3 DOWNTO 0 );

BEGIN
   -----------------------------------------------------------------------------
   -- Here the output signals are defines; we synchronize them all on the     --
   -- main clock                                                              --
   -----------------------------------------------------------------------------
   ClockBus <= GlobalClock&s_output_regs;
   makeOutputs : PROCESS( GlobalClock )
   BEGIN
      IF (GlobalClock'event AND (GlobalClock = '1')) THEN
         s_output_regs(0)  <= s_derived_clock_reg;
         s_output_regs(1)  <= NOT(s_derived_clock_reg);
         s_output_regs(2)  <= NOT(s_derived_clock_reg) AND --rising edge tick
                              ClockTick AND
                              s_counter_is_zero;
         s_output_regs(3)  <= s_derived_clock_reg AND --falling edge tick
                              ClockTick AND
                              s_counter_is_zero;
      END IF;
   END PROCESS makeOutputs;

   -----------------------------------------------------------------------------
   -- Here the control signals are defined                                    --
   -----------------------------------------------------------------------------
   s_counter_is_zero <= '1' WHEN s_counter_reg = std_logic_vector(to_unsigned(0,NrOfBits)) ELSE '0';
   s_counter_next    <= std_logic_vector(unsigned(s_counter_reg) - 1)
                           WHEN s_counter_is_zero = '0' ELSE
                        std_logic_vector(to_unsigned((LowTicks-1),NrOfBits))
                           WHEN s_derived_clock_reg = '1' ELSE
                        std_logic_vector(to_unsigned((HighTicks-1),NrOfBits));

   -----------------------------------------------------------------------------
   -- Here the state registers are defined                                    --
   -----------------------------------------------------------------------------
   makeDerivedClock : PROCESS( GlobalClock , ClockTick , s_counter_is_zero ,
                               s_derived_clock_reg)
   BEGIN
      IF (GlobalClock'event AND (GlobalClock = '1')) THEN
         IF (s_derived_clock_reg /= '0' AND s_derived_clock_reg /= '1') THEN --For simulation only
            s_derived_clock_reg <= '0';
         ELSIF (s_counter_is_zero = '1' AND ClockTick = '1') THEN
            s_derived_clock_reg <= NOT(s_derived_clock_reg);
         END IF;
      END IF;
   END PROCESS makeDerivedClock;

   makeCounter : PROCESS( GlobalClock , ClockTick , s_counter_next ,
                          s_derived_clock_reg )
   BEGIN
      IF (GlobalClock'event AND (GlobalClock = '1')) THEN
         IF (s_derived_clock_reg /= '0' AND s_derived_clock_reg /= '1') THEN --For simulation only
            s_counter_reg <= (OTHERS => '0');
         ELSIF (ClockTick = '1') THEN
            s_counter_reg <= s_counter_next;
         END IF;
      END IF;
   END PROCESS makeCounter;

END PlatformIndependent;
