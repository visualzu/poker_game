`timescale 1ns / 1ps

module Send_poker(
    input             sys_clk           ,   //  ϵͳʱ��
    input             sys_rst_n         ,   //  ϵͳ��λ
    input   [7:0]     Send_one_poker    ,   //  �����͵ĵ���
    input             valid_one_poker   ,   //  ���Ʒ�����Ч�ź�
    input   [15:0]    Send_two_poker    ,   //  �����͵Ķ���
    input             valid_two_poker   ,   //  ���ӷ�����Ч�ź�
    input             Tx_Done           ,   //  ���ڷ�������ź�
    input             FPGA_flag_out,
    input             receive_done,
//    input   [7:0]     First_poke,
    input   [135:0]     data_out,
     
    output reg        TxSendEnFlag      ,   //  ���ڷ���ʹ���ź�
    output reg [7:0]  TxDataByte            //  �����͵�����
    );
parameter  IDLE                 =   10'b00_0000_0001,
            Start_send_one_poker =   10'b00_0000_0010,
            Start_send_two_poker =   10'b00_0000_0100,
            First_out            =   10'b00_0000_1000,
            Sending_one_poker    =   10'b00_0001_0000,
            Sending_two_poker    =   10'b00_0010_0000,
            WAITE                =   10'b00_0100_0000,
            NO_poker_send        =   10'b00_1000_0000,
            WAITE_F0             =   10'b01_0000_0000,
            WAITE_TWO            =   10'b10_0000_0000;
 reg [10:0] state;                  
 reg [31:0] send_one_poker_temp;
 reg [39:0] send_two_poker_temp;
 reg [23:0] send_F0_temp;
 reg [3:0]  cnt_send_one_poker;
 reg [3:0]  cnt_send_two_poker;
 reg [3:0]  cnt_send_no_poker;
 reg [23:0] send_one_poker_header;
 reg [23:0] send_two_poker_header;
 reg [1:0]  txDoneTemp;
 wire       TCDONE_POS;
 reg         rx_done;
 
 always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        rx_done<=1'b0;
    else 
        rx_done<= receive_done;
 
always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        txDoneTemp<=2'b00;
    else 
        txDoneTemp<={txDoneTemp[0],Tx_Done};
assign TCDONE_POS=!txDoneTemp[1]&txDoneTemp[0]; //�����ߵ�ƽ�����ź�
always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
    begin 
        state<=IDLE;
        TxSendEnFlag<= 1'b0;
        TxDataByte<=1'b0;
        send_one_poker_temp <= 1'b0;
        send_two_poker_temp <= 1'b0;
        send_F0_temp        <= 1'b0;
        cnt_send_one_poker  <= 1'b0;
        cnt_send_two_poker  <= 1'b0;
        cnt_send_no_poker   <= 1'b0;        
    end
    else case(state)
        IDLE: if(valid_one_poker)begin  //���Ʒ�����Ч�ź�Ϊ1ʱ�����뿪ʼ���͵���
                state<=Start_send_one_poker;
                cnt_send_one_poker<=4'd0;
                send_one_poker_header<=24'hF30101; end
             else if(valid_two_poker)begin //���ӷ�����Ч�ź�Ϊ1ʱ�����뿪ʼ���Ͷ���
                state<=Start_send_two_poker; 
                cnt_send_two_poker <=4'd0;
                send_two_poker_header<= 24'hF30202; end                
             else if(FPGA_flag_out&  rx_done)begin
                 state<= First_out; end

        Start_send_one_poker:begin 
            if(Send_one_poker == 8'hF0)begin  //�ж�����������Ƿ�ΪF0�����ǣ�����F0 F0 00��Ϊ����������
                 send_F0_temp<={24'hF0F000}; 
                 state<=NO_poker_send; 
                 cnt_send_no_poker<=4'd0;end
            else if(Send_one_poker[7:4] == 4'hF)begin //�ж�����ĵ��Ƶĸ�λ�Ƿ�ΪF����ΪF������ת��Ϊ2
                 send_one_poker_temp <= {send_one_poker_header,4'h2,Send_one_poker[3:0]}; 
                 state<=Sending_one_poker;end
            else if(Send_one_poker[7:4] == 4'hE)begin //�ж�����ĵ��Ƶĸ�λ�Ƿ�ΪE����ΪE������ת��Ϊ1
                 send_one_poker_temp <= {send_one_poker_header,4'h1,Send_one_poker[3:0]}; 
                 state<=Sending_one_poker;end
            else begin                                //���ϵ������������������£�������ֵ
                 send_one_poker_temp<={send_one_poker_header,Send_one_poker};
                 state<=Sending_one_poker;end
            end
        Start_send_two_poker:begin
            if(Send_two_poker[15:0]==16'hF0F0 ) begin   //�ж�����������Ƿ�ΪF0�����ǣ�����F0 F0 00��Ϊ����������
                 cnt_send_no_poker<=4'd0;
                 send_F0_temp<={24'hF0F000}; 
                 state<=NO_poker_send;  end
            else if(Send_two_poker[15:12]== 4'hF && Send_two_poker[7:4]== 4'hF)begin //�ж�����Ķ��ӵĸ�λ�Ƿ�ΪF����ΪF������ת��Ϊ2
                 send_two_poker_temp <= {send_two_poker_header,4'h2,Send_two_poker[11:8],4'h2,Send_two_poker[3:0]};
                 state<=Sending_two_poker; end
            else if(Send_two_poker[15:12]== 4'hE && Send_two_poker[7:4]== 4'hE)begin //�ж�����Ķ��ӵĸ�λ�Ƿ�ΪE����ΪE������ת��Ϊ1
                 send_two_poker_temp <= {send_two_poker_header,4'h1,Send_two_poker[11:8],4'h1,Send_two_poker[3:0]};
                 state<=Sending_two_poker; end
            else begin                                                               //���ϵ������������������£�������ֵ   
                 send_two_poker_temp <= {send_two_poker_header,Send_two_poker};
                 state<=Sending_two_poker;end
        end

       First_out:begin 
        if(FPGA_flag_out)begin 
            if(data_out[7:4] == 4'hF)begin //�ж�����ĵ��Ƶĸ�λ�Ƿ�ΪF����ΪF������ת��Ϊ2
                 send_one_poker_temp <= {24'hF30101,4'h2,data_out[3:0]}; 
                 state<=Sending_one_poker;end
            else if(data_out[7:4] == 4'hE)begin //�ж�����ĵ��Ƶĸ�λ�Ƿ�ΪE����ΪE������ת��Ϊ1
                 send_one_poker_temp <= {24'hF30101,4'h1,data_out[3:0]}; 
                 state<=Sending_one_poker;end
            else begin                                //���ϵ������������������£�������ֵ
                 send_one_poker_temp<={24'hF30101,data_out[7:0]};
                 state<=Sending_one_poker;end
            end
            end


        NO_poker_send:begin             //��������ʱ������F0 F0 00
                TxDataByte<=send_F0_temp[23:16];
                TxSendEnFlag<=1'b1;
                cnt_send_no_poker<=cnt_send_no_poker+1'b1;
                send_F0_temp<=send_F0_temp<<8;
                state<=WAITE_F0;
            if(cnt_send_no_poker==4'd3)begin 
                state<=IDLE;
                TxSendEnFlag<=1'b0; end
            end
        Sending_one_poker:begin     //���͵���
                TxDataByte<=send_one_poker_temp[31:24];
                TxSendEnFlag<=1'b1;
                cnt_send_one_poker<=cnt_send_one_poker+1'b1;
                send_one_poker_temp<=send_one_poker_temp<<8;
                state<=WAITE;
            if(cnt_send_one_poker==4'd4)begin  //�����Ĵμ�������
                state<=IDLE;
                TxSendEnFlag<=1'b0; end
            end
        Sending_two_poker:begin     //���Ͷ���
                TxDataByte<=send_two_poker_temp[39:32];
                TxSendEnFlag<=1'b1;
                cnt_send_two_poker<=cnt_send_two_poker+1'b1;
                send_two_poker_temp<=send_two_poker_temp<<8;
                state<=WAITE_TWO;
            if(cnt_send_two_poker==4'd5)begin //������μ�������
                state<=IDLE;
                TxSendEnFlag<=1'b0; end
        end
        WAITE:begin TxSendEnFlag<=1'b0;if(TCDONE_POS)state<=Sending_one_poker;end
        WAITE_TWO:begin TxSendEnFlag<=1'b0;if(TCDONE_POS)state<=Sending_two_poker;end
        WAITE_F0:begin TxSendEnFlag<=1'b0;if(TCDONE_POS)state<=NO_poker_send;end
        endcase 
endmodule