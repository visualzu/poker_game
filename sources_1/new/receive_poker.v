`timescale 1ns / 1ps

module receive_poker(
    input                          sys_clk                  ,   //  系统时钟
    input                          sys_rst_n                ,   //  系统复位
    input    [7:0]                 data_byte                ,   //  Rx接收到的8bit数据
    input                          rxd_finish_pos                  ,   //  Rx接收完成信号

    output       reg    [135:0]   receive_poke         ,   //  接收到的17张牌
    output       reg              receivepoke_done    ,   //  接收17张牌完成有效信号
    output       reg    [7:0]     receive_one_poke         ,   //  接收到的单牌    
    output       reg              receive_one_poke_done    ,   //  接收单牌完成有效信号
    output       reg    [15:0]    receive_two_poke         ,   //  接收到的对子    
    output       reg              receive_two_poke_done    ,   //  接收对子完成有效信号
    output       reg              FPGA_flag_out          //  我方先出有效信号
    );
reg [7:0]state;
reg        FPGA_first_out;
parameter  IDLE            =   8'b0000_0000,
            F1_STATE        =   8'b0000_0001,
            F0_STATE        =   8'b0000_0010,
            TYPE            =   8'b0000_0100,
            LEN_STATE       =   8'b0000_1000,
            Poke_feedback   =   8'b0001_0000,
            Poke_1_State    =   8'b0010_0000,
            Poke_2_State    =   8'b0100_0000,
            Poke_17_STATE   =   8'b1000_0000;
reg [5:0]cnt_17poke; 
reg [2:0]cnt_2poke;
always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n) 
     begin   
        receive_poke      <= 1'b0;
        receivepoke_done <= 1'b0;
        receive_one_poke      <= 1'b0;
        receive_one_poke_done <= 1'b0;
        receive_two_poke      <= 1'b0;
        receive_two_poke_done <= 1'b0;
        FPGA_flag_out   <= 1'b0;
        state<=IDLE;
        FPGA_first_out <= 1'b0;
      end
    else case(state)
    IDLE:begin 
        receivepoke_done  <=  1'b0;
        receive_one_poke_done  <=  1'b0;
        receive_two_poke_done  <=  1'b0;
//        FPGA_flag_out    <=  1'b0;
        cnt_2poke <= 3'd0;
        cnt_17poke<=5'd0;
         if(rxd_finish_pos)begin
            if(data_byte==8'hF1)//接收服务器发牌信号
                state <= F1_STATE;
            else if(data_byte==8'hF2)//接收对方出牌信号
                state  <=  TYPE;
            else if(data_byte==8'hF0)begin //接收对方不出牌信号
                state <= F0_STATE; 
                end
            else 
                state  <=  IDLE;
          end
          end
    F1_STATE:if(rxd_finish_pos)begin
                if(data_byte==8'hFB)begin  //判断是后出
                    state<=LEN_STATE;end
                else if(data_byte==8'hFA) begin //判断是先出
                    state<=LEN_STATE; 
                    FPGA_first_out <= 1'b1;
                    end 
                else 
                state<=IDLE;
            end
    F0_STATE:if(rxd_finish_pos)begin
                if(data_byte==8'hF0)
                    state<=Poke_feedback;
                else 
                    state<=IDLE;
             end
    TYPE:if(rxd_finish_pos)begin
              if(data_byte==8'h01 || data_byte==8'h02)
                state<=LEN_STATE;  
              else
                state<=IDLE;
          end
    LEN_STATE:if(rxd_finish_pos)begin
            if(data_byte==8'h11)  //接收的牌是17张牌
                state<=Poke_17_STATE;
            else if(data_byte==8'h01) begin //接收对方单牌
                state<=Poke_1_State; 
                end
            else if(data_byte==8'h02) begin //接收对方对子
                state<=Poke_2_State; 
                end
            else 
                state<=IDLE;
          end
    Poke_1_State:if(rxd_finish_pos)begin 
                if(data_byte[7:4]==4'h2) //判断对方的牌是不是扑克牌的2   
                begin
                    receive_one_poke <= {4'hF,data_byte[3:0]};
                    receive_one_poke_done <=1'b1;
                    state<=IDLE;
                end
                else if(data_byte[7:4]==4'h1)//判断对方的牌是不是A
                begin
                    receive_one_poke <= {4'hE,data_byte[3:0]};
                    receive_one_poke_done <=   1'b1;
                    state<=IDLE;
                end
                else //均不是的情况下直接将对方的牌寄存下来
                begin
                    receive_one_poke <= data_byte;
                    receive_one_poke_done<=1'b1;
                    state<=IDLE;
                end
                end
    Poke_2_State:if(rxd_finish_pos)begin 
                if(data_byte[7:4]==4'h2 )begin //判断对子是第一张是否为2
                    receive_two_poke <= {receive_two_poke[7:0],4'hF,data_byte[3:0]};
                    cnt_2poke <= cnt_2poke + 1'b1;
                end
                if(data_byte[7:4]==4'h1)begin //判断对子是第一张是否为A
                    receive_two_poke <= {receive_two_poke[7:0],4'hE,data_byte[3:0]};
                    cnt_2poke <= cnt_2poke + 1'b1;
                end
                if(data_byte[7:4] != 4'h2 && data_byte[7:4] != 4'h1)begin //均不是的情况下直接赋值
                    receive_two_poke <= {receive_two_poke[7:0],data_byte};
                    cnt_2poke <= cnt_2poke + 1'b1;
                end
                if(cnt_2poke == 3'd1)begin   //接收完对子后计数器清零
                    state<=IDLE;
                    receive_two_poke_done <= 1'b1;end
                end
    Poke_feedback:if(rxd_finish_pos)begin  //当接收到对方不出牌时，输出牌库中最小的牌
                receive_one_poke <= 8'h00;
                receive_one_poke_done<=1'b1;
                state  <= IDLE;
                end
    Poke_17_STATE:if(rxd_finish_pos)begin  //接收服务器发过来的17张牌
                receive_poke<={receive_poke[127:0],data_byte};
                cnt_17poke<=cnt_17poke+1'b1;
                if(cnt_17poke==5'd16)begin 
                state<=IDLE;
                receivepoke_done<=1'b1;
                if(FPGA_first_out)begin
                                FPGA_flag_out <= 1'b1;
                end
                end
             end
    endcase  
endmodule
