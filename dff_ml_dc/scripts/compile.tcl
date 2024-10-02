
# these can be also set in .synopsys_dc.setup file in working directory
# always keep the asterisk in link_library
set target_library  {../ref/db_nldm/saed14rvt_tt0p8v25c.db   }
set link_library    {* ../ref/db_nldm/saed14rvt_tt0p8v25c.db }


read_verilog ../source/DFF.v
read_verilog  ../source/DFF_ML.v

## read command can be replaced with:
#analyze -library WORK -format verilog {../source/DFF_ML.v}
#elaborate Johnson_count -architecture verilog -library DEFAULT

link
check_design

read_sdc ../source/DFF_ML.sdc		
compile -exact_map

report_area  > ../results/rpt.area.report
report_constraint > ../results/rpt.constraints.report
report_timing > ../results/rpt.timing.report
report_qor > ../results/rpt.qor.report

change_names -rule verilog
write -hierarchy -format verilog -output ../results/DFF_ML_compiled.v
write -hierarchy -format ddc  -output ../results/DFF_compiled.ddc

#exit
