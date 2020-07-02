package com.study.vo.sys;


import com.study.pojo.sys.User;
import lombok.Data;

@Data
public class UserVo extends User {

     /**
     * 分页参数
     */

    private Integer page;
    private Integer limit;

    private String code;

    //接收多个角色id
    private Integer[] ids;
}
