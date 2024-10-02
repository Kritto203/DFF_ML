set NDM_LIBS {}
set FRAME_LIBS {/home/Workspace/VLSI_LAB_2024/trangnguyen_2024June/synopsys_design_flow_labs/lab03_ic_compilerII/ref/lib/NDM/saed14rvt_frame_only.ndm}
set LEF_FILES {}
set DB_FILES {/home/Workspace/VLSI_LAB_2024/trangnguyen_2024June/synopsys_design_flow_labs/lab03_ic_compilerII/ref/lib/db_nldm/saed14rvt_tt0p8v25c.db}
set TECH_FILE "/home/Workspace/VLSI_LAB_2024/trangnguyen_2024June/synopsys_design_flow_labs/lab03_ic_compilerII/ref/tech/NDM/saed14rvt_1p9m.tf"

source -echo -verbose /home/Workspace/VLSI_LAB_2024/trangnguyen_2024June/synopsys_design_flow_labs/lab03_ic_compilerII/ref/lib/db_nldm/saed14rvt_tt0p8v25c.db

set_app_options -name lib.workspace.create_cached_lib -value true
#suppress_messages

set_app_options -name lib.workspace.allow_read_aggregate_lib -value true
create_workspace saed14rvt_tt0p8v25c -scale_factor 10000
foreach frame $FRAME_LIBS {
  read_ndm $frame
}
read_db $DB_FILES
process_workspaces -check_options {-allow_missing} -force -directory /home/Workspace/VLSI_LAB_2024/trangnguyen_2024June/synopsys_design_flow_labs/lab03_ic_compilerII/ref/lib/NDM/saed14rvt_frame_only.ndm -output saed14rvt_tt0p8v25c.ndm
