`timescale  1ns/1ns

module  uart_to_poker
(
    input   wire    sys_clk     ,   //ϵͳʱ��100MHz
    input   wire    sys_rst_n   ,   //ȫ�ָ�λ
    input   wire    rx          ,   //���ڽ�������

    output  wire    tx          ,    //���ڷ�������
    output  wire [1:0]  led
);

//********************************************************************//
//****************** Parameter and Internal Signal *******************//
//********************************************************************//
//parameter define
parameter   UART_BPS    =   18'd115200      ,   //������
            CLK_FREQ    =   27'd100_000_000  ;   //ʱ��Ƶ��

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

// ����ģ��uart_rx�Ĳ�������Щ������ģ��ʵ����ʱ��Ҫ�ṩ����ֵ
uart_rx
#(
    .UART_BPS    (UART_BPS  ),  // ���ڲ����ʣ���������UARTͨ�ŵ����ݴ�������
    .CLK_FREQ    (CLK_FREQ  )   // ʱ��Ƶ�ʣ����ڼ�����UARTͨ����صĶ�ʱ����
)
// ʵ����uart_rxģ��Ϊuart_rx_inst�������Ӷ˿�
uart_rx_inst
(
    .sys_clk    (sys_clk    ),  // ����˿ڣ�ϵͳʱ���ź�
    .sys_rst_n  (sys_rst_n  ),  // ����˿ڣ�ϵͳ��λ�źţ��͵�ƽ��Ч��
    .rx         (rx         ),  // ����˿ڣ�UART�����ߣ�RX��

    .po_data    (po_data    ),  // ����˿ڣ�[7:0]�����յ������ݣ�8λ��
    .po_flag    (po_flag    )   // ����˿ڣ����յ����ݵı�־�ź�
);
//uart_rx_poke
receive_poker receive_poker(
    .sys_clk        (sys_clk),
    .sys_rst_n      (sys_rst_n),
    .data_byte      (po_data),
    .rxd_finish_pos (po_flag),
    
    .receivepoke_done(receivepoke_done),  //����ȫ��������ź�
    .receive_poke(receive_poke),//���յ�����
	
    .receive_one_poke_done(receive_one_poke_done),//���յ���������ź�
    .receive_one_poke(receive_one_poke),//���յ��ĵ���
	
	.receive_two_poke_done(receive_two_poke_done),//����shuang��������ź�
    .receive_two_poke(receive_two_poke),//���յ���shuang�� 
	
    .FPGA_flag_out  (FPGA_flag_out)//FPGA�ȳ����ź�
    );
//���ƿ��еĸ���λ����1/2��ΪE/F
poke_arrange poke_arrange(
    .sys_clk            (sys_clk),
    .sys_rst_n          (sys_rst_n),
    .receivepoke_done   (receivepoke_done),
    .receive_poke       (receive_poke),

    .poke               (poke),
    .arrange_done       (arrange_done)
        );
//ð���㷨����Ӵ�С
sort  sort_inst(
	.clk           (sys_clk),
	.rst_n         (sys_rst_n),
	.sort_start    (arrange_done),
	.receive_data  (poke),
    
    .flag_en       (flag_en),
	.sort_end      (send_en),
	.data_out      (data_out)  //������ɵ���
);
//������ĵ������ƿ�Ƚϴ�С���
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
   .poker_out       (poker_out),//�Ա�����ĵ���
    .comp_en2         (comp_en2),
   .poker_out2       (poker_out2)
    );
// �������
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
    .UART_BPS    (UART_BPS  ),  //���ڲ�����
    .CLK_FREQ    (CLK_FREQ  )   //ʱ��Ƶ��
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
