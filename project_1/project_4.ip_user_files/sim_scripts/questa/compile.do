vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xpm

vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xpm questa_lib/msim/xpm

vlog -work xil_defaultlib -64 -sv \
"D:/VIVADO/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/VIVADO/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"D:/VIVADO/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 \
"../../../../sources_1/new/Send_poker.v" \
"../../../../sources_1/new/poke_arrange.v" \
"../../../../sources_1/new/poker_comp.v" \
"../../../../sources_1/new/poker_comp2.v" \
"../../../../sources_1/new/receive_poker.v" \
"../../../../sources_1/new/sort.v" \
"../../../../sources_1/new/uart_rx.v" \
"../../../../sources_1/new/uart_tx.v" \
"../../../../sources_1/new/uart_to_poker.v" \

vlog -work xil_defaultlib \
"glbl.v"

