--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : LogisimCounter                                               ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE PlatformIndependent OF LogisimCounter IS 

   -----------------------------------------------------------------------------
   -- Here all used signals are defined                                       --
   -----------------------------------------------------------------------------
   SIGNAL s_real_enable                      : std_logic;
   SIGNAL s_carry                            : std_logic;
   SIGNAL s_counter_value                    : std_logic_vector( (width-1) DOWNTO 0 );
   SIGNAL s_next_counter_value               : std_logic_vector( (width-1) DOWNTO 0 );

BEGIN
   -----------------------------------------------------------------------------
   -- Functionality of the counter:                                           --
   -- __Load_Count_|_mode                                                     --
   -- ____0____0___|_halt                                                     --
   -- ____0____1___|_count_up_(default)                                       --
   -- ____1____0___|load                                                      --
   -- ____1____1___|_count_down                                               --
   -----------------------------------------------------------------------------

   CompareOut   <= s_carry;
   CountValue   <= s_counter_value;

   make_carry : PROCESS( Up_n_Down ,
                         s_counter_value )
   BEGIN
      IF (Up_n_Down = '0') THEN
         IF (s_counter_value = std_logic_vector(to_unsigned(0,width))) THEN
            s_carry <= '1';
                                                               ELSE
            s_carry <= '0';
         END IF; -- Down counting
                           ELSE
         IF (s_counter_value = std_logic_vector(to_unsigned(max_val,width))) THEN
            s_carry <= '1';
                                                                     ELSE
            s_carry <= '0';
         END IF; -- Up counting
      END IF;
   END PROCESS make_carry;

   s_real_enable <= '0' WHEN (load = '0' AND enable = '0') -- Counter disabled
                             OR
                             (mode = 1 AND s_carry = '1' AND load = '0') -- Stay at value situation
                        ELSE ClockEnable;

   make_next_value : PROCESS( load , Up_n_Down , s_counter_value ,
                              LoadData , s_carry )
      VARIABLE v_downcount : std_logic;         
   BEGIN
      v_downcount := NOT(Up_n_Down);
      IF ((load = '1') OR -- load condition
          (mode = 3 AND s_carry = '1')    -- Wrap load condition
         ) THEN s_next_counter_value <= LoadData;
           ELSE
         CASE (mode) IS
            WHEN  0     => IF (s_carry = '1') THEN
                              IF (v_downcount = '1') THEN 
                                 s_next_counter_value <= std_logic_vector(to_unsigned(max_val,width));
                                                     ELSE 
                                 s_next_counter_value <= (OTHERS => '0');
                              END IF;
                                              ELSE
                              IF (v_downcount = '1') THEN 
                                 s_next_counter_value <= std_logic_vector(unsigned(s_counter_value) - 1);
                                                     ELSE 
                                 s_next_counter_value <= std_logic_vector(unsigned(s_counter_value) + 1);
                              END IF;
                           END IF;
            WHEN OTHERS => IF (v_downcount = '1') THEN 
                              s_next_counter_value <= std_logic_vector(unsigned(s_counter_value) - 1);
                                                  ELSE 
                              s_next_counter_value <= std_logic_vector(unsigned(s_counter_value) + 1);
                           END IF;
         END CASE;
      END IF;
   END PROCESS make_next_value;

   make_flops : PROCESS( GlobalClock , s_real_enable , clear , s_next_counter_value )
      VARIABLE temp : std_logic_vector(0 DOWNTO 0);
   BEGIN
      temp := std_logic_vector(to_unsigned(ClkEdge,1));
      IF (clear = '1') THEN s_counter_value <= (OTHERS => '0');
      ELSIF (GlobalClock'event AND (GlobalClock = temp(0))) THEN
         IF (s_real_enable = '1') THEN s_counter_value <= s_next_counter_value;
         END IF;
      END IF;
   END PROCESS make_flops;
END PlatformIndependent;
