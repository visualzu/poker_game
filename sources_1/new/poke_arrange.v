`timescale 1ns / 1ps

module poke_arrange(
    input                    sys_clk,
    input                    sys_rst_n,
    input                    receivepoke_done,
    input    [135:0]         receive_poke,
    
    output  reg [135:0]      poke,
    output  reg              arrange_done   
        );
reg     [25:0]  state;
parameter   IDLE  = 26'b00_0000_0000_0000_0000_0000_0000, S1 = 26'b00_0000_0000_0000_0000_0000_0001, S2   = 26'b00_0000_0000_0000_0000_0000_0010,
             S3  = 26'b00_0000_0000_0000_0000_0000_0100,S4   = 26'b00_0000_0000_0000_0000_0000_1000,S5   =  26'b00_0000_0000_0000_0000_0001_0000,
             S6  = 26'b00_0000_0000_0000_0000_0010_0000,S7   = 26'b00_0000_0000_0000_0000_0100_0000,S8   =  26'b00_0000_0000_0000_0000_1000_0000,
             S9  = 26'b00_0000_0000_0000_0001_0000_0000,S10  = 26'b00_0000_0000_0000_0010_0000_0000,S11  =  26'b00_0000_0000_0000_0100_0000_0000,
             S12 = 26'b00_0000_0000_0000_1000_0000_0000,S13  = 26'b00_0000_0000_0001_0000_0000_0000,S14  =  26'b00_0000_0000_0010_0000_0000_0000,
             S15 = 26'b00_0000_0000_0100_0000_0000_0000,S16  = 26'b00_0000_0000_1000_0000_0000_0000;
always@(posedge sys_clk  or negedge sys_rst_n)
    if(!sys_rst_n)
        begin
            poke        <=   1'b0;       
            arrange_done<=   1'b0;
        end
    else
        case(state)     
        IDLE:begin arrange_done <= 1'b0;
            if(receivepoke_done)begin
                if(receive_poke[7:4]==4'h2)begin
                     poke[7:0] <= {4'hF,receive_poke[3:0]};
                     state <= S1;end
                else if(receive_poke[7:4]==4'h1)begin 
                    poke[7:0] <= {4'hE,receive_poke[3:0]};
                    state<= S1;end 
                 else begin 
                    poke[7:0] <= receive_poke[7:0]; 
                    state<= S1;end end end 
        S1: if(receive_poke[15:12]==4'h2)begin
                 poke[15:8] <= {4'hF,receive_poke[11:8]};
                 state <= S2;end
            else if(receive_poke[15:12]==4'h1)begin 
                 poke[15:8] <= {4'hE,receive_poke[11:8]};
                 state<= S2;end
            else begin
                 poke[15:8] <= receive_poke[15:8];
                 state<= S2;end
        S2:if(receive_poke[23:20]==4'h2)begin
                 poke[23:16] <= {4'hF,receive_poke[19:16]};
                 state <= S3;end
            else if(receive_poke[23:20]==4'h1)begin
                 poke[23:16] <= {4'hE,receive_poke[19:16]};
                 state<= S3;end
            else begin
                 poke[23:16] <= receive_poke[23:16]; 
                 state<= S3;end
        S3:if(receive_poke[31:28]==4'h2)begin 
                 poke[31:24] <= {4'hF,receive_poke[27:24]};
                 state <= S4;end
            else if(receive_poke[31:28]==4'h1)begin 
                 poke[31:24] <= {4'hE,receive_poke[27:24]};
                 state<= S4;end
            else begin
                 poke[31:24] <= receive_poke[31:24]; 
                 state<= S4;end
        S4:if(receive_poke[39:36]==4'h2)begin 
                 poke[39:32] <= {4'hF,receive_poke[35:32]};
                 state <= S5;end
            else if(receive_poke[39:36]==4'h1)begin
                 poke[39:32] <= {4'hE,receive_poke[35:32]};
                 state<= S5;end
            else begin
                 poke[39:32] <= receive_poke[39:32];
                 state<= S5;end 
        S5:if(receive_poke[47:44]==4'h2)begin 
                 poke[47:40] <= {4'hF,receive_poke[43:40]};
                 state <= S6;end
            else if(receive_poke[47:44]==4'h1)begin 
                 poke[47:40] <= {4'hE,receive_poke[43:40]};
                 state<= S6;end
            else begin 
                 poke[47:40] <= receive_poke[47:40]; 
                 state<= S6;end   
        S6:if(receive_poke[55:52]==4'h2)begin 
                 poke[55:48] <= {4'hF,receive_poke[51:48]};
                 state <= S7;end
            else if(receive_poke[55:52]==4'h1)begin 
                 poke[55:48] <= {4'hE,receive_poke[51:48]};
                 state<= S7;end
            else begin 
                 poke[55:48] <= receive_poke[55:48];
                 state<= S7;end       
        S7:if(receive_poke[63:60]==4'h2)begin 
                 poke[63:56] <= {4'hF,receive_poke[59:56]};
                 state <= S8;end
            else if(receive_poke[63:60]==4'h1)begin
                 poke[63:56] <= {4'hE,receive_poke[59:56]};
                 state<= S8;end
            else begin 
                 poke[63:56] <= receive_poke[63:56]; 
                 state<= S8;end
        S8:if(receive_poke[71:68]==4'h2)begin
                 poke[71:64] <= {4'hF,receive_poke[67:64]};
                 state <= S9;end
            else if(receive_poke[71:68]==4'h1)begin 
                 poke[71:64] <= {4'hE,receive_poke[67:64]};
                 state<= S9;end
            else begin 
                 poke[71:64] <= receive_poke[71:64]; 
                 state<= S9;end  
        S9:if(receive_poke[79:76]==4'h2)begin 
                 poke[79:72] <= {4'hF,receive_poke[75:72]};
                 state <= S10;end
            else if(receive_poke[79:76]==4'h1)begin 
                 poke[79:72] <= {4'hE,receive_poke[75:72]};
                 state<= S10;end
            else begin 
                 poke[79:72] <= receive_poke[79:72];
                 state<= S10;end   
        S10:if(receive_poke[87:84]==4'h2)begin 
                 poke[87:80] <= {4'hF,receive_poke[83:80]};
                 state <= S11;end
            else if(receive_poke[87:84]==4'h1)begin 
                 poke[87:80] <= {4'hE,receive_poke[83:80]};
                 state<= S11;end
            else begin 
                 poke[87:80] <= receive_poke[87:80]; 
                 state<= S11;end
        S11:if(receive_poke[95:92]==4'h2)begin 
                 poke[95:88] <= {4'hF,receive_poke[91:88]};
                 state <= S12;end
            else if(receive_poke[95:92]==4'h1)begin
                 poke[95:88] <= {4'hE,receive_poke[91:88]};
                 state<= S12;end
            else begin
                 poke[95:88] <= receive_poke[95:88]; 
                 state<= S12;end    
        S12:if(receive_poke[103:100]==4'h2)begin 
                 poke[103:96] <= {4'hF,receive_poke[99:96]};
                 state <= S13;end
            else if(receive_poke[103:100]==4'h1)begin
                 poke[103:96] <= {4'hE,receive_poke[99:96]};
                 state<= S13;end
            else begin
                 poke[103:96] <= receive_poke[103:96]; 
                 state<= S13;end      
        S13:if(receive_poke[111:108]==4'h2)begin
                 poke[111:104] <= {4'hF,receive_poke[107:104]};
                 state <= S14;end
            else if(receive_poke[111:108]==4'h1)begin 
                 poke[111:104] <= {4'hE,receive_poke[107:104]};
                 state<= S14;end
            else begin 
                 poke[111:104] <= receive_poke[111:104]; 
                 state<= S14;end
        S14:if(receive_poke[119:116]==4'h2)begin 
                 poke[119:112] <= {4'hF,receive_poke[115:112]};
                 state <= S15;end
            else if(receive_poke[119:116]==4'h1)begin 
                 poke[119:112] <= {4'hE,receive_poke[115:112]};
                 state<= S15;end
            else begin 
                 poke[119:112] <= receive_poke[119:112]; 
                 state<= S15;end 
        S15:if(receive_poke[127:124]==4'h2)begin 
                 poke[127:120] <= {4'hF,receive_poke[123:120]};
                 state <= S16;end
            else if(receive_poke[127:124]==4'h1)begin 
                 poke[127:120] <= {4'hE,receive_poke[123:120]};
                 state<= S16;end
            else begin 
                 poke[127:120] <= receive_poke[127:120];
                 state<= S16;end  
        S16:if(receive_poke[135:132]==4'h2)begin 
                 poke[135:128] <= {4'hF,receive_poke[131:128]};
                 state <= IDLE;
                 arrange_done <= 1'b1;end
            else if(receive_poke[135:132]==4'h1)begin 
                 poke[135:128] <= {4'hE,receive_poke[131:128]};
                 state<= IDLE;
                 arrange_done <= 1'b1;end
            else begin 
                 poke[135:128] <= receive_poke[135:128];
                 state<= IDLE;
                 arrange_done <= 1'b1;end     
        default:begin 
                arrange_done <=  1'b0;
                poke[135:0] <= poke[135:0]; 
                end
        endcase
endmodule
