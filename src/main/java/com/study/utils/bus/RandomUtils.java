package com.study.utils.bus;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

/**
 * 随机工具类
 * @author Déjà vu
 */
public class RandomUtils {

    private static SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
    private static SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddHHmmssSSS");
    private static SimpleDateFormat sdf3 = new SimpleDateFormat("yyyyMMdd_HHmmss_SSS");
    private static Random random =new Random();

    /**
     * 得到当前日期
     * @return 返回一个 yyyy-MM-dd格式的日期字符串
     */
    public static String getCurrentDateForString(){
        return  sdf1.format(new Date());
    }



    /**
     *  生成文件名使用时间+4位随机数
     * @param fileName
     * @return
     */
    public static String createFileNameUseTime(String fileName){
        String fileSuffix = fileName.substring(fileName.lastIndexOf("."), fileName.length());
        String time = sdf2.format(new Date());
        Integer num = random.nextInt(8999) + 1000;
        return time + num + fileSuffix;
    }

    /**
     *  生成文件名使用时间+4位随机数
     * @param fileName 文件名
     * @param suffix 临时文件后缀
     * @return
     */
    public static String createFileNameUseTime(String fileName,String suffix){
        String fileSuffix = fileName.substring(fileName.lastIndexOf("."), fileName.length());
        String time = sdf2.format(new Date());
        Integer num = random.nextInt(8999) + 1000;
        return time + num + fileSuffix + suffix;
    }


    /**
     * 使用UUID生成文件名
     * @param fileName
     * @return
     */
    public static String createFileNameUseUUID(String fileName){
        String fileSuffix = fileName.substring(fileName.lastIndexOf("."), fileName.length());
        return UUID.randomUUID().toString().replace("-","").toUpperCase()+fileSuffix;
    }

    /**
     * 根据时间+五位随机数生成一个字符串
     * @param prefix
     * @return
     */
    public static String createRandomStringUseTime(String prefix) {
        return prefix+"_"+sdf3.format(new Date())+"_"+(10000+random.nextInt(90000));
    }
}
