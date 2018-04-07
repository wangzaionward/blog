package com.wangzai.blog.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 日期工具类
 */
public class DateUtil {

    public static final String DATE_FORMAT = "yyyy-MM-dd";

    public static final String DATE_TIME_FORMAT = "yyyy-MM-dd HH:mm:ss";

    //yyyy-MM-dd
    public static final SimpleDateFormat dateFormat = new SimpleDateFormat(DATE_FORMAT);

    //yyyy-MM-dd HH:mm:ss
    public static final SimpleDateFormat dateTimeFormat = new SimpleDateFormat(DATE_TIME_FORMAT);

    //日期转字符串 2018-08-08
    public static String date2DateStr(Date date){
        return dateFormat.format(date);
    }

    //日期转字符串 2018-08-08 08:08:08
    public static String date2DateTimeStr(Date date){
        return dateTimeFormat.format(date);
    }

    //字符串转日期 2018-08-08
    public static Date str2Date(String str){
        try {
            return dateFormat.parse(str);
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }

    //字符串转日期 2018-08-08 08:08:08
    public static Date str2DateTime(String str){
        try {
            return dateTimeFormat.parse(str);
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }

    //获取当前日期 2018-08-08
    public static String getCurrentDateStr() {
        return dateFormat.format(new Date());
    }

    //获取当前日期 2018-08-08 08:08:08
    public static String getCurrentDateTimeStr() {
        return dateTimeFormat.format(new Date());
    }

    //DateTime -> Date 2018-08-08 08:08:08 -> 2018-08-08
    public static Date dateTime2date(Date dateTime) {
        String date = date2DateStr(dateTime);
        try {
            return dateFormat.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }

}
