--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : Multiplexer_bus_8                                            ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE PlatformIndependent OF Multiplexer_bus_8 IS 

   -----------------------------------------------------------------------------
   -- Here all used signals are defined                                       --
   -----------------------------------------------------------------------------

BEGIN
   make_mux : PROCESS( Enable,
                       MuxIn_0,
                       MuxIn_1,
                       MuxIn_2,
                       MuxIn_3,
                       MuxIn_4,
                       MuxIn_5,
                       MuxIn_6,
                       MuxIn_7,
                       Sel )
   BEGIN
      IF (Enable = '0') THEN
         MuxOut <= (OTHERS => '0');
                        ELSE
         CASE (Sel) IS
            WHEN   "000" => MuxOut <= MuxIn_0;
            WHEN   "001" => MuxOut <= MuxIn_1;
            WHEN   "010" => MuxOut <= MuxIn_2;
            WHEN   "011" => MuxOut <= MuxIn_3;
            WHEN   "100" => MuxOut <= MuxIn_4;
            WHEN   "101" => MuxOut <= MuxIn_5;
            WHEN   "110" => MuxOut <= MuxIn_6;
            WHEN OTHERS  => MuxOut <= MuxIn_7;
         END CASE;
      END IF;
   END PROCESS make_mux;
END PlatformIndependent;
