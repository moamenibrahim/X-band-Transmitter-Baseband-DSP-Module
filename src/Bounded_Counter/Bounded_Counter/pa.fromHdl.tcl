
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Bounded_Counter -dir "F:/PROJECTS/NARSS/Bounded_Counter/Bounded_Counter/planAhead_run_1" -part xc7a100tcsg324-1
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "Counter.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {bounded_counter.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top Counter $srcset
add_files [list {Counter.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc7a100tcsg324-1
