
>
Refreshing IP repositories
234*coregenZ19-234h px� 
e
 Loaded user IP repository '%s'.
1135*coregen2
d:/FPGA/POKE_V5/sources_1/ipZ19-1700h px� 
j
"Loaded Vivado IP repository '%s'.
1332*coregen2!
C:/Xilinx/Vivado/2023.2/data/ipZ19-2313h px� 
h
Command: %s
53*	vivadotcl27
5synth_design -top uart_to_poker -part xc7a50tcsg324-1Z4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
�
IP '%s' is locked:
%s
1260*coregen2
ila_02�
�* IP definition 'ILA (Integrated Logic Analyzer) (6.2)' for IP 'ila_0' (customized with software release 2018.3) has a different revision in the IP Catalog.Z19-2162h px�
z
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2	
xc7a50tZ17-347h px� 
j
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2	
xc7a50tZ17-349h px� 
D
Loading part %s157*device2
xc7a50tcsg324-1Z21-403h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
N
#Helper process launched with PID %s4824*oasys2
21516Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:02 ; elapsed = 00:00:03 . Memory (MB): peak = 1463.766 ; gain = 438.949
h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2

comp_en22
wire21
-D:/FPGA/POKE_V5/sources_1/new/uart_to_poker.v2
1218@Z8-11241h px� 
�
synthesizing module '%s'%s4497*oasys2
uart_to_poker2
 21
-D:/FPGA/POKE_V5/sources_1/new/uart_to_poker.v2
38@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2	
uart_rx2
 2+
'D:/FPGA/POKE_V5/sources_1/new/uart_rx.v2
38@Z8-6157h px� 
P
%s
*synth28
6	Parameter UART_BPS bound to: 18'b011100001000000000 
h p
x
� 
Y
%s
*synth2A
?	Parameter CLK_FREQ bound to: 27'b101111101011110000100000000 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2	
uart_rx2
 2
02
12+
'D:/FPGA/POKE_V5/sources_1/new/uart_rx.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
receive_poker2
 21
-D:/FPGA/POKE_V5/sources_1/new/receive_poker.v2
38@Z8-6157h px� 
�
-case statement is not full and has no default155*oasys21
-D:/FPGA/POKE_V5/sources_1/new/receive_poker.v2
438@Z8-155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
receive_poker2
 2
02
121
-D:/FPGA/POKE_V5/sources_1/new/receive_poker.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
poke_arrange2
 20
,D:/FPGA/POKE_V5/sources_1/new/poke_arrange.v2
38@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
poke_arrange2
 2
02
120
,D:/FPGA/POKE_V5/sources_1/new/poke_arrange.v2
38@Z8-6155h px� 
}
synthesizing module '%s'%s4497*oasys2
sort2
 2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
sort2
 2
02
12(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2

poker_comp2
 2.
*D:/FPGA/POKE_V5/sources_1/new/poker_comp.v2
38@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

poker_comp2
 2
02
12.
*D:/FPGA/POKE_V5/sources_1/new/poker_comp.v2
38@Z8-6155h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
receive_done2

poker_comp2

poker_comp21
-D:/FPGA/POKE_V5/sources_1/new/uart_to_poker.v2
1078@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2

poker_comp2

poker_comp2
142
1321
-D:/FPGA/POKE_V5/sources_1/new/uart_to_poker.v2
1078@Z8-7023h px� 
�
synthesizing module '%s'%s4497*oasys2

Send_poker2
 2.
*D:/FPGA/POKE_V5/sources_1/new/Send_poker.v2
38@Z8-6157h px� 
�
-case statement is not full and has no default155*oasys2.
*D:/FPGA/POKE_V5/sources_1/new/Send_poker.v2
678@Z8-155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

Send_poker2
 2
02
12.
*D:/FPGA/POKE_V5/sources_1/new/Send_poker.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2	
uart_tx2
 2+
'D:/FPGA/POKE_V5/sources_1/new/uart_tx.v2
38@Z8-6157h px� 
P
%s
*synth28
6	Parameter UART_BPS bound to: 18'b011100001000000000 
h p
x
� 
Y
%s
*synth2A
?	Parameter CLK_FREQ bound to: 27'b101111101011110000100000000 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2	
uart_tx2
 2
02
12+
'D:/FPGA/POKE_V5/sources_1/new/uart_tx.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
	flash_led2
 2-
)D:/FPGA/POKE_V5/sources_1/new/flash_led.v2
28@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	flash_led2
 2
