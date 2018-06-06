
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Adder -dir "F:/PROJECTS/NARSS/Adder/Adder/planAhead_run_4" -part xc7a100tcsg324-1
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "Adder.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {../Adder.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top Adder $srcset
add_files [list {Adder.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc7a100tcsg324-1
