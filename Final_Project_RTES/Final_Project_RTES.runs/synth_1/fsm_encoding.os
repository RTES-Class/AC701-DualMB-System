
 add_fsm_encoding \
       {mig_7series_v4_0_ddr_phy_wrlvl.wl_state_r} \
       { }  \
       {{00000 0000000000000000000000000001} {00001 0000000000000000000000000010} {00010 0000000000000000000000000100} {00011 0000000000000000000000100000} {00100 0000000000000000000001000000} {00101 0000000000000000000100000000} {00110 0000000000000000010000000000} {00111 0000000000000000100000000000} {01000 0000000000000000000010000000} {01001 0001000000000000000000000000} {01010 1000000000000000000000000000} {01011 0010000000000000000000000000} {01100 0100000000000000000000000000} {01101 0000000000100000000000000000} {01110 0000000000000000000000001000} {01111 0000000000001000000000000000} {10000 0000000000000000000000010000} {10001 0000001000000000000000000000} {10010 0000010000000000000000000000} {10011 0000100000000000000000000000} {10100 0000000000010000000000000000} {10101 0000000001000000000000000000} {10110 0000000010000000000000000000} {10111 0000000000000001000000000000} {11000 0000000000000010000000000000} {11001 0000000000000000001000000000} {11010 0000000000000100000000000000} {11011 0000000100000000000000000000} }

 add_fsm_encoding \
       {mig_7series_v4_0_ddr_phy_dqs_found_cal_hr.fine_adj_state_r} \
       { }  \
       {{0000 0000000000000001} {0001 0000000000001000} {0010 0000000000010000} {0011 0000000000000010} {0100 0000000000100000} {0101 0000000001000000} {0110 0000000010000000} {0111 0000000100000000} {1000 0000001000000000} {1001 0000010000000000} {1010 1000000000000000} {1011 0000100000000000} {1100 0001000000000000} {1101 0010000000000000} {1110 0100000000000000} {1111 0000000000000100} }

 add_fsm_encoding \
       {mig_7series_v4_0_ddr_phy_rdlvl.cal1_state_r} \
       { }  \
       {{000000 00000000000000000000000000000000001} {000001 00000000000000000000000000000000100} {000010 00000000000000000000000000000100000} {000011 00000000000000000100000000000000000} {000100 00000000000000100000000000000000000} {000101 00000000000010000000000000000000000} {000110 00000000000100000000000000000000000} {000111 00000000001000000000000000000000000} {001000 00000000000000010000000000000000000} {001001 00000001000000000000000000000000000} {001010 00000010000000000000000000000000000} {001011 00000000010000000000000000000000000} {001100 00000000000000000000000000000010000} {001101 00001000000000000000000000000000000} {001110 00010000000000000000000000000000000} {001111 01000000000000000000000000000000000} {010000 00000000000000000000000000001000000} {010001 00000000000000000000000000010000000} {010010 00000000000000000000000001000000000} {010011 00000000000000000000000100000000000} {010100 00000000000000000000000000100000000} {010101 00000000000000000000001000000000000} {010110 00000000000000000000010000000000000} {010111 00000000000000000000100000000000000} {011000 00000000000000000001000000000000000} {011001 00000000000000000000000010000000000} {011010 00000000000000000010000000000000000} {011011 10000000000000000000000000000000000} {011100 00000000000001000000000000000000000} {011101 00000000000000000000000000000000010} {011110 00000000000000001000000000000000000} {011111 00000000000000000000000000000001000} {100000 00100000000000000000000000000000000} {100001 00000000100000000000000000000000000} {100010 00000100000000000000000000000000000} }

 add_fsm_encoding \
       {mig_7series_v4_0_axi_mc_r_channel.state} \
       { }  \
       {{00 1000} {01 0100} {10 0001} {11 0010} }

 add_fsm_encoding \
       {rx_axistream_if.rxs_axistream_current_state} \
       { }  \
       {{00000 0000000000000000000000000001} {00001 0000000000000000000000000010} {00010 0000000000000000000000000100} {00011 0000000000000000000000001000} {00100 0000000000000000000000010000} {00101 0000000000000000010000000000} {00110 0000000000000000000010000000} {00111 0000000000000000000000100000} {01000 0000000000000000000001000000} {01001 0000000000000000001000000000} {01010 0000000000000000000100000000} {01011 0000000000000000100000000000} {01100 0000000000000001000000000000} {01101 0000000000000010000000000000} {01110 0000000000000100000000000000} {01111 0000000000001000000000000000} {10000 0000000000010000000000000000} {10001 0000000000100000000000000000} {10010 0000000001000000000000000000} {10011 0000000010000000000000000000} {10100 0000000100000000000000000000} {10101 0000001000000000000000000000} {10110 0000010000000000000000000000} {10111 0000100000000000000000000000} {11000 0001000000000000000000000000} {11001 0010000000000000000000000000} {11010 0100000000000000000000000000} {11011 1000000000000000000000000000} }

 add_fsm_encoding \
       {rx_axistream_if.rxd_axistream_current_state} \
       { }  \
       {{0000 000000001} {0001 000000010} {0010 000000100} {0011 000100000} {0100 001000000} {0101 010000000} {0110 100000000} {0111 000001000} {1000 000010000} }

 add_fsm_encoding \
       {rx_emac_if.receive_frame_current_state} \
       { }  \
       {{0000 0000000000001} {0001 0000000000010} {0010 0000000000100} {0011 0000000001000} {0100 0000000010000} {0101 0100000000000} {0110 0000000100000} {0111 0000001000000} {1000 0000010000000} {1001 0000100000000} {1010 0001000000000} {1011 0010000000000} {1100 1000000000000} }

 add_fsm_encoding \
       {tx_basic_if.txd_wr_cs} \
       { }  \
       {{000 00000001} {001 00000010} {010 00000100} {011 00001000} {100 01000000} {101 00010000} {110 00100000} {111 10000000} }

 add_fsm_encoding \
       {tx_basic_if.txc_wr_cs} \
       { }  \
       {{0000 000000000000001} {0001 000000000000010} {0010 000000000000100} {0011 000000000001000} {0100 000000000010000} {0101 100000000000000} {0110 000000000100000} {0111 000000001000000} {1000 000000010000000} {1001 000001000000000} {1010 000000100000000} {1011 000010000000000} {1100 010000000000000} {1101 001000000000000} {1110 000100000000000} }

 add_fsm_encoding \
       {tx_emac_if.txc_rd_cs} \
       { }  \
       {{000 00000001} {001 00000010} {010 00000100} {011 00001000} {100 00010000} {101 00100000} {110 01000000} {111 10000000} }

 add_fsm_encoding \
       {tx_emac_if.txd_rd_cs} \
       { }  \
       {{00000 000000001} {01001 000000010} {01010 000000100} {01011 000001000} {01100 000010000} {01101 000100000} {01110 001000000} {10000 010000000} {10001 100000000} }

 add_fsm_encoding \
       {bd_55cd_eth_mac_0_support_resets.idelay_reset_cnt} \
       { }  \
       {{0000 0000000000001} {0001 0000000000010} {0010 0000000000100} {0011 0000000001000} {0100 0000000010000} {0101 0000000100000} {0110 0000001000000} {0111 0000010000000} {1000 0000100000000} {1001 0001000000000} {1010 0010000000000} {1011 0100000000000} {1100 1000000000000} }

 add_fsm_encoding \
       {tri_mode_ethernet_mac_v9_0_6_pfc_tx_cntl.legacy_state} \
       { }  \
       {{000 0001} {001 0010} {010 0100} {011 1000} }

 add_fsm_encoding \
       {axi_datamover_pcc.sig_pcc_sm_state} \
       { }  \
       {{000 00000001} {001 00000010} {010 00000100} {011 00001000} {100 00010000} {101 00100000} {110 01000000} {111 10000000} }

 add_fsm_encoding \
       {axi_datamover_pcc__parameterized0.sig_pcc_sm_state} \
       { }  \
       {{000 00000001} {001 00000010} {010 00000100} {011 00001000} {100 00010000} {101 00100000} {110 01000000} {111 10000000} }

 add_fsm_encoding \
       {axi_datamover_s2mm_realign.sig_cmdcntl_sm_state} \
       { }  \
       {{000 00001} {001 00010} {010 00100} {011 01000} {101 10000} }

 add_fsm_encoding \
       {axi_dma_mm2s_sm.mm2s_cs} \
       { }  \
       {{00 001} {01 010} {11 100} }

 add_fsm_encoding \
       {axi_dma_s2mm_sm.GEN_SM_FOR_LENGTH.s2mm_cs} \
       { }  \
       {{000 00001} {001 00010} {010 00100} {011 01000} {100 10000} }

 add_fsm_encoding \
       {axi_datamover_pcc__parameterized1.sig_pcc_sm_state} \
       { }  \
       {{000 00000001} {001 00000010} {010 00000100} {011 00001000} {100 00010000} {101 00100000} {110 01000000} {111 10000000} }

 add_fsm_encoding \
       {axi_vdma_sm.dmacntrl_cs} \
       { }  \
       {{000 000001} {001 000010} {010 000100} {011 100000} {100 001000} {101 010000} }

 add_fsm_encoding \
       {iic_control.scl_state} \
       { }  \
       {{0000 0000000001} {0001 0000000010} {0010 0000000100} {0011 0000001000} {0100 0000010000} {0101 0000100000} {0110 0001000000} {0111 0010000000} {1000 0100000000} {1001 1000000000} }

 add_fsm_encoding \
       {iic_control.state} \
       { }  \
       {{000 0000001} {001 0000010} {010 0000100} {011 0001000} {100 0100000} {101 0010000} {110 1000000} }

 add_fsm_encoding \
       {axi_dwidth_converter_v2_1_11_w_upsizer_pktfifo.mi_state} \
       { }  \
       {{000 00000001} {001 00000010} {010 00001000} {011 00000100} {100 10000000} {101 01000000} {110 00010000} {111 00100000} }

 add_fsm_encoding \
       {axi_data_fifo_v2_1_10_axic_reg_srl_fifo.state} \
       { }  \
       {{00 0100} {01 1000} {10 0001} {11 0010} }

 add_fsm_encoding \
       {axi_data_fifo_v2_1_10_axic_reg_srl_fifo__parameterized0.state} \
       { }  \
       {{00 0100} {01 1000} {10 0001} {11 0010} }

 add_fsm_encoding \
       {axi_data_fifo_v2_1_10_axic_reg_srl_fifo__parameterized1.state} \
       { }  \
       {{00 0100} {01 1000} {10 0001} {11 0010} }

 add_fsm_encoding \
       {axi_data_fifo_v2_1_10_axic_reg_srl_fifo__parameterized2.state} \
       { }  \
       {{00 0100} {01 1000} {10 0001} {11 0010} }

 add_fsm_encoding \
       {axi_data_fifo_v2_1_10_axic_reg_srl_fifo__parameterized3.state} \
       { }  \
       {{00 0100} {01 1000} {10 0001} {11 0010} }

 add_fsm_encoding \
       {axi_data_fifo_v2_1_10_axic_reg_srl_fifo__parameterized4.state} \
       { }  \
       {{00 0100} {01 1000} {10 0001} {11 0010} }

 add_fsm_encoding \
       {tx_encoder.bufctrl} \
       { }  \
       {{000 00001} {001 00010} {010 01000} {011 00100} {100 10000} }

 add_fsm_encoding \
       {axi_datamover_pcc__parameterized2.sig_pcc_sm_state} \
       { }  \
       {{000 00000001} {001 00000010} {010 00000100} {011 00001000} {100 00010000} {101 00100000} {110 01000000} {111 10000000} }

 add_fsm_encoding \
       {MMU_UTLB.State} \
       { }  \
       {{00000 000000000000000001} {00001 000000000001000000} {00010 000000000000000010} {00011 000000001000000000} {00100 000000100000000000} {00101 000000000010000000} {00110 000000000100000000} {00111 000000010000000000} {01000 000000000000001000} {01001 000001000000000000} {01010 000100000000000000} {01011 000010000000000000} {01100 001000000000000000} {01101 010000000000000000} {01110 000000000000000100} {01111 000000000000010000} {10000 000000000000100000} {11111 100000000000000000} }

 add_fsm_encoding \
       {Icache.cache_state} \
       { }  \
       {{0000 00001} {0001 00010} {0010 00100} {0011 01000} {0100 10000} }

 add_fsm_encoding \
       {Icache__parameterized0.cache_state} \
       { }  \
       {{0000 00001} {0001 00010} {0010 00100} {0011 01000} {0100 10000} }

 add_fsm_encoding \
       {MDM_Core.Use_Dbg_Reg_Access.state} \
       { }  \
       {{0000 0000000001} {0001 0000000010} {0010 0000000100} {0011 0000001000} {0100 0000010000} {0101 0000100000} {0110 0001000000} {0111 0010000000} {1000 1000000000} {1001 0100000000} }