02
12-
)D:/FPGA/POKE_V5/sources_1/new/flash_led.v2
28@Z8-6155h px� 
�
Fall outputs are unconnected for this instance and logic may be removed3605*oasys21
-D:/FPGA/POKE_V5/sources_1/new/uart_to_poker.v2
1648@Z8-4446h px� 
�
synthesizing module '%s'%s4497*oasys2
ila_02
 2l
hD:/FPGA/POKE_V5/project_4/project_4.runs/synth_1/.Xil/Vivado-33548-LAPTOP-5FA7RAVE/realtime/ila_0_stub.v2
58@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
ila_02
 2
02
12l
hD:/FPGA/POKE_V5/project_4/project_4.runs/synth_1/.Xil/Vivado-33548-LAPTOP-5FA7RAVE/realtime/ila_0_stub.v2
58@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
uart_to_poker2
 2
02
121
-D:/FPGA/POKE_V5/sources_1/new/uart_to_poker.v2
38@Z8-6155h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
cnt_2poke_reg2
receive_poker21
-D:/FPGA/POKE_V5/sources_1/new/receive_poker.v2
498@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
cnt_17poke_reg2
receive_poker21
-D:/FPGA/POKE_V5/sources_1/new/receive_poker.v2
508@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
	state_reg2
poke_arrange20
,D:/FPGA/POKE_V5/sources_1/new/poke_arrange.v2
268@Z8-7137h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
k_reg2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
308@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2

