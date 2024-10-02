###################################################################

## Timing Constraints


create_clock -period 2 [get_ports clk] -waveform {0 1}
set_clock_uncertainty 0.02 [get_clocks clk]

# Set clock transition times
set_clock_transition -rise 0.05 [get_clocks clk]
set_clock_transition -fall 0.05 [get_clocks clk]

# Set input delay for data input D
set_input_delay -clock [get_clocks clk] 0.5 [get_ports D]

# Set output delays for outputs Q and Qbar
set_output_delay -clock [get_clocks clk] 0.5 [get_ports Q]
set_output_delay -clock [get_clocks clk] 0.5 [get_ports Qbar]

# Set driving cell for clock signal
set_driving_cell -lib_cell SAEDRVT14_BUF_10 -pin X [get_ports clk]

# Optionally set driving cell for data input (if needed)
# set_driving_cell -lib_cell SAEDRVT14_FDPRBQ_V2_0P5 -pin D [get_ports D]

# Set load capacitance for ports
set_load 0.004 [get_ports D]
set_load 0.004 [get_ports Q]
set_load 0.004 [get_ports Qbar]

