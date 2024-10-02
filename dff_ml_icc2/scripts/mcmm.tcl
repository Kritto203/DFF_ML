#----------------------------------------------------------------------------------------
# Removing corners, modes and scenarios
#----------------------------------------------------------------------------------------
remove_corners -all
remove_modes -all
remove_scenarios -all 

#----------------------------------------------------------------------------------------
# Setup corners, tluplus files
#----------------------------------------------------------------------------------------
create_corner slow
create_corner fast

source ../scripts/setup_tlup.tcl
##setup_tlup $tluplus_min $tluplus_max $tluplus_map
setup_tlup ../ref/tech/star_rc/min/saed14nm_1p9m_Cmin.tluplus ../ref/tech/star_rc/max/saed14nm_1p9m_Cmax.tluplus ../ref/tech/star_rc/saed14nm_tf_itf_tluplus.map


#----------------------------------------------------------------------------------------
# Setup modes and scenarios
#----------------------------------------------------------------------------------------
create_mode func
current_mode func 
create_scenario -mode func -corner fast -name func_fast
create_scenario -mode func -corner slow -name func_slow

set_scenario_status func_slow -hold true -setup true -active true
set_scenario_status func_fast -hold true -setup false -active true

#----------------------------------------------------------------------------------------
# Read constraints 
#----------------------------------------------------------------------------------------
current_scenario func_fast
create_clock [get_ports clk]  -period 1


######read options

current_scenario func_slow
create_clock [get_ports clk]  -period 0.3
set_clock_uncertainty 0.05  [get_clocks clk]
set_clock_transition -rise 0.02 [get_clocks clk]
set_clock_transition -fall 0.02 [get_clocks clk]

set_app_options -name place.coarse.continue_on_missing_scandef -value true

