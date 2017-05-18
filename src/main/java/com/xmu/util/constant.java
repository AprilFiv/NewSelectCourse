package com.xmu.util;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class constant {
	public static long endTime = getConstantTime(2017,4,3,17,0,0);
	public static long setTime = getConstantTime(2017,4,3,16,50,0);
	public static int setPoint = 10000;
	public static long getConstantTime(Integer year,Integer month ,Integer day,Integer hour,Integer min,Integer sec){
		Calendar calendar = Calendar.getInstance();
		calendar.set(year,month,day,hour,min,sec);//Calendar 月份从0开始
		return calendar.getTimeInMillis();
	}
}
