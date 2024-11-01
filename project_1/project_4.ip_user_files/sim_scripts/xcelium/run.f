-makelib xcelium_lib/xil_defaultlib -sv \
  "D:/VIVADO/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "D:/VIVADO/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "D:/VIVADO/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../sources_1/new/Send_poker.v" \
  "../../../../sources_1/new/poke_arrange.v" \
  "../../../../sources_1/new/poker_comp.v" \
  "../../../../sources_1/new/poker_comp2.v" \
  "../../../../sources_1/new/receive_poker.v" \
  "../../../../sources_1/new/sort.v" \
  "../../../../sources_1/new/uart_rx.v" \
  "../../../../sources_1/new/uart_tx.v" \
  "../../../../sources_1/new/uart_to_poker.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

