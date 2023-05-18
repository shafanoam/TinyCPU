--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : Shifter_8_bit                                                ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE PlatformIndependent OF Shifter_8_bit IS 

   -----------------------------------------------------------------------------
   -- Here all used signals are defined                                       --
   -----------------------------------------------------------------------------
   SIGNAL s_stage_0_result                   : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_stage_0_shiftin                  : std_logic;
   SIGNAL s_stage_1_result                   : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_stage_1_shiftin                  : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_stage_2_result                   : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_stage_2_shiftin                  : std_logic_vector( 3 DOWNTO 0 );

BEGIN
   -----------------------------------------------------------------------------
   --- ShifterMode represents when:                                          ---
   --- 0 : Logical Shift Left                                                ---
   --- 1 : Rotate Left                                                       ---
   --- 2 : Logical Shift Right                                               ---
   --- 3 : Arithmetic Shift Right                                            ---
   --- 4 : Rotate Right                                                      ---
   -----------------------------------------------------------------------------


   -----------------------------------------------------------------------------
   --- Here stage 0 of the binairy shift tree is defined                     ---
   -----------------------------------------------------------------------------

   s_stage_0_shiftin <= DataA(7) WHEN ShifterMode = 1 OR ShifterMode = 3 ELSE
                        DataA(0) WHEN ShifterMode = 4 ELSE '0';

   s_stage_0_result  <= DataA
                           WHEN ShiftAmount(0) = '0' ELSE
                        DataA(6 DOWNTO 0)&s_stage_0_shiftin
                           WHEN ShifterMode = 0 OR ShifterMode = 1 ELSE
                        s_stage_0_shiftin&DataA(7 DOWNTO 1);

   -----------------------------------------------------------------------------
   --- Here stage 1 of the binairy shift tree is defined                     ---
   -----------------------------------------------------------------------------

   s_stage_1_shiftin <= s_stage_0_result( 7 DOWNTO 6 ) WHEN ShifterMode = 1 ELSE
                        (OTHERS => s_stage_0_result(7)) WHEN ShifterMode = 3 ELSE
                        s_stage_0_result( 1 DOWNTO 0 ) WHEN ShifterMode = 4 ELSE
                        (OTHERS => '0');

   s_stage_1_result  <= s_stage_0_result
                           WHEN ShiftAmount(1) = '0' ELSE
                        s_stage_0_result( 5 DOWNTO 0 )&s_stage_1_shiftin
                           WHEN ShifterMode = 0 OR ShifterMode = 1 ELSE
                        s_stage_1_shiftin&s_stage_0_result( 7 DOWNTO 2 );

   -----------------------------------------------------------------------------
   --- Here stage 2 of the binairy shift tree is defined                     ---
   -----------------------------------------------------------------------------

   s_stage_2_shiftin <= s_stage_1_result( 7 DOWNTO 4 ) WHEN ShifterMode = 1 ELSE
                        (OTHERS => s_stage_1_result(7)) WHEN ShifterMode = 3 ELSE
                        s_stage_1_result( 3 DOWNTO 0 ) WHEN ShifterMode = 4 ELSE
                        (OTHERS => '0');

   s_stage_2_result  <= s_stage_1_result
                           WHEN ShiftAmount(2) = '0' ELSE
                        s_stage_1_result( 3 DOWNTO 0 )&s_stage_2_shiftin
                           WHEN ShifterMode = 0 OR ShifterMode = 1 ELSE
                        s_stage_2_shiftin&s_stage_1_result( 7 DOWNTO 4 );

   -----------------------------------------------------------------------------
   --- Here we assign the result                                             ---
   -----------------------------------------------------------------------------

   Result <= s_stage_2_result;

END PlatformIndependent;
