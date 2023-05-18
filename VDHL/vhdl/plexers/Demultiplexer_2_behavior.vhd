--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : Demultiplexer_2                                              ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE PlatformIndependent OF Demultiplexer_2 IS 

   -----------------------------------------------------------------------------
   -- Here all used signals are defined                                       --
   -----------------------------------------------------------------------------

BEGIN
   DemuxOut_0  <= DemuxIn WHEN sel =    '0'  AND
                               Enable = '1' ELSE '0';
   DemuxOut_1  <= DemuxIn WHEN sel =    '1'  AND
                               Enable = '1' ELSE '0';
END PlatformIndependent;
