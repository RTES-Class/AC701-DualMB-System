proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config  -ruleid {1}  -id {BD 41-1348}  -new_severity {INFO} 
set_msg_config  -ruleid {2}  -id {BD 41-1343}  -new_severity {INFO} 
set_msg_config  -ruleid {3}  -id {BD 41-1306}  -new_severity {INFO} 
set_msg_config  -ruleid {4}  -id {IP_Flow 19-1687}  -new_severity {INFO} 
set_msg_config  -ruleid {5}  -id {filemgmt 20-1763}  -new_severity {INFO} 
set_msg_config  -ruleid {6}  -id {BD 41-1276}  -severity {CRITICAL WARNING}  -new_severity {ERROR} 

start_step init_design
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
  create_project -in_memory -part xc7a200tfbg676-2
  set_property board_part xilinx.com:ac701:part0:1.0 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir D:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.cache/wt [current_project]
  set_property parent.project_path D:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.xpr [current_project]
  set_property ip_repo_paths D:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.ipdefs/library_0 [current_project]
  set_property ip_output_repo D:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.cache/ip [current_project]
  set_property ip_cache_permissions {read write} [current_project]
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  add_files -quiet D:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.runs/synth_1/system_top.dcp
  add_files D:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/system.bmm
  set_property SCOPED_TO_REF system [get_files -all D:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/system.bmm]
  add_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_sys_mb_0/data/mb_bootloop_le.elf
  set_property SCOPED_TO_REF system [get_files -all d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_sys_mb_0/data/mb_bootloop_le.elf]
  set_property SCOPED_TO_CELLS mb0 [get_files -all d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_sys_mb_0/data/mb_bootloop_le.elf]
  add_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_sys_mb_1/data/mb_bootloop_le.elf
  set_property SCOPED_TO_REF system [get_files -all d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_sys_mb_1/data/mb_bootloop_le.elf]
  set_property SCOPED_TO_CELLS mb1 [get_files -all d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_sys_mb_1/data/mb_bootloop_le.elf]
  read_xdc -ref system_sys_mb_0 -cells U0 d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_sys_mb_0/system_sys_mb_0.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_sys_mb_0/system_sys_mb_0.xdc]
  read_xdc -ref system_sys_dlmb_0 -cells U0 d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_sys_dlmb_0/system_sys_dlmb_0.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_sys_dlmb_0/system_sys_dlmb_0.xdc]
  read_xdc -ref system_sys_ilmb_0 -cells U0 d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_sys_ilmb_0/system_sys_ilmb_0.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_sys_ilmb_0/system_sys_ilmb_0.xdc]
  read_xdc -ref system_sys_mb_debug_0 -cells U0 d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_sys_mb_debug_0/system_sys_mb_debug_0.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_sys_mb_debug_0/system_sys_mb_debug_0.xdc]
  read_xdc -prop_thru_buffers -ref system_sys_rstgen_0 -cells U0 d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_sys_rstgen_0/system_sys_rstgen_0_board.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_sys_rstgen_0/system_sys_rstgen_0_board.xdc]
  read_xdc -ref system_sys_rstgen_0 -cells U0 d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_sys_rstgen_0/system_sys_rstgen_0.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_sys_rstgen_0/system_sys_rstgen_0.xdc]
  read_xdc -ref system_axi_ddr_cntrl_0 d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_ddr_cntrl_0/system_axi_ddr_cntrl_0/user_design/constraints/system_axi_ddr_cntrl_0.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_ddr_cntrl_0/system_axi_ddr_cntrl_0/user_design/constraints/system_axi_ddr_cntrl_0.xdc]
  read_xdc -prop_thru_buffers -ref system_sys_ethernet_clkgen_0 -cells inst d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_sys_ethernet_clkgen_0/system_sys_ethernet_clkgen_0_board.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_sys_ethernet_clkgen_0/system_sys_ethernet_clkgen_0_board.xdc]
  read_xdc -ref system_sys_ethernet_clkgen_0 -cells inst d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_sys_ethernet_clkgen_0/system_sys_ethernet_clkgen_0.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_sys_ethernet_clkgen_0/system_sys_ethernet_clkgen_0.xdc]
  read_xdc -prop_thru_buffers -ref bd_55cd_eth_buf_0 -cells U0 d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_ethernet_0/bd_0/ip/ip_0/bd_55cd_eth_buf_0_board.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_ethernet_0/bd_0/ip/ip_0/bd_55cd_eth_buf_0_board.xdc]
  read_xdc -prop_thru_buffers -ref bd_55cd_eth_mac_0 -cells inst d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_ethernet_0/bd_0/ip/ip_1/synth/bd_55cd_eth_mac_0_board.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_ethernet_0/bd_0/ip/ip_1/synth/bd_55cd_eth_mac_0_board.xdc]
  read_xdc -ref bd_55cd_eth_mac_0 -cells inst d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_ethernet_0/bd_0/ip/ip_1/synth/bd_55cd_eth_mac_0.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_ethernet_0/bd_0/ip/ip_1/synth/bd_55cd_eth_mac_0.xdc]
  read_xdc -ref system_axi_ethernet_dma_0 -cells U0 d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_ethernet_dma_0/system_axi_ethernet_dma_0.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_ethernet_dma_0/system_axi_ethernet_dma_0.xdc]
  read_xdc -prop_thru_buffers -ref system_axi_iic_main_0 -cells U0 d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_iic_main_0/system_axi_iic_main_0_board.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_iic_main_0/system_axi_iic_main_0_board.xdc]
  read_xdc -prop_thru_buffers -ref system_axi_uart_0 -cells U0 d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_uart_0/system_axi_uart_0_board.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_uart_0/system_axi_uart_0_board.xdc]
  read_xdc -ref system_axi_uart_0 -cells U0 d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_uart_0/system_axi_uart_0.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_uart_0/system_axi_uart_0.xdc]
  read_xdc -ref system_axi_timer_0 -cells U0 d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_timer_0/system_axi_timer_0.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_timer_0/system_axi_timer_0.xdc]
  read_xdc -prop_thru_buffers -ref system_axi_gpio_lcd_0 -cells U0 d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_gpio_lcd_0/system_axi_gpio_lcd_0_board.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_gpio_lcd_0/system_axi_gpio_lcd_0_board.xdc]
  read_xdc -ref system_axi_gpio_lcd_0 -cells U0 d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_gpio_lcd_0/system_axi_gpio_lcd_0.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_gpio_lcd_0/system_axi_gpio_lcd_0.xdc]
  read_xdc -prop_thru_buffers -ref system_axi_spi_0 -cells U0 d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_spi_0/system_axi_spi_0_board.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_spi_0/system_axi_spi_0_board.xdc]
  read_xdc -ref system_axi_spi_0 -cells U0 d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_spi_0/system_axi_spi_0.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_spi_0/system_axi_spi_0.xdc]
  read_xdc -prop_thru_buffers -ref system_axi_gpio_0 -cells U0 d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_gpio_0/system_axi_gpio_0_board.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_gpio_0/system_axi_gpio_0_board.xdc]
  read_xdc -ref system_axi_gpio_0 -cells U0 d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_gpio_0/system_axi_gpio_0.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_gpio_0/system_axi_gpio_0.xdc]
  read_xdc -ref system_axi_intc_0 -cells U0 d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_intc_0/system_axi_intc_0.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_intc_0/system_axi_intc_0.xdc]
  read_xdc -ref system_axi_hdmi_clkgen_0 -cells inst d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_hdmi_clkgen_0/axi_clkgen_constr.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_hdmi_clkgen_0/axi_clkgen_constr.xdc]
  read_xdc -ref up_xfer_cntrl d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/xilinx/common/up_xfer_cntrl_constr.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/xilinx/common/up_xfer_cntrl_constr.xdc]
  read_xdc -ref ad_rst d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/xilinx/common/ad_rst_constr.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/xilinx/common/ad_rst_constr.xdc]
  read_xdc -ref up_xfer_status d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/xilinx/common/up_xfer_status_constr.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/xilinx/common/up_xfer_status_constr.xdc]
  read_xdc -ref up_clock_mon d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/xilinx/common/up_clock_mon_constr.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/xilinx/common/up_clock_mon_constr.xdc]
  read_xdc -ref system_axi_hdmi_core_0 -cells inst d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_hdmi_core_0/axi_hdmi_tx_constr.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_hdmi_core_0/axi_hdmi_tx_constr.xdc]
  read_xdc -ref system_axi_hdmi_dma_0 -cells U0 d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_hdmi_dma_0/system_axi_hdmi_dma_0.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_hdmi_dma_0/system_axi_hdmi_dma_0.xdc]
  read_xdc -prop_thru_buffers -ref system_sys_audio_clkgen_0 -cells inst d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_sys_audio_clkgen_0/system_sys_audio_clkgen_0_board.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_sys_audio_clkgen_0/system_sys_audio_clkgen_0_board.xdc]
  read_xdc -ref system_sys_audio_clkgen_0 -cells inst d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_sys_audio_clkgen_0/system_sys_audio_clkgen_0.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_sys_audio_clkgen_0/system_sys_audio_clkgen_0.xdc]
  read_xdc -ref system_axi_spdif_tx_core_0 -cells inst d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_spdif_tx_core_0/axi_spdif_tx_constr.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_spdif_tx_core_0/axi_spdif_tx_constr.xdc]
  read_xdc -ref system_axi_spdif_tx_dma_0 -cells U0 d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_spdif_tx_dma_0/system_axi_spdif_tx_dma_0.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_spdif_tx_dma_0/system_axi_spdif_tx_dma_0.xdc]
  read_xdc -ref system_sys_mb_1 -cells U0 d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_sys_mb_1/system_sys_mb_1.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_sys_mb_1/system_sys_mb_1.xdc]
  read_xdc -ref system_dlmb_v10_0 -cells U0 d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_dlmb_v10_0/system_dlmb_v10_0.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_dlmb_v10_0/system_dlmb_v10_0.xdc]
  read_xdc -ref system_ilmb_v10_0 -cells U0 d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_ilmb_v10_0/system_ilmb_v10_0.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_ilmb_v10_0/system_ilmb_v10_0.xdc]
  read_xdc -ref system_sys_mb1_axi_intc_0 -cells U0 d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_sys_mb1_axi_intc_0/system_sys_mb1_axi_intc_0.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_sys_mb1_axi_intc_0/system_sys_mb1_axi_intc_0.xdc]
  read_xdc -ref system_axi_timer_0_0 -cells U0 d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_timer_0_0/system_axi_timer_0_0.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_timer_0_0/system_axi_timer_0_0.xdc]
  read_xdc -ref system_mailbox_0_0 -cells U0 d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_mailbox_0_0/system_mailbox_0_0.xdc
  set_property processing_order EARLY [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_mailbox_0_0/system_mailbox_0_0.xdc]
  read_xdc D:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/imports/FPGA/Analog_HDL/hdl-hdl_2017_r1/projects/common/ac701/ac701_system_constr.xdc
  read_xdc D:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/imports/FPGA/HDMI_AC701/ac701_project_dual/system_constr.xdc
  read_xdc -unmanaged d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_hdmi_clkgen_0/bd/bd.tcl
  read_xdc -ref bd_55cd_eth_buf_0 -cells U0 d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_ethernet_0/bd_0/ip/ip_0/synth/bd_55cd_eth_buf_0.xdc
  set_property processing_order LATE [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_ethernet_0/bd_0/ip/ip_0/synth/bd_55cd_eth_buf_0.xdc]
  read_xdc -ref bd_55cd_eth_mac_0 -cells inst d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_ethernet_0/bd_0/ip/ip_1/synth/bd_55cd_eth_mac_0_clocks.xdc
  set_property processing_order LATE [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_ethernet_0/bd_0/ip/ip_1/synth/bd_55cd_eth_mac_0_clocks.xdc]
  read_xdc -ref system_axi_ethernet_dma_0 -cells U0 d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_ethernet_dma_0/system_axi_ethernet_dma_0_clocks.xdc
  set_property processing_order LATE [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_ethernet_dma_0/system_axi_ethernet_dma_0_clocks.xdc]
  read_xdc -ref system_axi_spi_0 -cells U0 d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_spi_0/system_axi_spi_0_clocks.xdc
  set_property processing_order LATE [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_spi_0/system_axi_spi_0_clocks.xdc]
  read_xdc -ref system_axi_intc_0 -cells U0 d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_intc_0/system_axi_intc_0_clocks.xdc
  set_property processing_order LATE [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_intc_0/system_axi_intc_0_clocks.xdc]
  read_xdc -ref system_axi_hdmi_dma_0 -cells U0 d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_hdmi_dma_0/system_axi_hdmi_dma_0_clocks.xdc
  set_property processing_order LATE [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_hdmi_dma_0/system_axi_hdmi_dma_0_clocks.xdc]
  read_xdc -ref system_sys_audio_clkgen_0 -cells inst d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_sys_audio_clkgen_0/system_sys_audio_clkgen_0_late.xdc
  set_property processing_order LATE [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_sys_audio_clkgen_0/system_sys_audio_clkgen_0_late.xdc]
  read_xdc -ref system_axi_spdif_tx_dma_0 -cells U0 d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_spdif_tx_dma_0/system_axi_spdif_tx_dma_0_clocks.xdc
  set_property processing_order LATE [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_axi_spdif_tx_dma_0/system_axi_spdif_tx_dma_0_clocks.xdc]
  read_xdc -ref system_sys_mb1_axi_intc_0 -cells U0 d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_sys_mb1_axi_intc_0/system_sys_mb1_axi_intc_0_clocks.xdc
  set_property processing_order LATE [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_sys_mb1_axi_intc_0/system_sys_mb1_axi_intc_0_clocks.xdc]
  read_xdc -ref system_auto_us_df_0 -cells inst d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_auto_us_df_0/system_auto_us_df_0_clocks.xdc
  set_property processing_order LATE [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_auto_us_df_0/system_auto_us_df_0_clocks.xdc]
  read_xdc -ref system_auto_us_df_1 -cells inst d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_auto_us_df_1/system_auto_us_df_1_clocks.xdc
  set_property processing_order LATE [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_auto_us_df_1/system_auto_us_df_1_clocks.xdc]
  read_xdc -ref system_auto_us_df_2 -cells inst d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_auto_us_df_2/system_auto_us_df_2_clocks.xdc
  set_property processing_order LATE [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_auto_us_df_2/system_auto_us_df_2_clocks.xdc]
  read_xdc -ref system_auto_us_df_3 -cells inst d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_auto_us_df_3/system_auto_us_df_3_clocks.xdc
  set_property processing_order LATE [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_auto_us_df_3/system_auto_us_df_3_clocks.xdc]
  read_xdc -ref system_auto_us_df_4 -cells inst d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_auto_us_df_4/system_auto_us_df_4_clocks.xdc
  set_property processing_order LATE [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_auto_us_df_4/system_auto_us_df_4_clocks.xdc]
  read_xdc -ref system_auto_us_df_5 -cells inst d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_auto_us_df_5/system_auto_us_df_5_clocks.xdc
  set_property processing_order LATE [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_auto_us_df_5/system_auto_us_df_5_clocks.xdc]
  read_xdc -ref system_auto_us_df_6 -cells inst d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_auto_us_df_6/system_auto_us_df_6_clocks.xdc
  set_property processing_order LATE [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_auto_us_df_6/system_auto_us_df_6_clocks.xdc]
  read_xdc -ref system_auto_us_df_7 -cells inst d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_auto_us_df_7/system_auto_us_df_7_clocks.xdc
  set_property processing_order LATE [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_auto_us_df_7/system_auto_us_df_7_clocks.xdc]
  read_xdc -ref system_auto_us_df_8 -cells inst d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_auto_us_df_8/system_auto_us_df_8_clocks.xdc
  set_property processing_order LATE [get_files d:/WORKSPACE/FPGA/Final_Project_RTES/Final_Project_RTES.srcs/sources_1/bd/system/ip/system_auto_us_df_8/system_auto_us_df_8_clocks.xdc]
  link_design -top system_top -part xc7a200tfbg676-2
  write_hwdef -file system_top.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
  unset ACTIVE_STEP 
}

