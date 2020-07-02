package com.study.controller.bus;

import com.study.constant.SystemConstant;
import com.study.utils.bus.AppFileUtils;
import com.study.utils.bus.DataGridView;
import com.study.utils.bus.RandomUtils;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * 文件上传下载控制器
 *
 * @author Deja wu
 */
@Controller
@RequestMapping("file")
public class FileController {


    /**
     * 上传汽车图片
     * @param mf
     * @return
     * @throws IOException
     */
    @RequestMapping("carUploadFile")
    @ResponseBody
    public DataGridView carUploadFile(MultipartFile mf) throws IOException {
        //文件上传的父目录
        String parentPath = AppFileUtils.PATH;
        //得到当前日期作为文件夹名称
        String dirName = RandomUtils.getCurrentDateForString();
        //构造文件对象
        File dirFile = new File(parentPath, dirName);
        if (!dirFile.exists()){
            dirFile.mkdirs(); //创建文件夹
        }

        //得到文件原名
        String oldName = mf.getOriginalFilename();
        //根据文件原名得到新名
        String newName = RandomUtils.createFileNameUseTime(oldName, SystemConstant.FILE_UPLOAD_TEMP);
        File dest = new File(dirFile, newName);
        mf.transferTo(dest);
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("src",dirName+"/"+newName);

        return new DataGridView(map);
    }

     /**
     * 上传用户图片
     * @param mf
     * @return
     * @throws IOException
     */
    @RequestMapping("userUploadFile")
    @ResponseBody
    public DataGridView userUploadFile(MultipartFile mf) throws IOException {
        //文件上传的父目录
        String parentPath = AppFileUtils.PATH;
        //得到当前日期作为文件夹名称
        String dirName = RandomUtils.getCurrentDateForString() +"用户头像";
        //构造文件对象
        File dirFile = new File(parentPath, dirName);
        if (!dirFile.exists()){
            dirFile.mkdirs(); //创建文件夹
        }

        //得到文件原名
        String oldName = mf.getOriginalFilename();
        //根据文件原名得到新名
        String newName = RandomUtils.createFileNameUseTime(oldName, SystemConstant.FILE_UPLOAD_TEMP);
        File dest = new File(dirFile, newName);
        mf.transferTo(dest);
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("src",dirName+"/"+newName);

        return new DataGridView(map);
    }

    /**
	 * 不下载只显示
	 */
	@RequestMapping("downloadShowFile")
	public ResponseEntity<Object> downloadShowFile(String path, HttpServletResponse response) {
		return AppFileUtils.downloadFile(response, path);
	}

	/**
	 * 下载图片
	 * @param path
	 * @param response
	 * @return
	 */
	@RequestMapping("downloadFile")
	public ResponseEntity<Object> downloadFile(String path, HttpServletResponse response) {
		String oldName="";
		return AppFileUtils.downloadFile(response, path, oldName);
	}
}
