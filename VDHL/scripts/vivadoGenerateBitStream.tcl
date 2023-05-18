open_project -verbose C:/Users/Michael/logisim_evolution_workspace/Noam_FPGA_CPU/main/sandbox//vp/vp.xpr
update_compile_order -fileset sources_1
launch_runs synth_1
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
exit
