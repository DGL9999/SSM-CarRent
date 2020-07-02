package com.study.vo.bus;

import com.study.pojo.bus.Customer;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
public class CustomerVo extends Customer {

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

    //接收多个用户id
    private String[] identities;
}
