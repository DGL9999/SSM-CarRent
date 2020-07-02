package com.study.task;

import com.study.constant.SystemConstant;
import com.study.utils.bus.AppFileUtils;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.io.File;

@Component
@EnableScheduling //开启定时任务
public class RecycleTempFileTask {


    /**
     * 每天晚上12点清理临时文件
     */
    @Scheduled(cron = "0 0 0 * * ?")
    public void RecycleTempFile(){
        File file = new File(AppFileUtils.PATH);
        deleteFile(file);
    }

    /**
     * 删除图片
     * @param file
     */

    private void deleteFile(File file){
        if (file!=null){
            File[] files = file.listFiles();
            if (files!= null&&files.length>0){
                for (File f : files) {
                    if (f.isFile()){
                        if (f.getName().endsWith(SystemConstant.FILE_UPLOAD_TEMP)){
                            f.delete();
                        }
                    }else if(f.isDirectory()){
                        deleteFile(f);
                    }
                }
            }
        }
    }
}
