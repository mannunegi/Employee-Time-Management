package com.time.utility;

import java.time.LocalTime;

public class TimeUtility {
	
	public static  String getCurrentTime()
	{
		LocalTime now = LocalTime.now();
		String time=now.getHour()+":"+now.getMinute()+":"+now.getSecond();
		return time;
	}
	public static String getTotalTime(String intime,String outtime)
	{
		
		int outtimeSecond=getTimeInSeconds(outtime);
		int intimeSecond=getTimeInSeconds(intime);
		int totaltime=intimeSecond-outtimeSecond;
		int m=totaltime/60;
		int s=totaltime%60;
		String time= s+" sec";
		if(m>=1)
		{
			time=m+" min "+s+" sec";
			if(m>=60)
			{
				int h=m/60;
				 m=m%60;
				time=h+" hr"+m+" min"+s+" sec";
			}
		}
		return time;
		
	}
	public  static int getTimeInSeconds(String time)
	{
		String [] x=time.split(":");
		int total=Integer.parseInt(x[0])*60*60 + Integer.parseInt(x[1])*60 + Integer.parseInt(x[2]);
		return total;
	}
	public static String getDateFormater(String date)
	{
		String [] arr=date.split("-");
		date=arr[2]+"-"+arr[1]+"-"+arr[0];
		return date;
	}

}
