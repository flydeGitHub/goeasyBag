package cn.xcdm.adminBag.util;

 
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtil {

	
	//时间转化成时间戳 
	public static String changeToUnix(String time) throws ParseException{
	/*	Date d=new Date(data); 
		long ts =  d.getTime();
	    String res = String.valueOf(ts);
	    return res;*/
		Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(time);  
		long unixTimestamp = date.getTime()/1000;  
		 String res = String.valueOf(unixTimestamp);
		    return res;
	} 
	
}
