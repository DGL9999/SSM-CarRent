package com.study.vo.sys;

import com.study.pojo.sys.News;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
public class NewsVo extends News {

     /**
     * 分页参数
     */

    private Integer page;
    private Integer limit;

   /**
     * 时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;

    //接收多个日志id
    private Integer[] ids;
}
