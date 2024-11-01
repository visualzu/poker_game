module sort(
	input clk,
	input rst_n,
	input sort_start,
	input	 [135:0]	receive_data,//17张牌
	
    output reg  flag_en,
	output reg sort_end,
	output reg [135:0]data_out//17张牌
);
    reg     receive_flag;
    reg     flag_start;
	reg [7:0]data_in[16:0];
	reg [7:0] k;
	reg [7:0] h;
    always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
		  begin
		  receive_flag <= 1'b0;
		  flag_start <= 1'b0;
		  end
		else
		  begin
		  receive_flag <= sort_start;
		  flag_start <= receive_flag;
		  end
		  end
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
		  k <= 1'b0;
	    else 
	       for(k=0;k<17;k = k + 1)
	           begin
	               if(sort_start)
	                   data_in[k] <= receive_data[8*k +: 8];
					   //将receive_data中的8位数据赋值给data_in数组的第k个元素。
					   //这里receive_data[8*k +: 8]表示从receive_data的8*k位开始的连续8位数据。
	           end
	      end     
	
	parameter len = 16;
	reg [7:0]i;
	reg [7:0]j;
	reg en;
	
	//控制比较使能信号
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
			en <= 1'b0;
		else if(flag_start)
			en <= 1'b1;
		else if(sort_end)
			en <= 1'b0;
		else
			en <= en;
	end
	
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
			sort_end <= 1'b0;
		else if((j == len-1) && (i == len-1-j))
			sort_end <= 1'b1;
		else
			sort_end <= 1'b0;
	end
	
	//内部循环
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
			i <= 'd0;
		else if(en)begin
			if(i < len-1-j)
				i <= i + 1'b1;
			else
				i <= 'd0;
		end
		else
			i <= 'd0;
	end
	
	reg	[3:0]	cnt_reg;
	reg [7:0]data_r[16:0];
	reg [7:0]temp;
	
	//数据比较
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)begin
			temp = 'd0;
		end
		else if(flag_start)
		begin
	       for(h=0;h<17;h=h+1)
	           data_r[h]<=data_in[h];
		end
		else if(data_r[i] > data_r[i+1])begin
			temp = data_r[i];
			data_r[i] = data_r[i+1];
			data_r[i+1] = temp;
		end
		else begin
			temp = temp;
			data_r[i] =data_r[i];
			data_r[i+1] = data_r[i+1];
		end			
	end
	
	//外层循环
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
			j <= 'd0;
		else if(en)begin
			if(i == len-1-j)
				j <= j + 1'b1;
			else
				j <= j;
		end
		else
			j <= 'd0;
	end
	
	reg end_en;
	reg [8:0]cnt;
	
	//比较之后数据输出
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
			end_en <= 1'b0;
		else if(sort_end)
			end_en <= 1'b1;
		else if(cnt == 'd16)
			end_en <= 1'b0;
		else
			end_en <= end_en;
	end
	
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
			cnt <= 'd0;
		else if(end_en)begin
			if(cnt == 'd16)
				cnt <= 'd0;
			else
				cnt <= cnt + 1'b1;
		end
		else
			cnt <= 'd0;
	end
	
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
			data_out <= 'd0; 
		else if(end_en)
			begin
			//data_out <= {data_out[23:0],data_r[cnt]}; 
			data_out <= {data_r[cnt],data_out[135:8]}; 
			end
		else
			data_out <= data_out; 
	end
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
		  flag_en<=1'b0;
		else if(cnt == 'd16 && end_en)
		  flag_en<=1'b1;
	    else
	      flag_en<=1'b0;
       end


endmodule


