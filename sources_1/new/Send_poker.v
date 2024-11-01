`timescale 1ns / 1ps

module Send_poker(
    input             sys_clk           ,   //  系统时钟
    input             sys_rst_n         ,   //  系统复位
    input   [7:0]     Send_one_poker    ,   //  待发送的单牌
    input             valid_one_poker   ,   //  单牌发送有效信号
    input   [15:0]    Send_two_poker    ,   //  待发送的对子
    input             valid_two_poker   ,   //  对子发送有效信号
    input             Tx_Done           ,   //  串口发送完成信号
    input             FPGA_flag_out,
    input             receive_done,
//    input   [7:0]     First_poke,
    input   [135:0]     data_out,
     
    output reg        TxSendEnFlag      ,   //  串口发送使能信号
    output reg [7:0]  TxDataByte            //  待发送的数据
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
assign TCDONE_POS=!txDoneTemp[1]&txDoneTemp[0]; //产生高电平脉冲信号
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
        IDLE: if(valid_one_poker)begin  //单牌发送有效信号为1时，进入开始发送单牌
                state<=Start_send_one_poker;
                cnt_send_one_poker<=4'd0;
                send_one_poker_header<=24'hF30101; end
             else if(valid_two_poker)begin //对子发送有效信号为1时，进入开始发送对子
                state<=Start_send_two_poker; 
                cnt_send_two_poker <=4'd0;
                send_two_poker_header<= 24'hF30202; end                
             else if(FPGA_flag_out&  rx_done)begin
                 state<= First_out; end

        Start_send_one_poker:begin 
            if(Send_one_poker == 8'hF0)begin  //判断输入的数据是否为F0，如是，则发送F0 F0 00作为不出牌数据
                 send_F0_temp<={24'hF0F000}; 
                 state<=NO_poker_send; 
                 cnt_send_no_poker<=4'd0;end
            else if(Send_one_poker[7:4] == 4'hF)begin //判断输入的单牌的高位是否为F，若为F，将其转化为2
                 send_one_poker_temp <= {send_one_poker_header,4'h2,Send_one_poker[3:0]}; 
                 state<=Sending_one_poker;end
            else if(Send_one_poker[7:4] == 4'hE)begin //判断输入的单牌的高位是否为E，若为E，将其转化为1
                 send_one_poker_temp <= {send_one_poker_header,4'h1,Send_one_poker[3:0]}; 
                 state<=Sending_one_poker;end
            else begin                                //以上的条件均不满足的情况下，正常赋值
                 send_one_poker_temp<={send_one_poker_header,Send_one_poker};
                 state<=Sending_one_poker;end
            end
        Start_send_two_poker:begin
            if(Send_two_poker[15:0]==16'hF0F0 ) begin   //判断输入的数据是否为F0，如是，则发送F0 F0 00作为不出牌数据
                 cnt_send_no_poker<=4'd0;
                 send_F0_temp<={24'hF0F000}; 
                 state<=NO_poker_send;  end
            else if(Send_two_poker[15:12]== 4'hF && Send_two_poker[7:4]== 4'hF)begin //判断输入的对子的高位是否为F，若为F，将其转化为2
                 send_two_poker_temp <= {send_two_poker_header,4'h2,Send_two_poker[11:8],4'h2,Send_two_poker[3:0]};
                 state<=Sending_two_poker; end
            else if(Send_two_poker[15:12]== 4'hE && Send_two_poker[7:4]== 4'hE)begin //判断输入的对子的高位是否为E，若为E，将其转化为1
                 send_two_poker_temp <= {send_two_poker_header,4'h1,Send_two_poker[11:8],4'h1,Send_two_poker[3:0]};
                 state<=Sending_two_poker; end
            else begin                                                               //以上的条件均不满足的情况下，正常赋值   
                 send_two_poker_temp <= {send_two_poker_header,Send_two_poker};
                 state<=Sending_two_poker;end
        end

       First_out:begin 
        if(FPGA_flag_out)begin 
            if(data_out[7:4] == 4'hF)begin //判断输入的单牌的高位是否为F，若为F，将其转化为2
                 send_one_poker_temp <= {24'hF30101,4'h2,data_out[3:0]}; 
                 state<=Sending_one_poker;end
            else if(data_out[7:4] == 4'hE)begin //判断输入的单牌的高位是否为E，若为E，将其转化为1
                 send_one_poker_temp <= {24'hF30101,4'h1,data_out[3:0]}; 
                 state<=Sending_one_poker;end
            else begin                                //以上的条件均不满足的情况下，正常赋值
                 send_one_poker_temp<={24'hF30101,data_out[7:0]};
                 state<=Sending_one_poker;end
            end
            end


        NO_poker_send:begin             //当不出牌时，发送F0 F0 00
                TxDataByte<=send_F0_temp[23:16];
                TxSendEnFlag<=1'b1;
                cnt_send_no_poker<=cnt_send_no_poker+1'b1;
                send_F0_temp<=send_F0_temp<<8;
                state<=WAITE_F0;
            if(cnt_send_no_poker==4'd3)begin 
                state<=IDLE;
                TxSendEnFlag<=1'b0; end
            end
        Sending_one_poker:begin     //发送单牌
                TxDataByte<=send_one_poker_temp[31:24];
                TxSendEnFlag<=1'b1;
                cnt_send_one_poker<=cnt_send_one_poker+1'b1;
                send_one_poker_temp<=send_one_poker_temp<<8;
                state<=WAITE;
            if(cnt_send_one_poker==4'd4)begin  //发送四次计满清零
                state<=IDLE;
                TxSendEnFlag<=1'b0; end
            end
        Sending_two_poker:begin     //发送对子
                TxDataByte<=send_two_poker_temp[39:32];
                TxSendEnFlag<=1'b1;
                cnt_send_two_poker<=cnt_send_two_poker+1'b1;
                send_two_poker_temp<=send_two_poker_temp<<8;
                state<=WAITE_TWO;
            if(cnt_send_two_poker==4'd5)begin //发送五次计满清零
                state<=IDLE;
                TxSendEnFlag<=1'b0; end
        end
        WAITE:begin TxSendEnFlag<=1'b0;if(TCDONE_POS)state<=Sending_one_poker;end
        WAITE_TWO:begin TxSendEnFlag<=1'b0;if(TCDONE_POS)state<=Sending_two_poker;end
        WAITE_F0:begin TxSendEnFlag<=1'b0;if(TCDONE_POS)state<=NO_poker_send;end
        endcase 
endmodule