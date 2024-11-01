onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib uart_to_poker_opt

do {wave.do}

view wave
view structure
view signals

do {uart_to_poker.udo}

run -all

quit -force
