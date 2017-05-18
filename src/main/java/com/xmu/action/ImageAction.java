package com.xmu.action;
  
import java.awt.Color;  
import java.awt.Font;  
import java.awt.Graphics;  
import java.awt.image.BufferedImage;   
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.stereotype.Controller;
  
/**
 * 
 * 验证码生成ACTION
 * 访问路径/image.action
 *
 */
@Controller  
@ParentPackage("struts-default")
@Namespace("")  
public class ImageAction extends SuperAction{  
  
    private static final long serialVersionUID = 1L;  
    private String chknumber;  
    @Override  
    @Action(value="image")
    public String execute() throws Exception  
    {  
    	Random random = new Random();  
        int width=80; //图片宽度  
        int height=35; //图片高度  
        BufferedImage image=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);  
        Graphics graphics=image.getGraphics();  
        graphics.setColor(getRandColor(200, 250));   //背景颜色  
        graphics.fillRect(0, 0, width, height);  
        graphics.setFont(new Font("黑体", Font.PLAIN, 18));  
        graphics.setColor(getRandColor(160, 200));  
        for (int i = 0; i < 155; i++) {  
            int x = random.nextInt(width);  
            int y = random.nextInt(height);  
            int xl = random.nextInt(10);  
            int yl = random.nextInt(10);  
            graphics.drawLine(x, y, x + xl, y + yl);  
        }  
        String sRand = "";
        String[] str = { 
                "1", "2", "3", "4", "5", "6", "7", "8", "9" };  
        for (int i = 0; i < 4; i++) {  
            String rand = str[random.nextInt(str.length)];  
            sRand += rand;  
            // 将认证码显示到图象中  
            graphics.setColor(new Color(20 + random.nextInt(110), 20 + random  
                    .nextInt(110), 20 + random.nextInt(110)));//调用函数出来的颜色相同，可能是因为种子太接近，所以只能直接生成  
            graphics.drawString(rand, 16 * i + 10, 24);  
        }   
        request.getSession().setAttribute("checkcode", sRand);
        Cookie cookie1 = new Cookie("checkcode",sRand);
        response.addCookie(cookie1);
        ImageIO.write(image,"jpg",response.getOutputStream());
        return null;  
    }  
    private Color getColor(){  
        int red=(int)(Math.random()*1000%256);  
        int green=(int)(Math.random()*1000%256);  
        int blue=(int)(Math.random()*1000%256);  
        return new Color(red,green,blue);  
     }  
   public Color getRandColor(int fc, int bc) {//给定范围获得随机颜色  
        Random random = new Random();  
        if (fc > 255)  
            fc = 255;  
        if (bc > 255)  
            bc = 255;  
        int r = fc + random.nextInt(bc - fc);  
        int g = fc + random.nextInt(bc - fc);  
        int b = fc + random.nextInt(bc - fc);  
        return new Color(r, g, b);  
   }
    public String getChknumber()  
    {  
        return chknumber;  
    }  
    public void setChknumber(String chknumber)  
    {  
        this.chknumber = chknumber;  
    }  
  
 
    
}  