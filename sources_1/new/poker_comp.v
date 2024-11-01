`timescale 1ns / 1ps

module poker_comp(
    input               sys_clk,
    input               sys_rst_n,
    input               valid,
	input               valid2,
    input       [135:0]  poker,
    input       [7:0]   receice_poker,
	input       [15:0]  receice_poker2,
    input               FPGA_flag_out,
    input             receive_done,
    
 //   output   reg   [7:0]   First_poke,
    output   reg           flag_out,
    output   reg           comp_en,
    output   reg   [7:0]   poker_out,
	output   reg           comp_en2,
    output   reg   [15:0]   poker_out2
    );
wire     [16:0]        send_en;
reg     [135:0]      reg_poke;
reg     [16:0]       current;

wire     [16:0]        send_en2;
reg     [135:0]      reg_poke2;
reg     [16:0]       current2;


 reg [16:0] card_played;
  reg [16:0] card_played_1;
  reg [16:0] card_played_2;
  
 reg         rx_done;
 
 always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        rx_done<=1'b0;
    else 
        rx_done<= receive_done;

always@(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n) begin
        
        flag_out <= 1'b0;
    end else if (valid||valid2) begin
        flag_out <= 1'b1;
    end else if(comp_en||comp_en2) begin
        flag_out <= 1'b0;
    end
end


  always@(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n) begin
        card_played <= 17'b1111_1111_1111_11111; // 复位时将card_played的所有位设置为1   
        end
    else  begin
        card_played <= card_played_1 & card_played_2;
    end       
    end

reg [25:0] state;

parameter   IDLE  = 26'b00_0000_0000_0000_0000_0000_0000, S1 = 26'b00_0000_0000_0000_0000_0000_0001, S2   = 26'b00_0000_0000_0000_0000_0000_0010,
             S3  = 26'b00_0000_0000_0000_0000_0000_0100,S4   = 26'b00_0000_0000_0000_0000_0000_1000,S5   =  26'b00_0000_0000_0000_0000_0001_0000,
             S6  = 26'b00_0000_0000_0000_0000_0010_0000,S7   = 26'b00_0000_0000_0000_0000_0100_0000,S8   =  26'b00_0000_0000_0000_0000_1000_0000,
             S9  = 26'b00_0000_0000_0000_0001_0000_0000,S10  = 26'b00_0000_0000_0000_0010_0000_0000,S11  =  26'b00_0000_0000_0000_0100_0000_0000,
             S12 = 26'b00_0000_0000_0000_1000_0000_0000,S13  = 26'b00_0000_0000_0001_0000_0000_0000,S14  =  26'b00_0000_0000_0010_0000_0000_0000,
             S15 = 26'b00_0000_0000_0100_0000_0000_0000,S16  = 26'b00_0000_0000_1000_0000_0000_0000,S17  =  26'b00_0000_0001_0000_0000_0000_0000;

always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        begin
        poker_out <= 1'b0;
        state <= IDLE;
        comp_en <= 1'b0;
        current <= 17'd0;
        reg_poke <= 136'd0;
        card_played_1 <= 17'b1111_1111_1111_11111; // 复位时将card_played的所有位设置为1
        end
    else
        case(state)
        IDLE:if(valid)begin  
                state <= S1; 
                reg_poke <= poker;  
                comp_en <= 1'b0;
                end 
            else begin 
                comp_en <= 1'b0;end
        S1:if((reg_poke[7:4] > receice_poker[7:4])&& !send_en[0]&& card_played[0]) begin 
                poker_out <= reg_poke[7:0];
                card_played_1[0] <= 1'b0;
                comp_en <= 1'b1;
                state <= IDLE;
                current[0]<= 1'b1;
                end 
             else 
                state <= S2;
        S2:if((reg_poke[15:12] > receice_poker[7:4])&& !send_en[1]&& card_played[1])begin 
                poker_out <= reg_poke[15:8]; 
                card_played_1[1] <= 1'b0;
                comp_en <= 1'b1;
                state <= IDLE;
                current[1]<= 1'b1;
                end 
             else 
                state <= S3;   
        S3:if((reg_poke[23:20] > receice_poker[7:4])&& !send_en[2]&& card_played[2])begin 
                poker_out <= reg_poke[23:16]; 
                card_played_1[2] <= 1'b0;
                comp_en <= 1'b1;
                state <= IDLE;
                current[2]<= 1'b1;
                end 
             else 
                state <= S4;
        S4:if((reg_poke[31:28] > receice_poker[7:4])&& !send_en[3]&& card_played[3])begin 
                poker_out <= reg_poke[31:24];
                card_played_1[3] <= 1'b0;
                comp_en <= 1'b1;
                state <= IDLE;
                current[3]<= 1'b1;
                end 
             else 
                state <= S5;
        S5:if(reg_poke[39:36] > receice_poker[7:4]&& !send_en[4]&& card_played[4]) begin 
                poker_out <= reg_poke[39:32]; 
                card_played_1[4] <= 1'b0;
                comp_en <= 1'b1;
                state <= IDLE;
                current[4]<= 1'b1;
                end 
            else 
                state <= S6;
        S6:if(reg_poke[47:44] > receice_poker[7:4]&& !send_en[5]&& card_played[5])begin 
                poker_out <= reg_poke[47:40];
                card_played_1[5] <= 1'b0;
                comp_en <= 1'b1;
                state <= IDLE;
                current[5]<= 1'b1;
                end
            else 
                state <= S7;  
        S7:if(reg_poke[55:52] > receice_poker[7:4]&& !send_en[6]&& card_played[6])begin 
                poker_out <= reg_poke[55:48]; 
                card_played_1[6] <= 1'b0;
                comp_en <= 1'b1;
                state <= IDLE;
                current[6]<= 1'b1;
                end 
            else 
                state <= S8;
        S8:if(reg_poke[63:60] > receice_poker[7:4]&& !send_en[7]&& card_played[7])begin 
                poker_out <= reg_poke[63:56]; 
                card_played_1[7] <= 1'b0;
                comp_en <= 1'b1;
                state <= IDLE;
                current[7]<= 1'b1;
                end 
            else 
                state <= S9;
        S9:if(reg_poke[71:68] > receice_poker[7:4]&& !send_en[8]&& card_played[8]) begin
                poker_out <= reg_poke[71:64]; 
                card_played_1[8] <= 1'b0;
                comp_en <= 1'b1;
                state <= IDLE;
                current[8]<= 1'b1;
                end 
            else 
                state <= S10;
        S10:if(reg_poke[79:76] > receice_poker[7:4]&& !send_en[9]&& card_played[9])begin 
                poker_out <= reg_poke[79:72]; 
                card_played_1[9] <= 1'b0;
                comp_en <= 1'b1;
                state <= IDLE;
                current[9]<= 1'b1;
                end 
            else 
                state <= S11;  
        S11:if(reg_poke[87:84] > receice_poker[7:4]&& !send_en[10]&& card_played[10])begin 
                poker_out <= reg_poke[87:80];
                card_played_1[10] <= 1'b0;
                comp_en <= 1'b1;
                state <= IDLE;
                current[10]<= 1'b1;
                end 
             else 
                state <= S12;
        S12:if(reg_poke[95:92] > receice_poker[7:4]&& !send_en[11]&& card_played[11])begin 
                poker_out <= reg_poke[95:88];
                card_played_1[11] <= 1'b0;
                comp_en <= 1'b1;
                state <= IDLE;
                current[11]<= 1'b1;end 
             else 
                state <= S13;
        S13:if(reg_poke[103:100] > receice_poker[7:4]&& !send_en[12]&&card_played[12] ) begin 
                poker_out <= reg_poke[103:96]; 
                card_played_1[12] <= 1'b0;
                comp_en <= 1'b1;
                state <= IDLE;
                current[12]<= 1'b1;end 
             else 
                state <= S14;
        S14:if(reg_poke[111:108] > receice_poker[7:4]&& !send_en[13]&& card_played[13])begin 
                poker_out <= reg_poke[111:104]; 
                card_played_1[13] <= 1'b0;
                comp_en <= 1'b1;
                state <= IDLE;
                current[13]<= 1'b1;end
             else 
                state <= S15;  
        S15:if(reg_poke[119:116] > receice_poker[7:4]&& !send_en[14]&& card_played[14])begin 
                poker_out <= reg_poke[119:112]; 
                card_played_1[14] <= 1'b0;
                comp_en <= 1'b1;
                state <= IDLE;
                current[14]<= 1'b1;end 
            else 
                state <= S16;
        S16:if(reg_poke[127:124] > receice_poker[7:4]&& !send_en[15]&& card_played[15])begin 
                poker_out <= reg_poke[127:120]; 
                card_played_1[15] <= 1'b0;
                comp_en <= 1'b1;
                state <= IDLE;
                current[15]<= 1'b1;end 
             else
                state <= S17;
        S17:if(reg_poke[135:132] > receice_poker[7:4]&& !send_en[16]&& card_played[16]) begin 
                poker_out <= reg_poke[135:128];
                card_played_1[16] <= 1'b0;
                comp_en <= 1'b1;
                state <= IDLE;
                current[16]<= 1'b1;end 
            else begin 
                poker_out <= 8'hF0; 
                comp_en <= 1'b1;
                state <= IDLE;end  
        default:begin 
                poker_out <= 8'h00;
                comp_en <= 1'b0;end
        endcase

 assign send_en[0] = (current[0]|FPGA_flag_out)?1'b1:1'b0;
 assign send_en[1] = (current[1])?1'b1:1'b0;
 assign send_en[2] = (current[2])?1'b1:1'b0;
 assign send_en[3] = (current[3])?1'b1:1'b0;
 assign send_en[4] = (current[4])?1'b1:1'b0;
 assign send_en[5] = (current[5])?1'b1:1'b0;
 assign send_en[6] = (current[6])?1'b1:1'b0;
 assign send_en[7] = (current[7])?1'b1:1'b0;
 assign send_en[8] = (current[8])?1'b1:1'b0;
 assign send_en[9] = (current[9])?1'b1:1'b0;
 assign send_en[10] = (current[10])?1'b1:1'b0;
 assign send_en[11] = (current[11])?1'b1:1'b0;
 assign send_en[12] = (current[12])?1'b1:1'b0;
 assign send_en[13] = (current[13])?1'b1:1'b0;
 assign send_en[14] = (current[14])?1'b1:1'b0;
 assign send_en[15] = (current[15])?1'b1:1'b0;
 assign send_en[16] = (current[16])?1'b1:1'b0;

reg [25:0] state2;

always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        begin
        poker_out2 <= 1'b0;
        state2 <= IDLE;
        comp_en2 <= 1'b0;
        current2 <= 17'd0;
        reg_poke2 <= 136'd0;
        card_played_2 <= 17'b1111_1111_1111_11111; // 复位时将card_played的所有位设置为1    
        end
    else
        case(state2)
        IDLE:if(valid2)begin  
                state2 <= S1; 
                reg_poke2 <= poker;  
                comp_en2 <= 1'b0; 
                end 
            else begin 
                comp_en2 <= 1'b0;end
        S1:if((reg_poke2[7:4] > receice_poker2[7:4])&& reg_poke2[7:4] ==reg_poke2[15:12] && !send_en2[0]&& card_played[0]&& card_played[1]) begin 
                poker_out2 <= reg_poke2[15:0];
                card_played_2[0] <= 1'b0;
                card_played_2[1] <= 1'b0;
                comp_en2 <= 1'b1;
                state2 <= IDLE;
                current2[0]<= 1'b1;end 
             else 
                state2 <= S2;
        S2:if((reg_poke2[15:12] > receice_poker2[7:4])&&  reg_poke2[23:20] ==reg_poke2[15:12] && !send_en2[1]&& card_played[1]&& card_played[2])begin 
                poker_out2 <= reg_poke2[23:8]; 
                card_played_2[1] <= 1'b0;
                card_played_2[2] <= 1'b0;
                comp_en2 <= 1'b1;
                state2 <= IDLE;
                current2[1]<= 1'b1;end 
             else 
                state2 <= S3;   
        S3:if((reg_poke2[23:20] > receice_poker2[7:4])&& reg_poke2[23:20] ==reg_poke2[31:28] && !send_en2[2]&& card_played[2]&& card_played[3])begin 
                poker_out2 <= reg_poke2[31:16]; 
                card_played_2[2] <= 1'b0;
                card_played_2[3] <= 1'b0;
                comp_en2 <= 1'b1;
                state2 <= IDLE;
                current2[2]<= 1'b1;end 
             else 
                state2 <= S4;
        S4:if((reg_poke2[31:28] > receice_poker2[7:4])&& reg_poke2[39:36] ==reg_poke2[31:28] && !send_en2[3]&& card_played[3]&& card_played[4])begin 
                poker_out2 <= reg_poke2[39:24];
                card_played_2[3] <= 1'b0;
                card_played_2[4] <= 1'b0;
                comp_en2 <= 1'b1;
                state2 <= IDLE;
                current2[3]<= 1'b1;end 
             else 
                state2 <= S5;
        S5:if(reg_poke2[39:36] > receice_poker2[7:4]&& reg_poke2[39:36] ==reg_poke2[47:44] && !send_en2[4]&& card_played[4]&& card_played[5]) begin 
                poker_out2 <= reg_poke2[47:32]; 
                card_played_2[4] <= 1'b0;
                card_played_2[5] <= 1'b0;
                comp_en2 <= 1'b1;
                state2 <= IDLE;
                current2[4]<= 1'b1;end 
            else 
                state2 <= S6;
        S6:if(reg_poke2[47:44] > receice_poker2[7:4]&& reg_poke2[55:52] ==reg_poke2[47:44] && !send_en2[5]&& card_played[5]&& card_played[6])begin 
                poker_out2 <= reg_poke2[55:40];
                card_played_2[5] <= 1'b0;
                card_played_2[6] <= 1'b0;
                comp_en2 <= 1'b1;
                state2 <= IDLE;
                current2[5]<= 1'b1;end
            else 
                state2 <= S7;  
        S7:if(reg_poke2[55:52] > receice_poker2[7:4]&& reg_poke2[63:60] ==reg_poke2[55:52] &&!send_en2[6]&& card_played[6]&& card_played[7])begin 
                poker_out2 <= reg_poke2[63:48]; 
                card_played_2[6] <= 1'b0;
                card_played_2[7] <= 1'b0;
                comp_en2 <= 1'b1;
                state2 <= IDLE;
                current2[6]<= 1'b1;end 
            else 
                state2 <= S8;
        S8:if(reg_poke2[63:60] > receice_poker2[7:4]&& reg_poke2[63:60] ==reg_poke2[71:68] &&!send_en2[7]&& card_played[7]&& card_played[8])begin 
                poker_out2 <= reg_poke2[71:56]; 
                card_played_2[7] <= 1'b0;
                card_played_2[8] <= 1'b0;
                comp_en2 <= 1'b1;
                state2 <= IDLE;
                current2[7]<= 1'b1;end 
            else 
                state2 <= S9;
        S9:if(reg_poke2[71:68] > receice_poker2[7:4]&& reg_poke2[79:76] ==reg_poke2[71:68] && !send_en2[8]&& card_played[8]&& card_played[9]) begin
                poker_out2 <= reg_poke2[79:64]; 
                card_played_2[8] <= 1'b0;
                card_played_2[9] <= 1'b0;
                comp_en2 <= 1'b1;
                state2 <= IDLE;
                current2[8]<= 1'b1;end 
            else 
                state2 <= S10;
        S10:if(reg_poke2[79:76] > receice_poker2[7:4]&& reg_poke2[79:76] ==reg_poke2[87:84] && !send_en2[9]&& card_played[9]&& card_played[10])begin 
                poker_out2 <= reg_poke2[87:72]; 
                card_played_2[9] <= 1'b0;
                card_played_2[10] <= 1'b0;
                comp_en2 <= 1'b1;
                state2 <= IDLE;
                current2[9]<= 1'b1;end 
            else 
                state2 <= S11;  
        S11:if(reg_poke2[87:84] > receice_poker2[7:4]&& reg_poke2[95:92] ==reg_poke2[87:84] && !send_en2[10]&& card_played[10]&& card_played[11])begin 
                poker_out2 <= reg_poke2[95:80];
                card_played_2[10] <= 1'b0;
                card_played_2[11] <= 1'b0;
                comp_en2 <= 1'b1;
                state2 <= IDLE;
                current2[10]<= 1'b1;end 
             else 
                state2 <= S12;
        S12:if(reg_poke2[95:92] > receice_poker2[7:4]&& reg_poke2[95:92] ==reg_poke2[103:100] && !send_en2[11]&& card_played[11]&& card_played[12])begin 
                poker_out2 <= reg_poke2[103:88];
                card_played_2[11] <= 1'b0;
                card_played_2[12] <= 1'b0;
                comp_en2 <= 1'b1;
                state2 <= IDLE;
                current2[11]<= 1'b1;end 
             else 
                state2 <= S13;
        S13:if(reg_poke2[103:100] > receice_poker2[7:4]&& reg_poke2[111:108] ==reg_poke2[103:100] &&  !send_en2[12]&& card_played[12]&& card_played[13]) begin 
                poker_out2 <= reg_poke2[111:96]; 
                card_played_2[12] <= 1'b0;
                card_played_2[13] <= 1'b0;
                comp_en2 <= 1'b1;
                state2 <= IDLE;
                current2[12]<= 1'b1;end 
             else 
                state2 <= S14;
        S14:if(reg_poke2[111:108] > receice_poker2[7:4]&& reg_poke2[111:108] ==reg_poke2[119:116] && !send_en2[13]&& card_played[13]&& card_played[14])begin 
                poker_out2 <= reg_poke2[119:104];
                card_played_2[13] <= 1'b0;
                card_played_2[14] <= 1'b0; 
                comp_en2 <= 1'b1;
                state2 <= IDLE;
                current2[13]<= 1'b1;end
             else 
                state2 <= S15;  
        S15:if(reg_poke2[119:116] > receice_poker2[7:4]&& reg_poke2[127:124] ==reg_poke2[119:116] && !send_en2[14]&& card_played[14]&& card_played[15])begin 
                poker_out2 <= reg_poke2[127:112]; 
                card_played_2[14] <= 1'b0;
                card_played_2[15] <= 1'b0;
                comp_en2 <= 1'b1;
                state2 <= IDLE;
                current2[14]<= 1'b1;end 
            else 
                state2 <= S16;
        S16:if(reg_poke2[127:124] > receice_poker2[7:4]&& reg_poke2[127:124] ==reg_poke2[135:132] && !send_en2[15]&& card_played[15]&& card_played[16])begin 
                poker_out2 <= reg_poke2[135:120]; 
                card_played_2[15] <= 1'b0;
                card_played_2[16] <= 1'b0;
                comp_en2 <= 1'b1;
                state2 <= IDLE;
                current2[15]<= 1'b1;end 
             else begin
                poker_out2 <= 16'hF0F0; 
                comp_en2 <= 1'b1;
                state2 <= IDLE;end  
        default:begin 
                poker_out2 <= 16'hF0F0;
                comp_en2 <= 1'b0;end
        endcase

 assign send_en2[0] = (current2[0])?1'b1:1'b0;
 assign send_en2[1] = (current2[1])?1'b1:1'b0;
 assign send_en2[2] = (current2[2])?1'b1:1'b0;
 assign send_en2[3] = (current2[3])?1'b1:1'b0;
 assign send_en2[4] = (current2[4])?1'b1:1'b0;
 assign send_en2[5] = (current2[5])?1'b1:1'b0;
 assign send_en2[6] = (current2[6])?1'b1:1'b0;
 assign send_en2[7] = (current2[7])?1'b1:1'b0;
 assign send_en2[8] = (current2[8])?1'b1:1'b0;
 assign send_en2[9] = (current2[9])?1'b1:1'b0;
 assign send_en2[10] = (current2[10])?1'b1:1'b0;
 assign send_en2[11] = (current2[11])?1'b1:1'b0;
 assign send_en2[12] = (current2[12])?1'b1:1'b0;
 assign send_en2[13] = (current2[13])?1'b1:1'b0;
 assign send_en2[14] = (current2[14])?1'b1:1'b0;
 assign send_en2[15] = (current2[15])?1'b1:1'b0;
 /*
 //先出牌       
reg [25:0] state3;

wire     [16:0]        send_en3;
reg     [135:0]      reg_poke3;
reg     [16:0]       current3;
 
always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        begin
        First_poke <= 8'b0;
        state3 <= IDLE;
        current3 <= 17'd0;
        reg_poke3 <= 136'd0;
        end
    else
        case(state3)
        IDLE:if(FPGA_flag_out && rx_done)begin  
                state3 <= S1; 
                reg_poke3 <= poker;  
                end
        S1:if( card_played[0] && send_en3[0]) begin 
                First_poke <= reg_poke3[7:0];
                card_played[0] <= 1'b0;
                state3 <= IDLE;
                current3[0]<= 1'b1;end 
             else 
                state3 <= S2;        
        S2:if( card_played[1] && !send_en3[1]) begin 
                First_poke <= reg_poke3[15:8];
                card_played[1] <= 1'b0;
                state3 <= IDLE;
                current3[1]<= 1'b1;end 
             else 
                state3 <= S3; 
        S3:if( card_played[2] && !send_en3[2]) begin 
                First_poke <= reg_poke3[23:16];
                card_played[2] <= 1'b0;
                state3 <= IDLE;
                current3[2]<= 1'b1;end 
             else 
                state3 <= S4;                               
        S4:if( card_played[3] && !send_en3[3]) begin 
                First_poke <= reg_poke3[31:24];
                card_played[3] <= 1'b0;
                state3 <= IDLE;
                current3[3]<= 1'b1;end 
             else 
                state3 <= S5;    
        S5:if( card_played[4] && !send_en3[4]) begin 
                First_poke <= reg_poke3[39:32];
                card_played[4] <= 1'b0;
                state3 <= IDLE;
                current3[4]<= 1'b1;end 
             else 
                state3 <= S6;                     
         S6:if( card_played[5] && !send_en3[5]) begin //
                First_poke <= reg_poke3[47:40];       //
                card_played[5] <= 1'b0;               //
                state3 <= IDLE;
                current3[5]<= 1'b1;end               //
             else 
                state3 <= S7;                         //
         S7:if( card_played[6] && !send_en3[6]) begin //
                First_poke <= reg_poke3[55:48];       //
                card_played[6] <= 1'b0;               //
                state3 <= IDLE;
                current3[6]<= 1'b1;end               //
             else 
                state3 <= S8;                         //                
         S8:if( card_played[7] && !send_en3[7]) begin //
                First_poke <= reg_poke3[63:56];       //
                card_played[7] <= 1'b0;               //
                state3 <= IDLE;
                current3[7]<= 1'b1;end               //
             else 
                state3 <= S9;                         //                        
          S9:if( card_played[8] && !send_en3[8]) begin //
                First_poke <= reg_poke3[71:64];       //
                card_played[8] <= 1'b0;               //
                state3 <= IDLE;
                current3[8]<= 1'b1;end               //
             else 
                state3 <= S10;                         //                       
          S10:if( card_played[9] && !send_en3[9]) begin //
                First_poke <= reg_poke3[79:72];       //
                card_played[9] <= 1'b0;               //
                state3 <= IDLE;
                current3[9]<= 1'b1;end               //
             else 
                state3 <= S11;                         //                          
          S11:if( card_played[10] && !send_en3[10]) begin //
                First_poke <= reg_poke3[87:80];       //
                card_played[10] <= 1'b0;               //
                state3 <= IDLE;
                current3[10]<= 1'b1;end               //
             else 
                state3 <= S12;                         //                          
          S12:if( card_played[11] && !send_en3[11]) begin //
                First_poke <= reg_poke3[95:88];       //
                card_played[11] <= 1'b0;               //
                state3 <= IDLE;
                current3[11]<= 1'b1;end               //
             else 
                state3 <= S13;                         //                     
           S13:if( card_played[12] && !send_en3[12]) begin //
                First_poke <= reg_poke3[103:96];       //
                card_played[12] <= 1'b0;               //
                state3 <= IDLE;
                current3[12]<= 1'b1;end               //
             else 
                state3 <= S14;                         //        
           S14:if( card_played[13] && !send_en3[13]) begin //
                First_poke <= reg_poke3[111:104];       //
                card_played[13] <= 1'b0;               //
                state3 <= IDLE;
                current3[13]<= 1'b1;end               //
             else 
                state3 <= S15;                         //                       
           S15:if( card_played[14] && !send_en3[14]) begin //
                First_poke <= reg_poke3[119:112];       //
                card_played[14] <= 1'b0;               //
                state3 <= IDLE;
                current3[14]<= 1'b1;end               //
             else 
                state3 <= S16;                         //                      
           S16:if( card_played[15] && !send_en3[15]) begin //
                First_poke <= reg_poke3[127:120];       //
                card_played[15] <= 1'b0;               //
                state3 <= IDLE;
                current3[15]<= 1'b1;end               //
             else 
                state3 <= S17;                         //    
           S17:if( card_played[16] && !send_en3[16]) begin //
                First_poke <= reg_poke3[135:128];       //
                card_played[16] <= 1'b0;               //
                state3 <= IDLE;
                current3[16]<= 1'b1;end               //
             else 
                state3 <= IDLE;                         //                                                
        default:begin 
             First_poke <= reg_poke3[135:128];
                end
        endcase       
 assign send_en3[0] = (current3[0] || FPGA_flag_out)?1'b1:1'b0;
 assign send_en3[1] = (current3[1])?1'b1:1'b0;
 assign send_en3[2] = (current3[2])?1'b1:1'b0;
 assign send_en3[3] = (current3[3])?1'b1:1'b0;
 assign send_en3[4] = (current3[4])?1'b1:1'b0;
 assign send_en3[5] = (current3[5])?1'b1:1'b0;
 assign send_en3[6] = (current3[6])?1'b1:1'b0;
 assign send_en3[7] = (current3[7])?1'b1:1'b0;
 assign send_en3[8] = (current3[8])?1'b1:1'b0;
 assign send_en3[9] = (current3[9])?1'b1:1'b0;
 assign send_en3[10] = (current3[10])?1'b1:1'b0;
 assign send_en3[11] = (current3[11])?1'b1:1'b0;
 assign send_en3[12] = (current3[12])?1'b1:1'b0;
 assign send_en3[13] = (current3[13])?1'b1:1'b0;
 assign send_en3[14] = (current3[14])?1'b1:1'b0;
 assign send_en3[15] = (current3[15])?1'b1:1'b0; 
 */
endmodule
