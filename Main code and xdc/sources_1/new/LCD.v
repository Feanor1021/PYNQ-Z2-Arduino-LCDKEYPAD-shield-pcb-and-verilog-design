`timescale 1ns / 1ps

module LCD(input CLK,
    output [3:0] data,
    output reg RS, EN);
    
    reg [3:0] lcd_cmd;
    reg [5:0]state = 0;
    reg [25:0]count=0;
    
    assign data = lcd_cmd;
    
    always @(posedge CLK) begin 
        case(state)
//init iþlemlerinin baþlangýcý. Bu aþama raporda detaylý olarak anlatýlmýþtýr.
        0:begin
        EN <= 0;
        RS <= 0;
        if(count == 1875000) 
            begin
                count <= 0;
                state <= state + 1;
            end
        else
            count <= count+1;
        end
        
        1: begin
        EN <= 1;
        lcd_cmd <= 4'h3;
        if(count == 30) 
            begin
                count <= 0;
                state <= state + 1;
        end
        else
            count<=count+1;
        end

        2:begin
        EN<=0;
        if(count ==512500) 
            begin
                count <= 0;
                state <= state+1;
            end
        else
            count<=count+1;
        end
    
        3:begin
        EN<=1;
        lcd_cmd<=4'h3;
        if(count==30)
            begin
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
        
        4:begin
        EN<=0;
        if(count == 12500)
            begin
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
        5:begin
        EN<=1;
        lcd_cmd<=4'h3;
        if(count == 30)
            begin
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
        6:begin
        EN<=0;
        if(count == 5000)
            begin
                count <=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
        7:begin
        EN<=1;
        lcd_cmd<=4'h2;
        if(count == 30)
            begin 
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
        8:begin
        EN<=0;
        if(count ==5000)
            begin
                count<=0;
                state<=state+1;
            end
        else
            count <= count+1;
        end
    //---init iþlemleri bitti------------
    //--Ýnstruction register'a gerekli ayarlarýn yazýmý. Bu modlar raporda açýklanmýþtýr.-----
        9:begin
        EN<=1;
        lcd_cmd<=4'h2;
        if(count == 30) 
            begin
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
        10:begin
        EN<=0;
        if(count==125) 
            begin
                EN<=1;
                lcd_cmd<=4'h8;
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
        11:begin
        if(count == 30) 
            begin
                EN<=0;
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
        12:begin
        if(count == 5000) 
            begin
                count<=0;
                state<=state+1;
            end
        else
            count <= count+1;
        end
    
        13:begin
        EN<=0;
        lcd_cmd<=4'h0;
        if(count == 30)
            begin
                count<=0;
                state<=state+1;
            end
        else
        count<=count+1;
        end
    
        14:begin
        EN<=0;
        if(count==125)
            begin
                EN<=1;
                lcd_cmd<=4'hE;
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
        15:begin
        if(count == 30)
            begin
                EN<=0;
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
        16:begin
        if(count == 5000)
            begin
                count <=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
        17:begin
        EN<=1;
        lcd_cmd<=4'h0;
        if(count == 30)
            begin
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
        18:begin
        EN<=0;
        if(count == 125)
            begin
                EN<=1;
                lcd_cmd<=4'h6;
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
        19:begin
        if(count == 30)
            begin
                EN<=0;
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
        20:begin
        if(count == 5000)
            begin
                count <= 0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
        21:begin
        EN<=1;
        lcd_cmd<=4'h0;
        if(count == 30)
            begin
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
        22:begin
        EN<=0;
        if(count == 125)
            begin
                EN<=1;
                lcd_cmd<=4'h1;
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
        23:begin
        if(count == 30)
            begin
                EN<=0;
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
    
        24:begin
        if(count == 205000)
            begin
                count <= 0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
        25:begin
        EN<=1;
        lcd_cmd<=4'h8;
        if(count == 30)
            begin
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
        26:begin
        EN<=0;
        if(count == 125)
            begin
                EN<=1;
                lcd_cmd<=4'h0;
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
        27:begin
        if(count == 30)
            begin
                EN<=0;
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
        28:begin
        if(count == 5000)
            begin
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
//----------Ýnstuction register'a veri yazýmý bitti. Aþaðýda data register'a FURKAN yazým kodu vardýr.    
        29:begin
        EN<=1;
        RS<=1;
        lcd_cmd<=4'h4;
        if(count == 30)
            begin
                count <=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
        30:begin
        EN<=0;
        if(count == 125) 
            begin
                EN<=1;
                lcd_cmd<=4'h2;
                state<=state+1;
            end
        else
        count<=count+1;
        end

        31:begin
        if(count == 30)
            begin
                EN<=0;
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
        32:begin
        if(count == 5000)
            begin
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
//F harfi bitti U'ya geçtik.
        33:begin
        EN<=1;
        RS<=1;
        lcd_cmd<=4'h5;
        if(count == 30) 
            begin
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
        34:begin
        EN<=0;
        if(count == 125) 
            begin
                EN<=1;
                lcd_cmd<=4'h5;
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
        35:begin
        if(count == 30)
            begin
                EN<=0;
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
        36:begin
        if(count == 5000)
            begin
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
//U harfi yazýldý. R harfinin yazma iþlemi baþladý.
        37:begin
        EN<=1;
        RS<=1;
        lcd_cmd<=4'h4;
        if(count==30)
            begin
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
        38:begin
        EN<=0;
        if(count == 125)
            begin
                EN<=1;
                lcd_cmd<=4'h7;
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
        39:begin
        if(count == 30)
            begin
                EN<=0;
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
        40:begin
        if(count == 5000)
            begin
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
//R harfi yazýldý K harfinin yazýlma iþlemi baþladý.
        41:begin
        EN<=1;
        RS<=1;
        lcd_cmd<=4'h5;
        if(count == 30)
            begin
                count <=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
        42:begin
        EN<=0;
        if(count == 125)
            begin
                EN<=1;
                lcd_cmd<=4'h2;
                state<=state+1;
            end
        else
            count<=count+1;
        end
  
        43:begin
        if(count == 30)
            begin
                EN<=0;
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
        44:begin
        if(count == 5000)
            begin
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
//K harfi yazýldý. A harfinin yazýlma iþlemi baþaldý. 
        45:begin
        EN<=1;
        RS<=1;
        lcd_cmd<=4'h4;
        if(count == 30)
            begin
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
        46:begin
        EN<=0;
        if(count == 125)
            begin
                EN<=1;
                lcd_cmd<=4'h1;
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
        47:begin
        if(count == 30)
            begin
                EN<=0;
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
        48:begin
        if(count == 5000)
            begin
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
//A harfi yazýldý. N harfinin yazýlma iþlemi baþladý.      
        49:begin
        EN<=1;
        RS<=1;
        lcd_cmd<=4'h4;
        if(count==30)
            begin
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
        50:begin
        EN<=0;
        if(count == 125)
            begin
                EN<=1;
                lcd_cmd<=4'hE;
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
        51: begin
        if(count == 30)
            begin
                EN<=0;
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
    
        52:begin
        if(count == 5000)
            begin
                count<=0;
                state<=state+1;
            end
        else
            count<=count+1;
        end
//Ekrana FURKAN yazýldý.
        endcase
    end
endmodule