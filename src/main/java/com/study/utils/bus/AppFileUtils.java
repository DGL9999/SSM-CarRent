package com.study.utils.bus;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Properties;

/**
 * 文件上传/下载工具类
 *
 * @author Déjà vu
 */
public class AppFileUtils {

    /**
     * 得到配置文件中,配置好的文件上传的文件夹路径
     */
    public static String PATH;

    static {
        InputStream stream = AppFileUtils.class.getClassLoader().getResourceAsStream("properties/file.properties");
        Properties properties = new Properties();
        try {
            properties.load(stream);
            PATH = properties.getProperty("path");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    /**
     * 文件下载
     *
     * @param resp
     * @param path
     * @param oldName
     * @return
     */
    public static ResponseEntity<Object> downloadFile(HttpServletResponse resp, String path, String oldName) {

        //通过文件夹路径+文件全称=组合成绝对路径,去寻找文件对象
        File file = new File(AppFileUtils.PATH, path);
        //判断文件是否存在
        if (file.exists()) {

            try {
                //首先处理文件名乱码问题
                oldName = URLEncoder.encode(oldName, "UTF-8");

                //把文件转成一个byte数组
                byte[] bytes = FileUtils.readFileToByteArray(file);
                //封装响应的内容类型(APPLICATION_OCTET_STREAM 响应的内容类型不限定)
                HttpHeaders header = new HttpHeaders();
                header.setContentType(MediaType.APPLICATION_OCTET_STREAM);
                //设置下载的文件的名称
                header.setContentDispositionFormData("attachment",oldName);
                //创建ResponseEntity对象
                ResponseEntity<Object> entity = new ResponseEntity<Object>(bytes, header, HttpStatus.CREATED);
                return entity;
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else{
            PrintWriter out;
            try {
                out = resp.getWriter();
                out.write("文件不存在");
                out.flush();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    /**
     * 图片只显示不下载
     *
     * @param resp
     * @param path
     * @return
     */
    public static ResponseEntity<Object> downloadFile(HttpServletResponse resp, String path) {
        //通过文件夹路径+文件全称=组合成绝对路径,去寻找文件对象
        File file = new File(AppFileUtils.PATH, path);
        //判断文件是否存在
        if (file.exists()) {

            try {
                //把文件转成一个byte数组
                byte[] bytes = FileUtils.readFileToByteArray(file);
                //封装响应的内容类型(APPLICATION_OCTET_STREAM 响应的内容类型不限定)
                HttpHeaders header = new HttpHeaders();
                header.setContentType(MediaType.APPLICATION_OCTET_STREAM);
                //创建ResponseEntity对象
                ResponseEntity<Object> entity = new ResponseEntity<Object>(bytes, header, HttpStatus.CREATED);
                return entity;
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else{
            PrintWriter out;
            try {
                out = resp.getWriter();
                out.write("文件不存在");
                out.flush();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }



	/**
	 * 更改文件名
	 * @param carimg
	 * @param suffix
	 */
    public static String updateFileName(String carimg,String suffix) {
		//找到文件
		try{
			File file = new File(PATH,carimg);
			if (file.exists()){
				file.renameTo(new File(PATH,carimg.replace(suffix,"")));
				return carimg.replace(suffix,"");
			}
		}catch (Exception e){
			e.printStackTrace();
		}
		return null;
	}

	/**
     * 根据路径删除文件
     * @param path
     */
    public static void deleteFileUsePath(  String path){
        String realPath = PATH+path;
        //通过绝对路径获取文件
        File file = new File(realPath);
        if (file.exists()){
            file.delete();
        }
    }

    /**
     * 根据文件全程删除硬盘上的文件
     * @param path
     */
    public static void deleteFileUsePath(HttpServletResponse resp, String path){
        String realPath = PATH+path;
        //通过绝对路径获取文件
        File file = new File(realPath);
        if (file.exists()){
            file.delete();
        }else{
            PrintWriter out;
            try {
                out = resp.getWriter();
                out.write("文件不存在");
                out.flush();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
