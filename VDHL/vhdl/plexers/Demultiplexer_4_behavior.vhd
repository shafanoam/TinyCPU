--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Noam_FPGA_CPU                                                ==
--== Component : Demultiplexer_4                                              ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE PlatformIndependent OF Demultiplexer_4 IS 

   -----------------------------------------------------------------------------
   -- Here all used signals are defined                                       --
   -----------------------------------------------------------------------------

BEGIN
   DemuxOut_0  <= DemuxIn WHEN sel =   "00"  AND
                               Enable = '1' ELSE '0';
   DemuxOut_1  <= DemuxIn WHEN sel =   "01"  AND
                               Enable = '1' ELSE '0';
   DemuxOut_2  <= DemuxIn WHEN sel =   "10"  AND
                               Enable = '1' ELSE '0';
   DemuxOut_3  <= DemuxIn WHEN sel =   "11"  AND
                               Enable = '1' ELSE '0';
END PlatformIndependent;
