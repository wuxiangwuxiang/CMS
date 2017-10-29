package com.qdu.util;

import java.util.Random;

/**
 * @Author xp
 * @Description 验证码生成工具类
 * @Date 2017/4/21 20:12
 */
public class VertifyCodeUtil {

    // 使用到Algerian字体，系统里没有的话需要安装字体，字体只显示大写，去掉了1,0,i,o几个容易混淆的字符
    public static int getVertifyCode(){
    	 int x;//定义两变量
         Random ne=new Random();//实例化一个random的对象ne
         x=ne.nextInt(9999-1000+1)+1000;//为变量赋随机值1000-9999
		return x;
    }
}
