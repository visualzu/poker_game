vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xpm

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm

vlog -work xil_defaultlib  -sv2k12 \
"D:/VIVADO/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/VIVADO/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"D:/VIVADO/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 \
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

