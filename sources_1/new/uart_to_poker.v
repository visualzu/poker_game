`timescale  1ns/1ns

module  uart_to_poker
(
    input   wire    sys_clk     ,   //系统时钟100MHz
    input   wire    sys_rst_n   ,   //全局复位
    input   wire    rx          ,   //串口接收数据

    output  wire    tx          ,    //串口发送数据
    output  wire [1:0]  led
);

//********************************************************************//
//****************** Parameter and Internal Signal *******************//
//********************************************************************//
//parameter define
parameter   UART_BPS    =   18'd115200      ,   //比特率
            CLK_FREQ    =   27'd100_000_000  ;   //时钟频率

//wire  define
wire [7:0]      po_data;
wire            po_flag;
wire [135:0]    receive_poke;
wire [7:0]      receive_one_poke;
wire            receivepoke_done;
wire            receive_one_poke_done;

wire [15:0]      receive_two_poke;
wire            receive_two_poke_done; 

wire [135:0]    data_out;
wire            flag_en;
wire            send_en;
wire     [7:0]  TxDataByte;
wire            Tx_Done     ;
wire            TxSendEnFlag;
wire            comp_en  ;
wire      [7:0] poker_out;

wire      [15:0] poker_out2;

wire            flag_out;
wire            FPGA_flag_out;
wire   [135:0]  poke;
wire            arrange_done;
//********************************************************************//
//*************************** Instantiation **************************//
//********************************************************************//
//------------------------ uart_rx_inst ------------------------

// 定义模块uart_rx的参数，这些参数在模块实例化时需要提供具体值
uart_rx
#(
    .UART_BPS    (UART_BPS  ),  // 串口波特率，用于配置UART通信的数据传输速率
    .CLK_FREQ    (CLK_FREQ  )   // 时钟频率，用于计算与UART通信相关的定时参数
)
// 实例化uart_rx模块为uart_rx_inst，并连接端口
uart_rx_inst
(
    .sys_clk    (sys_clk    ),  // 输入端口，系统时钟信号
    .sys_rst_n  (sys_rst_n  ),  // 输入端口，系统复位信号（低电平有效）
    .rx         (rx         ),  // 输入端口，UART接收线（RX）

    .po_data    (po_data    ),  // 输出端口，[7:0]，接收到的数据（8位）
    .po_flag    (po_flag    )   // 输出端口，接收到数据的标志信号
);
//uart_rx_poke
receive_poker receive_poker(
    .sys_clk        (sys_clk),
    .sys_rst_n      (sys_rst_n),
    .data_byte      (po_data),
    .rxd_finish_pos (po_flag),
    
    .receivepoke_done(receivepoke_done),  //接收全部牌完成信号
    .receive_poke(receive_poke),//接收到的牌
	
    .receive_one_poke_done(receive_one_poke_done),//接收单张牌完成信号
    .receive_one_poke(receive_one_poke),//接收到的单牌
	
	.receive_two_poke_done(receive_two_poke_done),//接收shuang张牌完成信号
    .receive_two_poke(receive_two_poke),//接收到的shuang牌 
	
    .FPGA_flag_out  (FPGA_flag_out)//FPGA先出牌信号
    );
//将牌库中的高四位含有1/2改为E/F
poke_arrange poke_arrange(
    .sys_clk            (sys_clk),
    .sys_rst_n          (sys_rst_n),
    .receivepoke_done   (receivepoke_done),
    .receive_poke       (receive_poke),

    .poke               (poke),
    .arrange_done       (arrange_done)
        );
//冒泡算法排序从大到小
sort  sort_inst(
	.clk           (sys_clk),
	.rst_n         (sys_rst_n),
	.sort_start    (arrange_done),
	.receive_data  (poke),
    
    .flag_en       (flag_en),
	.sort_end      (send_en),
	.data_out      (data_out)  //排序完成的牌
);
//将输入的单牌与牌库比较大小输出
poker_comp  poker_comp(
   .sys_clk         (sys_clk),
   .sys_rst_n       (sys_rst_n),
   .valid           (receive_one_poke_done),
   .poker           (data_out),
   .receice_poker   (receive_one_poke),
   .valid2           (receive_two_poke_done),
   .receice_poker2   (receive_two_poke),
   .FPGA_flag_out   (FPGA_flag_out),

//   .First_poke        (First_poke),   
   .flag_out        (flag_out),
   .comp_en         (comp_en),
   .poker_out       (poker_out),//对比输出的单牌
    .comp_en2         (comp_en2),
   .poker_out2       (poker_out2)
    );
// 逐个发送
Send_poker   Send_poker(
    .sys_clk        (sys_clk),
    .sys_rst_n      (sys_rst_n),
    .Send_one_poker        (poker_out),
	.Send_two_poker        (poker_out2),
    .valid_one_poker        (comp_en),
	.valid_two_poker        (comp_en2),
    .Tx_Done        (Tx_Done),  
    .FPGA_flag_out  (FPGA_flag_out), 	
    .receive_done   (flag_en),
//   .First_poke        (First_poke),   
  	.data_out      (data_out),
    	
    .TxSendEnFlag   (TxSendEnFlag),
    .TxDataByte     (TxDataByte)
    );  
//------------------------ uart_tx_inst ------------------------
uart_tx
#(
    .UART_BPS    (UART_BPS  ),  //串口波特率
    .CLK_FREQ    (CLK_FREQ  )   //时钟频率
)
uart_tx_inst
(
    .sys_clk    (sys_clk    ),  //input             sys_clk
    .sys_rst_n  (sys_rst_n  ),  //input             sys_rst_n
    .pi_data    (TxDataByte ),  //input     [7:0]   pi_data
    .pi_flag    (TxSendEnFlag),  //input             pi_flag
    
    .tx_done    (Tx_Done    ),            
    .tx         (tx         )   //output            tx
);

flash_led   flash_led_inst(
   .sys_clk     (sys_clk),
   .sys_rst_n   (sys_rst_n),

   .led         (led)
);
ila_0 your_instance_name (
	.clk(sys_clk), // input wire clk


	.probe0(data_out), // input wire [135:0]  probe0  
	.probe1(receive_one_poke), // input wire [7:0]  probe1 
	.probe2(poker_out) // input wire [7:0]  probe2
);
endmodule
