set_app_var link_library ../ref/lib/db_nldm/saed14rvt_tt0p8v25c.db

if {![file exists "DFF_ML/"]} {
	create_lib DFF_ML -technology ../ref/tech/NDM/saed14rvt_1p9m.tf -ref_libs ../ref/lib/NDM/saed14rvt_frame_only.ndm/
}
read_verilog ../source/DFF_ML_compiled.v

set_attribute [get_layers M1] routing_direction horizontal
set_attribute [get_layers M2] routing_direction horizontal
set_attribute [get_layers M3] routing_direction vertical
set_attribute [get_layers M4] routing_direction horizontal
set_attribute [get_layers M5] routing_direction vertical
set_attribute [get_layers M6] routing_direction horizontal
set_attribute [get_layers M7] routing_direction vertical
set_attribute [get_layers M8] routing_direction horizontal
set_attribute [get_layers M9] routing_direction vertical
set_attribute [get_layers MRDL] routing_direction horizontal 



initialize_floorplan
remove_track -all

create_track -layer [get_layers M1] -space 0.06 -width 0.034 -dir Y -bbox {{{0.000 0.000} {3.552 3.000}}} -mask_pattern {mask_one mask_two} -coord 0
create_track -layer [get_layers M2] -space 0.06 -width 0.034 -dir Y -bbox {{{0.000 0.000} {3.552 3.000}}} -mask_pattern {mask_one mask_two} -coord 0
create_track -layer [get_layers M4] -space 0.06 -width 0.034 -dir Y -bbox {{{0.000 0.000} {3.552 3.000}}} -coord 0
create_track -layer [get_layers M6] -space 0.06 -width 0.034 -dir Y -bbox {{{0.000 0.000} {3.552 3.000}}} -coord 0
create_track -layer [get_layers M8] -space 0.06 -width 0.034 -dir Y -bbox {{{0.000 0.000} {3.552 3.000}}} -coord 0
create_track -layer [get_layers MRDL] -space 0.06 -width 0.034 -dir Y -bbox {{{0.000 0.000} {3.552 3.000}}} -coord 0
create_track -layer [get_layers M3] -space 0.074 -width 0.0340 -dir X -bbox {{{0.000 0.000} {3.552 3.000}}} -mask_pattern {mask_one mask_two} -coord 0
create_track -layer [get_layers M5] -space 0.074 -width 0.0340 -dir X -bbox {{{0.000 0.000} {3.552 3.000}}} -coord 0
create_track -layer [get_layers M7] -space 0.074 -width 0.0340 -dir X -bbox {{{0.000 0.000} {3.552 3.000}}} -coord 0
create_track -layer [get_layers M9] -space 0.074 -width 0.0340 -dir X -bbox {{{0.000 0.000} {3.552 3.000}}} -coord 0



##//Power Ground Straps

source ../scripts/pg_core_straps.tcl
source ../scripts/mcmm.tcl
create_placement -floorplan
legalize_placement
clock_opt
route_auto
add_redundant_vias

create_stdcell_fillers -lib_cells {*/SAEDRVT14_FILL16 */SAEDRVT14_FILL2 */SAEDRVT14_FILL3 */SAEDRVT14_FILL32 */SAEDRVT14_FILL4 */SAEDRVT14_FILL5 */SAEDRVT14_FILL64 */SAEDRVT14_FILL_ECO_1 */SAEDRVT14_FILL_ECO_12 */SAEDRVT14_FILL_ECO_15 */SAEDRVT14_FILL_ECO_18 */SAEDRVT14_FILL_ECO_2 */SAEDRVT14_FILL_ECO_3 */SAEDRVT14_FILL_ECO_6 */SAEDRVT14_FILL_ECO_9 */SAEDRVT14_FILL_NNWIV1Y2_2 */SAEDRVT14_FILL_NNWIV1Y2_3 */SAEDRVT14_FILL_NNWIY2_2 */SAEDRVT14_FILL_NNWIY2_3 */SAEDRVT14_FILL_NNWSPACERY2_7 */SAEDRVT14_FILL_NNWVDDBRKY2_3 */SAEDRVT14_FILLP2 */SAEDRVT14_FILLP3 */SAEDRVT14_FILL_SPACER_7 */SAEDRVT14_FILL_Y2_3}

route_auto
change_selection [get_nets all]
add_redundant_vias

check_legality
check_routes
check_pg_missing_vias

puts "STARTING" 
puts "STARTING"
puts "STARTING"

save_block
set_app_options -name signoff.check_drc.runset -value "../ref/tech/icv_drc/saed14nm_1p9m_drc_rules.rs"
signoff_check_drc

check_lvs -nets [get_nets] -checks {short open} -check_child_cells true -report_floating_pins true -open_reporting detailed > DFF_ML.err

write_parasitics -output ../results/DFF_ML.spef -no_name_mapping -compress -hierarchical -rde_corr -format spef

write_verilog ../results/DFF_ML_Compiled.v -include all

set design DFF_ML
set gdsout_map ../ref/tech/saed14nm_1p9m_gdsout_mw_icc2.map
set gds_files ../ref/tech/saed14_rvt.gds


write_gds	-design $design 		-layer_map $gdsout_map 		-output_pin all 		-hierarchy all		-keep_data_type 		-merge_files $gds_files		-merge_gds_top_cell $design		-units 2000		-lib_cell_view frame	-allow_design_mismatch	DFF_ML_compiled.gds



