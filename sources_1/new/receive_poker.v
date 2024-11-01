`timescale 1ns / 1ps

module receive_poker(
    input                          sys_clk                  ,   //  ϵͳʱ��
    input                          sys_rst_n                ,   //  ϵͳ��λ
    input    [7:0]                 data_byte                ,   //  Rx���յ���8bit����
    input                          rxd_finish_pos                  ,   //  Rx��������ź�

    output       reg    [135:0]   receive_poke         ,   //  ���յ���17����
    output       reg              receivepoke_done    ,   //  ����17���������Ч�ź�
    output       reg    [7:0]     receive_one_poke         ,   //  ���յ��ĵ���    
    output       reg              receive_one_poke_done    ,   //  ���յ��������Ч�ź�
    output       reg    [15:0]    receive_two_poke         ,   //  ���յ��Ķ���    
    output       reg              receive_two_poke_done    ,   //  ���ն��������Ч�ź�
    output       reg              FPGA_flag_out          //  �ҷ��ȳ���Ч�ź�
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
            if(data_byte==8'hF1)//���շ����������ź�
                state <= F1_STATE;
            else if(data_byte==8'hF2)//���նԷ������ź�
                state  <=  TYPE;
            else if(data_byte==8'hF0)begin //���նԷ��������ź�
                state <= F0_STATE; 
                end
            else 
                state  <=  IDLE;
          end
          end
    F1_STATE:if(rxd_finish_pos)begin
                if(data_byte==8'hFB)begin  //�ж��Ǻ��
                    state<=LEN_STATE;end
                else if(data_byte==8'hFA) begin //�ж����ȳ�
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
            if(data_byte==8'h11)  //���յ�����17����
                state<=Poke_17_STATE;
            else if(data_byte==8'h01) begin //���նԷ�����
                state<=Poke_1_State; 
                end
            else if(data_byte==8'h02) begin //���նԷ�����
                state<=Poke_2_State; 
                end
            else 
                state<=IDLE;
          end
    Poke_1_State:if(rxd_finish_pos)begin 
                if(data_byte[7:4]==4'h2) //�ж϶Է������ǲ����˿��Ƶ�2   
                begin
                    receive_one_poke <= {4'hF,data_byte[3:0]};
                    receive_one_poke_done <=1'b1;
                    state<=IDLE;
                end
                else if(data_byte[7:4]==4'h1)//�ж϶Է������ǲ���A
                begin
                    receive_one_poke <= {4'hE,data_byte[3:0]};
                    receive_one_poke_done <=   1'b1;
                    state<=IDLE;
                end
                else //�����ǵ������ֱ�ӽ��Է����ƼĴ�����
                begin
                    receive_one_poke <= data_byte;
                    receive_one_poke_done<=1'b1;
                    state<=IDLE;
                end
                end
    Poke_2_State:if(rxd_finish_pos)begin 
                if(data_byte[7:4]==4'h2 )begin //�ж϶����ǵ�һ���Ƿ�Ϊ2
                    receive_two_poke <= {receive_two_poke[7:0],4'hF,data_byte[3:0]};
                    cnt_2poke <= cnt_2poke + 1'b1;
                end
                if(data_byte[7:4]==4'h1)begin //�ж϶����ǵ�һ���Ƿ�ΪA
                    receive_two_poke <= {receive_two_poke[7:0],4'hE,data_byte[3:0]};
                    cnt_2poke <= cnt_2poke + 1'b1;
                end
                if(data_byte[7:4] != 4'h2 && data_byte[7:4] != 4'h1)begin //�����ǵ������ֱ�Ӹ�ֵ
                    receive_two_poke <= {receive_two_poke[7:0],data_byte};
                    cnt_2poke <= cnt_2poke + 1'b1;
                end
                if(cnt_2poke == 3'd1)begin   //��������Ӻ����������
                    state<=IDLE;
                    receive_two_poke_done <= 1'b1;end
                end
    Poke_feedback:if(rxd_finish_pos)begin  //�����յ��Է�������ʱ������ƿ�����С����
                receive_one_poke <= 8'h00;
                receive_one_poke_done<=1'b1;
                state  <= IDLE;
                end
    Poke_17_STATE:if(rxd_finish_pos)begin  //���շ�������������17����
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
