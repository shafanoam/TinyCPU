--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : Multiplexer_bus_2                                            ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE PlatformIndependent OF Multiplexer_bus_2 IS 

   -----------------------------------------------------------------------------
   -- Here all used signals are defined                                       --
   -----------------------------------------------------------------------------

BEGIN
   make_mux : PROCESS( Enable,
                       MuxIn_0,
                       MuxIn_1,
                       Sel )
   BEGIN
      IF (Enable = '0') THEN
         MuxOut <= (OTHERS => '0');
                        ELSE
         CASE (Sel) IS
            WHEN    '0'  => MuxOut <= MuxIn_0;
            WHEN OTHERS  => MuxOut <= MuxIn_1;
         END CASE;
      END IF;
   END PROCESS make_mux;
END PlatformIndependent;
