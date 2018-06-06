
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name Adder -dir "F:/PROJECTS/NARSS/Adder/Adder/planAhead_run_5" -part xc7a100tcsg324-1
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "F:/PROJECTS/NARSS/Adder/Adder/Adder.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {F:/PROJECTS/NARSS/Adder/Adder} }
set_property target_constrs_file "Adder.ucf" [current_fileset -constrset]
add_files [list {Adder.ucf}] -fileset [get_property constrset [current_run]]
link_design
