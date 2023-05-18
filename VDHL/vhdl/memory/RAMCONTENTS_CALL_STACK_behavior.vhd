--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : RAMCONTENTS_CALL_STACK                                       ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE PlatformIndependent OF RAMCONTENTS_CALL_STACK IS 

   -----------------------------------------------------------------------------
   -- Here all private types are defined                                      --
   -----------------------------------------------------------------------------
   TYPE MEMORY_ARRAY IS ARRAY (255 DOWNTO 0) OF std_logic_vector(11 DOWNTO 0);

   -----------------------------------------------------------------------------
   -- Here all used signals are defined                                       --
   -----------------------------------------------------------------------------
   SIGNAL s_oe                               : std_logic;
   SIGNAL s_ram_data_out                     : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_we                               : std_logic;
   SIGNAL s_Address_reg                      : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_DataInReg                        : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_DataOutReg                       : std_logic_vector( 11 DOWNTO 0 );
   SIGNAL s_OEReg                            : std_logic;
   SIGNAL s_TickDelayLine                    : std_logic_vector( 2 DOWNTO 0 );
   SIGNAL s_WEReg                            : std_logic;
   SIGNAL s_mem_contents                     : MEMORY_ARRAY;

BEGIN
   -----------------------------------------------------------------------------
   -- Here the control signals are defined                                    --
   -----------------------------------------------------------------------------
   s_oe <= s_TickDelayLine(2) AND s_OEReg;
   s_we <= s_TickDelayLine(0) AND s_WEReg;

   -----------------------------------------------------------------------------
   -- Here the input registers are defined                                    --
   -----------------------------------------------------------------------------
   InputRegs : PROCESS (Clock , Tick , Address , DataIn , WE , OE )
   BEGIN
      IF (Clock'event AND (Clock = '1')) THEN
         IF (Tick = '1') THEN
             s_DataInReg        <= DataIn;
             s_Address_reg      <= Address;
             s_WEReg            <= WE;
             s_OEReg            <= OE;
         END IF;
      END IF;
   END PROCESS InputRegs;

   TickPipeReg : PROCESS(Clock)
   BEGIN
      IF (Clock'event AND (Clock = '1')) THEN
          s_TickDelayLine(0)          <= Tick;
          s_TickDelayLine(2 DOWNTO 1) <= s_TickDelayLine(1 DOWNTO 0);
      END IF;
   END PROCESS TickPipeReg;

   -----------------------------------------------------------------------------
   -- Here the actual memorie(s) is(are) defined                              --
   -----------------------------------------------------------------------------
   Mem : PROCESS( Clock , s_we, s_DataInReg, s_Address_reg)
   BEGIN
      IF (Clock'event AND (Clock = '1')) THEN
            IF (s_we = '1') THEN
               s_mem_contents(to_integer(unsigned(s_Address_reg))) <= s_DataInReg;
            END IF;
            s_ram_data_out <= s_mem_contents(to_integer(unsigned(s_Address_reg)));
      END IF;
   END PROCESS Mem;

   -----------------------------------------------------------------------------
   -- Here the output register is defined                                     --
   -----------------------------------------------------------------------------
   Res : PROCESS( Clock , s_oe, s_ram_data_out)
   BEGIN
      IF (Clock'event AND (Clock = '1')) THEN
         IF (s_oe = '1') THEN
           DataOut <= s_ram_data_out;
         END IF;
      END IF;
   END PROCESS Res;

END PlatformIndependent;
