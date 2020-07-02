package com.study.vo.bus;

import com.study.pojo.bus.Car;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
public class CarVo  extends Car {
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
    private String[] carnumbers;
}
