
set target_library  {../ref/db_nldm/saed14rvt_tt0p8v25c.db   }
set link_library    {* ../ref/db_nldm/saed14rvt_tt0p8v25c.db }

remove_design -all
set test_default_scan_style

read_verilog ../source/DFF_dft.v
read_verilog ../source/DFF_ML_dft.v

read_sdc ../source/DFF_ML.sdc

set_dft_signal -view exist -type ScanMasterClock -timing {45 55} -port clk
set_dft_signal -view exist -type ScanEnable -active 1 -port scan_enable
report_dft_signal -view exist

create_test_protocol
dft_drc
write_test_protocol -out ../results/DFF_ML_dft.spf

create_clock clk -period 1000
set_input_delay 250 scan_in -clock clk
set_input_delay 150 scan_enable -clock clk
compile -scan
link

read_test_protocol ../results/DFF_ML_dft.spf
set_dft_signal -view exist -type ScanMasterClock -timing {45 55} -port clk
set_dft_signal -view exist -port scan_enable  -type ScanEnable  -active_state 1 
set_dft_insertion_configuration -preserve_design_name true

set_dft_signal -view spec -port scan_in -type ScanDataIn
set_dft_signal -view spec -port scan_out -type ScanDataOut
set_scan_configuration -chain_count 1
preview_dft
insert_dft

set_fix_multiple_port_nets -all -buffer_constants
compile -scan -incremental

dft_drc -coverage_estimate > ../results/rpt.dft.drc_coverage
report_area > ../results/rpt.dft.area.report
report_timing > ../results/rpt.dft.timing.report
report_qor > ../results/rpt.dft.qor.report



write -format ddc -h  -o ../results/DFF_ML_dft_compiled.ddc
write -format verilog -h  -o ../results/DFF_ML_dft_compiled.v
write_sdf  ../results/DFF_ML_dft.sdf

exit