start_step opt_design
set ACTIVE_STEP opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force system_top_opt.dcp
  catch { report_drc -file system_top_drc_opted.rpt }
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
  unset ACTIVE_STEP 
}

start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design -directive ExtraTimingOpt
  write_checkpoint -force system_top_placed.dcp
  catch { report_io -file system_top_io_placed.rpt }
  catch { report_utilization -file system_top_utilization_placed.rpt -pb system_top_utilization_placed.pb }
  catch { report_control_sets -verbose -file system_top_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

start_step phys_opt_design
set ACTIVE_STEP phys_opt_design
set rc [catch {
  create_msg_db phys_opt_design.pb
  phys_opt_design -directive Explore
  write_checkpoint -force system_top_physopt.dcp
  close_msg_db -file phys_opt_design.pb
} RESULT]
if {$rc} {
  step_failed phys_opt_design
  return -code error $RESULT
} else {
  end_step phys_opt_design
  unset ACTIVE_STEP 
}

start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design -directive Explore
  write_checkpoint -force system_top_routed.dcp
  catch { report_drc -file system_top_drc_routed.rpt -pb system_top_drc_routed.pb -rpx system_top_drc_routed.rpx }
  catch { report_methodology -file system_top_methodology_drc_routed.rpt -rpx system_top_methodology_drc_routed.rpx }
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file system_top_timing_summary_routed.rpt -rpx system_top_timing_summary_routed.rpx }
  catch { report_power -file system_top_power_routed.rpt -pb system_top_power_summary_routed.pb -rpx system_top_power_routed.rpx }
  catch { report_route_status -file system_top_route_status.rpt -pb system_top_route_status.pb }
  catch { report_clock_utilization -file system_top_clock_utilization_routed.rpt }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  write_checkpoint -force system_top_routed_error.dcp
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
  unset ACTIVE_STEP 
}

start_step write_bitstream
set ACTIVE_STEP write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  catch { write_mem_info -force system_top.mmi }
  catch { write_bmm -force system_top_bd.bmm }
  write_bitstream -force -no_partial_bitfile system_top.bit 
  catch { write_sysdef -hwdef system_top.hwdef -bitfile system_top.bit -meminfo system_top.mmi -file system_top.sysdef }
  catch {write_debug_probes -quiet -force debug_nets}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
  unset ACTIVE_STEP 
}

