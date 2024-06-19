# 
# Synthesis run script generated by Vivado
# 

create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/lrzbl/Desktop/fpga2.odev/TAB/TAB.cache/wt [current_project]
set_property parent.project_path C:/Users/lrzbl/Desktop/fpga2.odev/TAB/TAB.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part digilentinc.com:nexys4_ddr:part0:1.1 [current_project]
set_property ip_output_repo c:/Users/lrzbl/Desktop/fpga2.odev/TAB/TAB.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib C:/Users/lrzbl/Desktop/fpga2.odev/TAB/TAB.srcs/sources_1/bd/TAB/hdl/TAB_wrapper.vhd
add_files C:/Users/lrzbl/Desktop/fpga2.odev/TAB/TAB.srcs/sources_1/bd/TAB/TAB.bd
set_property used_in_implementation false [get_files -all c:/Users/lrzbl/Desktop/fpga2.odev/TAB/TAB.srcs/sources_1/bd/TAB/ip/TAB_microblaze_0_0/TAB_microblaze_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/lrzbl/Desktop/fpga2.odev/TAB/TAB.srcs/sources_1/bd/TAB/ip/TAB_microblaze_0_0/TAB_microblaze_0_0_ooc_debug.xdc]
set_property used_in_implementation false [get_files -all c:/Users/lrzbl/Desktop/fpga2.odev/TAB/TAB.srcs/sources_1/bd/TAB/ip/TAB_microblaze_0_0/TAB_microblaze_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/lrzbl/Desktop/fpga2.odev/TAB/TAB.srcs/sources_1/bd/TAB/ip/TAB_mdm_1_0/TAB_mdm_1_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/lrzbl/Desktop/fpga2.odev/TAB/TAB.srcs/sources_1/bd/TAB/ip/TAB_mdm_1_0/TAB_mdm_1_0_ooc_trace.xdc]
set_property used_in_implementation false [get_files -all c:/Users/lrzbl/Desktop/fpga2.odev/TAB/TAB.srcs/sources_1/bd/TAB/ip/TAB_clk_wiz_1_0/TAB_clk_wiz_1_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/lrzbl/Desktop/fpga2.odev/TAB/TAB.srcs/sources_1/bd/TAB/ip/TAB_clk_wiz_1_0/TAB_clk_wiz_1_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/lrzbl/Desktop/fpga2.odev/TAB/TAB.srcs/sources_1/bd/TAB/ip/TAB_clk_wiz_1_0/TAB_clk_wiz_1_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/lrzbl/Desktop/fpga2.odev/TAB/TAB.srcs/sources_1/bd/TAB/ip/TAB_rst_clk_wiz_1_100M_0/TAB_rst_clk_wiz_1_100M_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/lrzbl/Desktop/fpga2.odev/TAB/TAB.srcs/sources_1/bd/TAB/ip/TAB_rst_clk_wiz_1_100M_0/TAB_rst_clk_wiz_1_100M_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/lrzbl/Desktop/fpga2.odev/TAB/TAB.srcs/sources_1/bd/TAB/ip/TAB_rst_clk_wiz_1_100M_0/TAB_rst_clk_wiz_1_100M_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/lrzbl/Desktop/fpga2.odev/TAB/TAB.srcs/sources_1/bd/TAB/ip/TAB_axi_gpio_0_0/TAB_axi_gpio_0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/lrzbl/Desktop/fpga2.odev/TAB/TAB.srcs/sources_1/bd/TAB/ip/TAB_axi_gpio_0_0/TAB_axi_gpio_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/lrzbl/Desktop/fpga2.odev/TAB/TAB.srcs/sources_1/bd/TAB/ip/TAB_axi_gpio_0_0/TAB_axi_gpio_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/lrzbl/Desktop/fpga2.odev/TAB/TAB.srcs/sources_1/bd/TAB/ip/TAB_xbar_0/TAB_xbar_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/lrzbl/Desktop/fpga2.odev/TAB/TAB.srcs/sources_1/bd/TAB/ip/TAB_auto_pc_1/TAB_auto_pc_1_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/lrzbl/Desktop/fpga2.odev/TAB/TAB.srcs/sources_1/bd/TAB/ip/TAB_auto_pc_0/TAB_auto_pc_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/lrzbl/Desktop/fpga2.odev/TAB/TAB.srcs/sources_1/bd/TAB/ip/TAB_dlmb_v10_0/TAB_dlmb_v10_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/lrzbl/Desktop/fpga2.odev/TAB/TAB.srcs/sources_1/bd/TAB/ip/TAB_dlmb_v10_0/TAB_dlmb_v10_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/lrzbl/Desktop/fpga2.odev/TAB/TAB.srcs/sources_1/bd/TAB/ip/TAB_ilmb_v10_0/TAB_ilmb_v10_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/lrzbl/Desktop/fpga2.odev/TAB/TAB.srcs/sources_1/bd/TAB/ip/TAB_ilmb_v10_0/TAB_ilmb_v10_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/lrzbl/Desktop/fpga2.odev/TAB/TAB.srcs/sources_1/bd/TAB/ip/TAB_dlmb_bram_if_cntlr_0/TAB_dlmb_bram_if_cntlr_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/lrzbl/Desktop/fpga2.odev/TAB/TAB.srcs/sources_1/bd/TAB/ip/TAB_ilmb_bram_if_cntlr_0/TAB_ilmb_bram_if_cntlr_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/lrzbl/Desktop/fpga2.odev/TAB/TAB.srcs/sources_1/bd/TAB/ip/TAB_lmb_bram_0/TAB_lmb_bram_0_ooc.xdc]
set_property used_in_implementation false [get_files -all C:/Users/lrzbl/Desktop/fpga2.odev/TAB/TAB.srcs/sources_1/bd/TAB/TAB_ooc.xdc]
set_property is_locked true [get_files C:/Users/lrzbl/Desktop/fpga2.odev/TAB/TAB.srcs/sources_1/bd/TAB/TAB.bd]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{C:/Users/lrzbl/Desktop/FPGA5HAFTA/Chu Codes/constraint/Nexys4_DDR_chu.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/lrzbl/Desktop/FPGA5HAFTA/Chu Codes/constraint/Nexys4_DDR_chu.xdc}}]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

synth_design -top TAB_wrapper -part xc7a100tcsg324-1


write_checkpoint -force -noxdef TAB_wrapper.dcp

catch { report_utilization -file TAB_wrapper_utilization_synth.rpt -pb TAB_wrapper_utilization_synth.pb }
