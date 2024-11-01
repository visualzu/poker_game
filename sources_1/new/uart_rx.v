`timescale  1ns/1ns

module  uart_rx
#(
    parameter   UART_BPS    =   'd115200,         //串口波特率
    parameter   CLK_FREQ    =   'd100_000_000    //时钟频率
)
(
    input   wire            sys_clk     ,   //系统时钟50MHz
    input   wire            sys_rst_n   ,   //全局复位
    input   wire            rx          ,   //串口接收数据

    output  reg     [7:0]   po_data     ,   //串转并后的8bit数据
    output  reg             po_flag         //串转并后的数据有效标志信号
);

//********************************************************************//
//****************** Parameter and Internal Signal *******************//
//********************************************************************//
//localparam    define
localparam  BAUD_CNT_MAX    =   CLK_FREQ/UART_BPS   ;//这个值868用于确定UART通信中每个位的时间长度,
                                                     //这个值通常用于配置UART接收器和发送器的时序，
													 //确保数据位在正确的时间间隔内被采样或发送。

//reg   define
reg         rx_reg1     ;
reg         rx_reg2     ;
reg         rx_reg3     ;
reg         start_nedge ;
reg         work_en     ;
reg [20:0]  baud_cnt    ;
reg         bit_flag    ;
reg [3:0]   bit_cnt     ;
reg [7:0]   rx_data     ;
reg         rx_flag     ;

//********************************************************************//
//***************************** Main Code ****************************//
//********************************************************************//

//插入两级寄存器进行数据同步，用来消除亚稳态

//rx_reg1:第一级寄存器，寄存器空闲状态复位为1
//否则，rx_reg1寄存器的值会跟随rx输入信号。
always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        rx_reg1 <= 1'b1;
    else
        rx_reg1 <= rx;

//rx_reg2:第二级寄存器，寄存器空闲状态复位为1rx_reg2 是第二级同步寄存器。
//类似于rx_reg1，rx_reg2也会在复位时被置为1，否则会跟随rx_reg1的值。
always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        rx_reg2 <= 1'b1;
    else
        rx_reg2 <= rx_reg1;

//rx_reg3:第三级寄存器和第二级寄存器共同构成下降沿检测
//它同样会在复位时被置为1，否则会跟随rx_reg2的值。
//rx_reg3与rx_reg2一起用于检测rx输入信号的下降沿。
always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        rx_reg3 <= 1'b1;
    else
        rx_reg3 <= rx_reg2;

//start_nedge:检测到下降沿时start_nedge产生一个时钟的高电平
//start_nedge 是一个信号，用于指示检测到rx输入信号的下降沿。
//如果rx_reg2是0而rx_reg3是1，表示检测到了下降沿，start_nedge将被置为1。
//否则，start_nedge将被清零。
//这个信号通常用于触发UART接收逻辑，表示可以开始接收一个新的数据位。
always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        start_nedge <= 1'b0;
    else    if((~rx_reg2) && (rx_reg3))
        start_nedge <= 1'b1;
    else
        start_nedge <= 1'b0;

//work_en:接收数据工作使能信号
always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        work_en <= 1'b0;
    else    if(start_nedge == 1'b1)
        work_en <= 1'b1;//接收开始
    else    if((bit_cnt == 4'd8) && (bit_flag == 1'b1))
	 //当接收到8个数据位（bit_cnt为8）且数据稳定（bit_flag为1）时，关闭使能信号,接收结束。
        work_en <= 1'b0;

//baud_cnt:波特率计数器计数，从0计数到BAUD_CNT_MAX - 1
//baud_cnt 是波特率计数器，用于控制每个位的接收时间。
//计数器在复位或达到最大值（BAUD_CNT_MAX - 1）时清零。
//当使能信号（work_en）为1时，计数器每个时钟周期增加1。
always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        baud_cnt <= 13'b0;
    else    if((baud_cnt == BAUD_CNT_MAX - 1) || (work_en == 1'b0))
        baud_cnt <= 13'b0;
    else    if(work_en == 1'b1)
        baud_cnt <= baud_cnt + 1'b1;

//bit_flag:当baud_cnt计数器计数到中间数时采样的数据最稳定，
//此时拉高一个标志信号表示数据可以被取走
//bit_flag 是一个标志信号，用于指示当前采样的数据是否稳定。
//当计数器达到中间值（BAUD_CNT_MAX/2 - 1）时，数据被认为是稳定的。
always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        bit_flag <= 1'b0;
    else    if(baud_cnt == BAUD_CNT_MAX/2 - 1)
        bit_flag <= 1'b1;
    else
        bit_flag <= 1'b0;

//bit_cnt:有效数据个数计数器，当8个有效数据（不含起始位和停止位）
//都接收完成后计数器清零
//bit_cnt 是一个计数器，用于跟踪已经接收的数据位数。
//当接收到8个数据位后，计数器清零。
always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        bit_cnt <= 4'b0;
    else    if((bit_cnt == 4'd8) && (bit_flag == 1'b1))
        bit_cnt <= 4'b0;
     else    if(bit_flag ==1'b1)
         bit_cnt <= bit_cnt + 1'b1;//当数据稳定时，计数器增加。

//rx_data:输入数据进行移位，用于存储接收到的数据。
//当数据稳定且在数据位数范围内时，移位寄存器将数据右移，并将最新的数据位放入最高位。
always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        rx_data <= 8'b0;
    else    if((bit_cnt >= 4'd1)&&(bit_cnt <= 4'd8)&&(bit_flag == 1'b1))
        rx_data <= {rx_reg3, rx_data[7:1]};

//rx_flag:输入数据移位完成时rx_flag拉高一个时钟的高电平
//rx_flag 是一个标志信号，用于指示数据移位完成。
//当接收到8个数据位且数据稳定时，标志信号被拉高。
always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        rx_flag <= 1'b0;
    else    if((bit_cnt == 4'd8) && (bit_flag == 1'b1))
        rx_flag <= 1'b1;
    else
        rx_flag <= 1'b0;

//po_data:输出完整的8位有效数据
//po_data 是一个输出寄存器，用于输出完整的8位数据。
//当rx_flag为1时，rx_data的内容被加载到po_data中。
always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        po_data <= 8'b0;
    else    if(rx_flag == 1'b1)
        po_data <= rx_data;

//po_flag:输出数据有效标志（比rx_flag延后一个时钟周期，为了和po_data同步）
//po_flag 是一个输出标志，用于指示po_data中的数据是否有效。
//它通常比rx_flag延后一个时钟周期，以确保数据和标志同步。
always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        po_flag <= 1'b0;
    else
        po_flag <= rx_flag;

endmodule