temp_reg2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
888@Z8-6014h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
data_in_reg[16]2
sort2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
358@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
data_in_reg[15]2
sort2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
358@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
data_in_reg[14]2
sort2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
358@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
data_in_reg[13]2
sort2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
358@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
data_in_reg[12]2
sort2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
358@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
data_in_reg[11]2
sort2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
358@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
data_in_reg[10]2
sort2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
358@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
data_in_reg[9]2
sort2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
358@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
data_in_reg[8]2
sort2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
358@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
data_in_reg[7]2
sort2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
358@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
data_in_reg[6]2
sort2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
358@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
data_in_reg[5]2
sort2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
358@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
data_in_reg[4]2
sort2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
358@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
data_in_reg[3]2
sort2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
358@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
data_in_reg[2]2
sort2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
358@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
data_in_reg[1]2
sort2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
358@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
data_in_reg[0]2
sort2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
358@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
data_r_reg[16]2
sort2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
938@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
data_r_reg[15]2
sort2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
938@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
data_r_reg[14]2
sort2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
938@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
data_r_reg[13]2
sort2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
938@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
data_r_reg[12]2
sort2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
938@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
data_r_reg[11]2
sort2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
938@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
data_r_reg[10]2
sort2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
938@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
data_r_reg[9]2
sort2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
938@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
data_r_reg[8]2
sort2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
938@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
data_r_reg[7]2
sort2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
938@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
data_r_reg[6]2
sort2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
938@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
data_r_reg[5]2
sort2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
938@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
data_r_reg[4]2
sort2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
938@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
data_r_reg[3]2
sort2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
938@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
data_r_reg[2]2
sort2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
938@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
data_r_reg[1]2
sort2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
938@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
data_r_reg[0]2
sort2(
$D:/FPGA/POKE_V5/sources_1/new/sort.v2
938@Z8-7137h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
rx_done_reg2.
*D:/FPGA/POKE_V5/sources_1/new/poker_comp.v2
388@Z8-6014h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
send_one_poker_header_reg2

Send_poker2.
*D:/FPGA/POKE_V5/sources_1/new/Send_poker.v2
718@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
send_two_poker_header_reg2

Send_poker2.
*D:/FPGA/POKE_V5/sources_1/new/Send_poker.v2
758@Z8-7137h px� 
�
fMark debug on the nets applies keep_hierarchy on instance '%s'. This will prevent further optimization4399*oasys2
	sort_inst21
-D:/FPGA/POKE_V5/sources_1/new/uart_to_poker.v2
968@Z8-6071h px� 
�
fMark debug on the nets applies keep_hierarchy on instance '%s'. This will prevent further optimization4399*oasys2
your_instance_name21
-D:/FPGA/POKE_V5/sources_1/new/uart_to_poker.v2
1648@Z8-6071h px� 
�
fMark debug on the nets applies keep_hierarchy on instance '%s'. This will prevent further optimization4399*oasys2

Send_poker21
-D:/FPGA/POKE_V5/sources_1/new/uart_to_poker.v2
1258@Z8-6071h px� 
�
fMark debug on the nets applies keep_hierarchy on instance '%s'. This will prevent further optimization4399*oasys2

poker_comp21
-D:/FPGA/POKE_V5/sources_1/new/uart_to_poker.v2
1078@Z8-6071h px� 
�
fMark debug on the nets applies keep_hierarchy on instance '%s'. This will prevent further optimization4399*oasys2
receive_poker21
-D:/FPGA/POKE_V5/sources_1/new/uart_to_poker.v2
688@Z8-6071h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[135]2

Send_pokerZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[134]2

Send_pokerZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[133]2

Send_pokerZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[132]2

Send_pokerZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[131]2

Send_pokerZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[130]2

Send_pokerZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[129]2

Send_pokerZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[128]2

Send_pokerZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[127]2

Send_pokerZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[126]2

Send_pokerZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[125]2

Send_pokerZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[124]2

Send_pokerZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[123]2

Send_pokerZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[122]2

Send_pokerZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[121]2

Send_pokerZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[120]2

Send_pokerZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[119]2

Send_pokerZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[118]2

Send_pokerZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[117]2

Send_pokerZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[116]2

Send_pokerZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[115]2

Send_pokerZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[114]2

Send_pokerZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[113]2

Send_pokerZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[112]2

Send_pokerZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[111]2

Send_pokerZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[110]2

Send_pokerZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[109]2

Send_pokerZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[108]2

Send_pokerZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[107]2

Send_pokerZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[106]2

Send_pokerZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[105]2

Send_pokerZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[104]2

Send_pokerZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[103]2

Send_pokerZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[102]2

Send_pokerZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[101]2

Send_pokerZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[100]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[99]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[98]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[97]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[96]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[95]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[94]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[93]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[92]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[91]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[90]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[89]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[88]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[87]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[86]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[85]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[84]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[83]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[82]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[81]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[80]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[79]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[78]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[77]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[76]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[75]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[74]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[73]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[72]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[71]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[70]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[69]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[68]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[67]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[66]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[65]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[64]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[63]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[62]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[61]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[60]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[59]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[58]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[57]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[56]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[55]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[54]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[53]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[52]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[51]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[50]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[49]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[48]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[47]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[46]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[45]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[44]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[43]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[42]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[41]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[40]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[39]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[38]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[37]2

Send_pokerZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
data_out[36]2

Send_pokerZ8-7129h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2
Synth 8-71292
100Z17-14h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:02 ; elapsed = 00:00:04 . Memory (MB): peak = 1615.012 ; gain = 590.195
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:02 ; elapsed = 00:00:04 . Memory (MB): peak = 1615.012 ; gain = 590.195
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:02 ; elapsed = 00:00:04 . Memory (MB): peak = 1615.012 ; gain = 590.195
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0352

1615.0122
0.000Z17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2Y
Ud:/FPGA/POKE_V5/project_4/project_4.gen/sources_1/ip/ila_0/ila_0/ila_0_in_context.xdc2
your_instance_name	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2Y
Ud:/FPGA/POKE_V5/project_4/project_4.gen/sources_1/ip/ila_0/ila_0/ila_0_in_context.xdc2
your_instance_name	8Z20-847h px� 
�
Parsing XDC File [%s]
179*designutils2D
@D:/FPGA/POKE_V5/project_4/project_4.srcs/constrs_1/new/ila_1.xdc8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2D
@D:/FPGA/POKE_V5/project_4/project_4.srcs/constrs_1/new/ila_1.xdc8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2B
@D:/FPGA/POKE_V5/project_4/project_4.srcs/constrs_1/new/ila_1.xdc2!
.Xil/uart_to_poker_propImpl.xdcZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0012

1714.2272
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
 Constraint Validation Runtime : 2

00:00:002
00:00:00.0092

1714.2272
0.000Z17-268h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:04 ; elapsed = 00:00:09 . Memory (MB): peak = 1714.227 ; gain = 689.410
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
%s
*synth2,
*Start Loading Part and Timing Information
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Loading part: xc7a50tcsg324-1
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:04 ; elapsed = 00:00:09 . Memory (MB): peak = 1714.227 ; gain = 689.410
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
%s
*synth20
.Start Applying 'set_property' XDC Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:04 ; elapsed = 00:00:09 . Memory (MB): peak = 1714.227 ; gain = 689.410
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
q
3inferred FSM for state register '%s' in module '%s'802*oasys2
	state_reg2
receive_pokerZ8-802h px� 
n
3inferred FSM for state register '%s' in module '%s'802*oasys2
	state_reg2

poker_compZ8-802h px� 
o
3inferred FSM for state register '%s' in module '%s'802*oasys2

state2_reg2

poker_compZ8-802h px� 
n
3inferred FSM for state register '%s' in module '%s'802*oasys2
	state_reg2

Send_pokerZ8-802h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_                    IDLE |                             0000 |                         00000000
h p
x
� 
y
%s
*synth2a
_                F1_STATE |                             0001 |                         00000001
h p
x
� 
y
%s
*synth2a
_                    TYPE |                             0010 |                         00000100
h p
x
� 
y
%s
*synth2a
_               LEN_STATE |                             0011 |                         00001000
h p
x
� 
y
%s
*synth2a
_           Poke_17_STATE |                             0100 |                         10000000
h p
x
� 
y
%s
*synth2a
_            Poke_1_State |                             0101 |                         00100000
h p
x
� 
y
%s
*synth2a
_            Poke_2_State |                             0110 |                         01000000
h p
x
� 
y
%s
*synth2a
_                F0_STATE |                             0111 |                         00000010
h p
x
� 
y
%s
*synth2a
_           Poke_feedback |                             1000 |                         00010000
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
	state_reg2

sequential2
receive_pokerZ8-3354h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_                    IDLE |                            00000 |       00000000000000000000000000
h p
x
� 
y
%s
*synth2a
_                      S1 |                            00001 |       00000000000000000000000001
h p
x
� 
y
%s
*synth2a
_                      S2 |                            00010 |       00000000000000000000000010
h p
x
� 
y
%s
*synth2a
_                      S3 |                            00011 |       00000000000000000000000100
h p
x
� 
y
%s
*synth2a
_                      S4 |                            00100 |       00000000000000000000001000
h p
x
� 
y
%s
*synth2a
_                      S5 |                            00101 |       00000000000000000000010000
h p
x
� 
y
%s
*synth2a
_                      S6 |                            00110 |       00000000000000000000100000
h p
x
� 
y
%s
*synth2a
_                      S7 |                            00111 |       00000000000000000001000000
h p
x
� 
y
%s
*synth2a
_                      S8 |                            01000 |       00000000000000000010000000
h p
x
� 
y
%s
*synth2a
_                      S9 |                            01001 |       00000000000000000100000000
h p
x
� 
y
%s
*synth2a
_                     S10 |                            01010 |       00000000000000001000000000
h p
x
� 
y
%s
*synth2a
_                     S11 |                            01011 |       00000000000000010000000000
h p
x
� 
y
%s
*synth2a
_                     S12 |                            01100 |       00000000000000100000000000
h p
x
� 
y
%s
*synth2a
_                     S13 |                            01101 |       00000000000001000000000000
h p
x
� 
y
%s
*synth2a
_                     S14 |                            01110 |       00000000000010000000000000
h p
x
� 
y
%s
*synth2a
_                     S15 |                            01111 |       00000000000100000000000000
h p
x
� 
y
%s
*synth2a
_                     S16 |                            10000 |       00000000001000000000000000
h p
x
� 
y
%s
*synth2a
_                     S17 |                            10001 |       00000000010000000000000000
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
	state_reg2

sequential2

poker_compZ8-3354h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_                    IDLE |                            00000 |       00000000000000000000000000
h p
x
� 
y
%s
*synth2a
_                      S1 |                            00001 |       00000000000000000000000001
h p
x
� 
y
%s
*synth2a
_                      S2 |                            00010 |       00000000000000000000000010
h p
x
� 
y
%s
*synth2a
_                      S3 |                            00011 |       00000000000000000000000100
h p
x
� 
y
%s
*synth2a
_                      S4 |                            00100 |       00000000000000000000001000
h p
x
� 
y
%s
*synth2a
_                      S5 |                            00101 |       00000000000000000000010000
h p
x
� 
y
%s
*synth2a
_                      S6 |                            00110 |       00000000000000000000100000
h p
x
� 
y
%s
*synth2a
_                      S7 |                            00111 |       00000000000000000001000000
h p
x
� 
y
%s
*synth2a
_                      S8 |                            01000 |       00000000000000000010000000
h p
x
� 
y
%s
*synth2a
_                      S9 |                            01001 |       00000000000000000100000000
h p
x
� 
y
%s
*synth2a
_                     S10 |                            01010 |       00000000000000001000000000
h p
x
� 
y
%s
*synth2a
_                     S11 |                            01011 |       00000000000000010000000000
h p
x
� 
y
%s
*synth2a
_                     S12 |                            01100 |       00000000000000100000000000
h p
x
� 
y
%s
*synth2a
_                     S13 |                            01101 |       00000000000001000000000000
h p
x
� 
y
%s
*synth2a
_                     S14 |                            01110 |       00000000000010000000000000
h p
x
� 
y
%s
*synth2a
_                     S15 |                            01111 |       00000000000100000000000000
h p
x
� 
y
%s
*synth2a
_                     S16 |                            10000 |       00000000001000000000000000
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2

state2_reg2

sequential2

poker_compZ8-3354h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 

%s
*synth2
*
h p
x
� 
y
%s
*synth2a
_                    IDLE |                      00000000001 |                      00000000001
h p
x
� 
y
%s
*synth2a
_    Start_send_one_poker |                      00000000010 |                      00000000010
h p
x
� 
y
%s
*synth2a
_    Start_send_two_poker |                      00000000100 |                      00000000100
h p
x
� 
y
%s
*synth2a
_           NO_poker_send |                      00010000000 |                      00010000000
h p
x
� 
y
%s
*synth2a
_                WAITE_F0 |                      00100000000 |                      00100000000
h p
x
� 
y
%s
*synth2a
_       Sending_two_poker |                      00000100000 |                      00000100000
h p
x
� 
y
%s
*synth2a
_               WAITE_TWO |                      01000000000 |                      01000000000
h p
x
� 
y
%s
*synth2a
_               First_out |                      00000001000 |                      00000001000
h p
x
� 
y
%s
*synth2a
_       Sending_one_poker |                      00000010000 |                      00000010000
h p
x
� 
y
%s
*synth2a
_                   WAITE |                      00001000000 |                      00001000000
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
s
6No Re-encoding of one hot register '%s' in module '%s'3445*oasys2
	state_reg2

Send_pokerZ8-3898h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:04 ; elapsed = 00:00:10 . Memory (MB): peak = 1714.227 ; gain = 689.410
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Detailed RTL Component Info : 
h p
x
� 
(
%s
*synth2
+---Adders : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   32 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    9 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    8 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    6 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit       Adders := 5     
h p
x
� 
F
%s
*synth2.
,	   2 Input    3 Bit       Adders := 1     
h p
x
� 
+
%s
*synth2
+---Registers : 
h p
x
� 
H
%s
*synth20
.	              136 Bit    Registers := 5     
h p
x
� 
H
%s
*synth20
.	               40 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	               32 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	               26 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	               24 Bit    Registers := 3     
h p
x
� 
H
%s
*synth20
.	               17 Bit    Registers := 5     
h p
x
� 
H
%s
*synth20
.	               16 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	                9 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                8 Bit    Registers := 41    
h p
x
� 
H
%s
*synth20
.	                6 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                4 Bit    Registers := 5     
h p
x
� 
H
%s
*synth20
.	                3 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                2 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                1 Bit    Registers := 29    
h p
x
� 
'
%s
*synth2
+---Muxes : 
h p
x
� 
F
%s
*synth2.
,	  18 Input  136 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input  136 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   40 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	  11 Input   40 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   32 Bit        Muxes := 4     
h p
x
� 
F
%s
*synth2.
,	  11 Input   32 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  18 Input   26 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  11 Input   24 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  18 Input   17 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	  17 Input   17 Bit        Muxes := 4     
h p
x
� 
F
%s
*synth2.
,	   2 Input   16 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	  17 Input   16 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  11 Input   11 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   10 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    9 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	   3 Input    8 Bit        Muxes := 18    
h p
x
� 
F
%s
*synth2.
,	   2 Input    8 Bit        Muxes := 191   
h p
x
� 
F
%s
*synth2.
,	   9 Input    8 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  18 Input    8 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  11 Input    8 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    7 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   9 Input    6 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  18 Input    5 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    5 Bit        Muxes := 31    
h p
x
� 
F
%s
*synth2.
,	  17 Input    5 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit        Muxes := 8     
h p
x
� 
F
%s
*synth2.
,	   9 Input    4 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   3 Input    4 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	  11 Input    4 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	   9 Input    3 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    2 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit        Muxes := 91    
h p
x
� 
F
%s
*synth2.
,	   4 Input    1 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   9 Input    1 Bit        Muxes := 14    
h p
x
� 
F
%s
*synth2.
,	  18 Input    1 Bit        Muxes := 7     
h p
x
� 
F
%s
*synth2.
,	   3 Input    1 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  17 Input    1 Bit        Muxes := 5     
h p
x
� 
F
%s
*synth2.
,	  11 Input    1 Bit        Muxes := 11    
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Finished RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
q
%s
*synth2Y
WPart Resources:
DSPs: 120 (col length:60)
BRAMs: 150 (col length: RAMB18 60 RAMB36 30)
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
E
%s
*synth2-
+Start Cross Boundary and Area Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[14][7]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[14][7]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[14][6]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[14][6]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[14][5]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[14][5]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[14][4]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[14][4]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[14][3]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[14][3]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[14][2]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[14][2]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[14][1]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[14][1]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[14][0]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[14][0]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[13][7]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[13][7]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[13][6]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[13][6]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[13][5]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[13][5]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[13][4]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[13][4]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[13][3]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[13][3]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[13][2]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[13][2]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[13][1]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[13][1]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[13][0]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[13][0]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[12][7]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[12][7]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[12][6]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[12][6]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[12][5]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[12][5]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[12][4]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[12][4]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[12][3]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[12][3]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[12][2]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[12][2]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[12][1]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[12][1]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[12][0]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[12][0]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[11][7]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[11][7]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[11][6]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[11][6]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[11][5]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[11][5]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[11][4]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[11][4]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[11][3]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[11][3]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[11][2]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[11][2]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[11][1]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[11][1]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[11][0]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[11][0]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[10][7]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[10][7]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[10][6]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[10][6]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[10][5]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[10][5]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[10][4]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[10][4]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[10][3]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[10][3]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[10][2]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[10][2]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[10][1]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[10][1]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[10][0]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[10][0]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[9][7]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[9][7]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[9][6]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[9][6]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[9][5]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[9][5]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[9][4]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[9][4]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[9][3]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[9][3]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[9][2]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[9][2]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[9][1]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[9][1]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[9][0]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[9][0]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[8][7]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[8][7]_C2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[8][6]_LDC2
sortZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
data_r_reg[8][6]_C2
sortZ8-3332h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2
Synth 8-33322
100Z17-14h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:06 ; elapsed = 00:00:16 . Memory (MB): peak = 1714.227 ; gain = 689.410
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
@
%s
*synth2(
&Start Applying XDC Timing Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:07 ; elapsed = 00:00:19 . Memory (MB): peak = 1714.227 ; gain = 689.410
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
Start Timing Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2
}Finished Timing Optimization : Time (s): cpu = 00:00:07 ; elapsed = 00:00:19 . Memory (MB): peak = 1714.227 ; gain = 689.410
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
3
%s
*synth2
Start Technology Mapping
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2~
|Finished Technology Mapping : Time (s): cpu = 00:00:07 ; elapsed = 00:00:20 . Memory (MB): peak = 1714.227 ; gain = 689.410
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
-
%s
*synth2
Start IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
?
%s
*synth2'
%Start Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
B
%s
*synth2*
(Finished Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2x
vFinished IO Insertion : Time (s): cpu = 00:00:08 ; elapsed = 00:00:22 . Memory (MB): peak = 1714.227 ; gain = 689.410
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Start Renaming Generated Instances
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:08 ; elapsed = 00:00:22 . Memory (MB): peak = 1714.227 ; gain = 689.410
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start Rebuilding User Hierarchy
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:08 ; elapsed = 00:00:22 . Memory (MB): peak = 1714.227 ; gain = 689.410
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Renaming Generated Ports
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:08 ; elapsed = 00:00:22 . Memory (MB): peak = 1714.227 ; gain = 689.410
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:08 ; elapsed = 00:00:22 . Memory (MB): peak = 1714.227 ; gain = 689.410
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Start Renaming Generated Nets
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:08 ; elapsed = 00:00:22 . Memory (MB): peak = 1714.227 ; gain = 689.410
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Writing Synthesis Report
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
/
%s
*synth2

Report BlackBoxes: 
h p
x
� 
=
%s
*synth2%
#+------+--------------+----------+
h p
x
� 
=
%s
*synth2%
#|      |BlackBox name |Instances |
h p
x
� 
=
%s
*synth2%
#+------+--------------+----------+
h p
x
� 
=
%s
*synth2%
#|1     |ila_0         |         1|
h p
x
� 
=
%s
*synth2%
#+------+--------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
2
%s*synth2
+------+-------+------+
h px� 
2
%s*synth2
|      |Cell   |Count |
h px� 
2
%s*synth2
+------+-------+------+
h px� 
2
%s*synth2
|1     |ila    |     1|
h px� 
2
%s*synth2
|2     |BUFG   |     1|
h px� 
2
%s*synth2
|3     |CARRY4 |    27|
h px� 
2
%s*synth2
|4     |LUT1   |     5|
h px� 
2
%s*synth2
|5     |LUT2   |   139|
h px� 
2
%s*synth2
|6     |LUT3   |   248|
h px� 
2
%s*synth2
|7     |LUT4   |   220|
h px� 
2
%s*synth2
|8     |LUT5   |   337|
h px� 
2
%s*synth2
|9     |LUT6   |   491|
h px� 
2
%s*synth2
|10    |MUXF7  |    24|
h px� 
2
%s*synth2
|11    |FDCE   |  1009|
h px� 
2
%s*synth2
|12    |FDPE   |    56|
h px� 
2
%s*synth2
|13    |FDRE   |   297|
h px� 
2
%s*synth2
|14    |IBUF   |     3|
h px� 
2
%s*synth2
|15    |OBUF   |     3|
h px� 
2
%s*synth2
+------+-------+------+
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:08 ; elapsed = 00:00:22 . Memory (MB): peak = 1714.227 ; gain = 689.410
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
b
%s
*synth2J
HSynthesis finished with 0 errors, 0 critical warnings and 418 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:05 ; elapsed = 00:00:21 . Memory (MB): peak = 1714.227 ; gain = 590.195
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:08 ; elapsed = 00:00:22 . Memory (MB): peak = 1714.227 ; gain = 689.410
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0182

1714.2272
0.000Z17-268h px� 
T
-Analyzing %s Unisim elements for replacement
17*netlist2
51Z29-17h px� 
X
2Unisim Transformation completed in %s CPU seconds
28*netlist2
0Z29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1714.2272
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

55a1be92Z4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
572
2462
02
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:00:092

00:00:252

1714.2272

1072.047Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0032

1714.2272
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2D
BD:/FPGA/POKE_V5/project_4/project_4.runs/synth_1/uart_to_poker.dcpZ17-1381h px� 
�
%s4*runtcl2r
pExecuting : report_utilization -file uart_to_poker_utilization_synth.rpt -pb uart_to_poker_utilization_synth.pb
h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Sat Sep 28 19:44:01 2024Z17-206h px� 


End Record