`timescale  1ns/1ns

module  uart_rx
#(
    parameter   UART_BPS    =   'd115200,         //���ڲ�����
    parameter   CLK_FREQ    =   'd100_000_000    //ʱ��Ƶ��
)
(
    input   wire            sys_clk     ,   //ϵͳʱ��50MHz
    input   wire            sys_rst_n   ,   //ȫ�ָ�λ
    input   wire            rx          ,   //���ڽ�������

    output  reg     [7:0]   po_data     ,   //��ת�����8bit����
    output  reg             po_flag         //��ת�����������Ч��־�ź�
);

//********************************************************************//
//****************** Parameter and Internal Signal *******************//
//********************************************************************//
//localparam    define
localparam  BAUD_CNT_MAX    =   CLK_FREQ/UART_BPS   ;//���ֵ868����ȷ��UARTͨ����ÿ��λ��ʱ�䳤��,
                                                     //���ֵͨ����������UART�������ͷ�������ʱ��
													 //ȷ������λ����ȷ��ʱ�����ڱ��������͡�

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

//���������Ĵ�����������ͬ����������������̬

//rx_reg1:��һ���Ĵ������Ĵ�������״̬��λΪ1
//����rx_reg1�Ĵ�����ֵ�����rx�����źš�
always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        rx_reg1 <= 1'b1;
    else
        rx_reg1 <= rx;

//rx_reg2:�ڶ����Ĵ������Ĵ�������״̬��λΪ1rx_reg2 �ǵڶ���ͬ���Ĵ�����
//������rx_reg1��rx_reg2Ҳ���ڸ�λʱ����Ϊ1����������rx_reg1��ֵ��
always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        rx_reg2 <= 1'b1;
    else
        rx_reg2 <= rx_reg1;

//rx_reg3:�������Ĵ����͵ڶ����Ĵ�����ͬ�����½��ؼ��
//��ͬ�����ڸ�λʱ����Ϊ1����������rx_reg2��ֵ��
//rx_reg3��rx_reg2һ�����ڼ��rx�����źŵ��½��ء�
always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        rx_reg3 <= 1'b1;
    else
        rx_reg3 <= rx_reg2;

//start_nedge:��⵽�½���ʱstart_nedge����һ��ʱ�ӵĸߵ�ƽ
//start_nedge ��һ���źţ�����ָʾ��⵽rx�����źŵ��½��ء�
//���rx_reg2��0��rx_reg3��1����ʾ��⵽���½��أ�start_nedge������Ϊ1��
//����start_nedge�������㡣
//����ź�ͨ�����ڴ���UART�����߼�����ʾ���Կ�ʼ����һ���µ�����λ��
always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        start_nedge <= 1'b0;
    else    if((~rx_reg2) && (rx_reg3))
        start_nedge <= 1'b1;
    else
        start_nedge <= 1'b0;

//work_en:�������ݹ���ʹ���ź�
always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        work_en <= 1'b0;
    else    if(start_nedge == 1'b1)
        work_en <= 1'b1;//���տ�ʼ
    else    if((bit_cnt == 4'd8) && (bit_flag == 1'b1))
	 //�����յ�8������λ��bit_cntΪ8���������ȶ���bit_flagΪ1��ʱ���ر�ʹ���ź�,���ս�����
        work_en <= 1'b0;

//baud_cnt:�����ʼ�������������0������BAUD_CNT_MAX - 1
//baud_cnt �ǲ����ʼ����������ڿ���ÿ��λ�Ľ���ʱ�䡣
//�������ڸ�λ��ﵽ���ֵ��BAUD_CNT_MAX - 1��ʱ���㡣
//��ʹ���źţ�work_en��Ϊ1ʱ��������ÿ��ʱ����������1��
always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        baud_cnt <= 13'b0;
    else    if((baud_cnt == BAUD_CNT_MAX - 1) || (work_en == 1'b0))
        baud_cnt <= 13'b0;
    else    if(work_en == 1'b1)
        baud_cnt <= baud_cnt + 1'b1;

//bit_flag:��baud_cnt�������������м���ʱ�������������ȶ���
//��ʱ����һ����־�źű�ʾ���ݿ��Ա�ȡ��
//bit_flag ��һ����־�źţ�����ָʾ��ǰ�����������Ƿ��ȶ���
//���������ﵽ�м�ֵ��BAUD_CNT_MAX/2 - 1��ʱ�����ݱ���Ϊ���ȶ��ġ�
always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        bit_flag <= 1'b0;
    else    if(baud_cnt == BAUD_CNT_MAX/2 - 1)
        bit_flag <= 1'b1;
    else
        bit_flag <= 1'b0;

//bit_cnt:��Ч���ݸ�������������8����Ч���ݣ�������ʼλ��ֹͣλ��
//��������ɺ����������
//bit_cnt ��һ�������������ڸ����Ѿ����յ�����λ����
//�����յ�8������λ�󣬼��������㡣
always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        bit_cnt <= 4'b0;
    else    if((bit_cnt == 4'd8) && (bit_flag == 1'b1))
        bit_cnt <= 4'b0;
     else    if(bit_flag ==1'b1)
         bit_cnt <= bit_cnt + 1'b1;//�������ȶ�ʱ�����������ӡ�

//rx_data:�������ݽ�����λ�����ڴ洢���յ������ݡ�
//�������ȶ���������λ����Χ��ʱ����λ�Ĵ������������ƣ��������µ�����λ�������λ��
always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        rx_data <= 8'b0;
    else    if((bit_cnt >= 4'd1)&&(bit_cnt <= 4'd8)&&(bit_flag == 1'b1))
        rx_data <= {rx_reg3, rx_data[7:1]};

//rx_flag:����������λ���ʱrx_flag����һ��ʱ�ӵĸߵ�ƽ
//rx_flag ��һ����־�źţ�����ָʾ������λ��ɡ�
//�����յ�8������λ�������ȶ�ʱ����־�źű����ߡ�
always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        rx_flag <= 1'b0;
    else    if((bit_cnt == 4'd8) && (bit_flag == 1'b1))
        rx_flag <= 1'b1;
    else
        rx_flag <= 1'b0;

//po_data:���������8λ��Ч����
//po_data ��һ������Ĵ������������������8λ���ݡ�
//��rx_flagΪ1ʱ��rx_data�����ݱ����ص�po_data�С�
always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        po_data <= 8'b0;
    else    if(rx_flag == 1'b1)
        po_data <= rx_data;

//po_flag:���������Ч��־����rx_flag�Ӻ�һ��ʱ�����ڣ�Ϊ�˺�po_dataͬ����
//po_flag ��һ�������־������ָʾpo_data�е������Ƿ���Ч��
//��ͨ����rx_flag�Ӻ�һ��ʱ�����ڣ���ȷ�����ݺͱ�־ͬ����
always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        po_flag <= 1'b0;
    else
        po_flag <= rx_flag;

endmodule
