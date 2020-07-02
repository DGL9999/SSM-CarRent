package com.study.utils.sys;

import com.study.constant.SystemConstant;

import lombok.Data;

/**
 * 用来传输操作状态的工具类
 * @author Deja wu
 */
@Data
public class ResultObj {

    private Integer code=0;
    private String msg;

    private ResultObj(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public static final ResultObj ADD_SUCCESS = new ResultObj(SystemConstant.CODE_SUCCESS,SystemConstant.ADD_SUCCESS);
    public static final ResultObj ADD_ERROR = new ResultObj(SystemConstant.CODE_ERROR,SystemConstant.ADD_ERROR);

    public static final ResultObj UPDATE_SUCCESS = new ResultObj(SystemConstant.CODE_SUCCESS,SystemConstant.UPDATE_SUCCESS);
    public static final ResultObj UpDATE_ERROR = new ResultObj(SystemConstant.CODE_ERROR,SystemConstant.UpDATE_ERROR);

    public static final ResultObj DELETE_SUCCESS = new ResultObj(SystemConstant.CODE_SUCCESS,SystemConstant.DELETE_SUCCESS);
    public static final ResultObj DELETE_ERROR = new ResultObj(SystemConstant.CODE_ERROR,SystemConstant.DELETE_ERROR);

    public static final ResultObj RESET_SUCCESS = new ResultObj(SystemConstant.CODE_SUCCESS,SystemConstant.RESET_SUCCESS);
    public static final ResultObj RESET_ERROR = new ResultObj(SystemConstant.CODE_ERROR,SystemConstant.RESET_ERROR);

    public static final ResultObj DISPATCH_SUCCESS = new ResultObj(SystemConstant.CODE_SUCCESS,SystemConstant.DISPATCH_SUCCESS);
    public static final ResultObj DISPATCH_ERROR = new ResultObj(SystemConstant.CODE_ERROR,SystemConstant.DISPATCH_ERROR);



    //用来传输查询是否有子节点状态码
    private ResultObj(Integer code) {
        this.code = code;
    }
    public static final ResultObj STATUS_TRUE = new ResultObj(SystemConstant.CODE_SUCCESS);
    public static final ResultObj STATUS_FALSE = new ResultObj(SystemConstant.CODE_ERROR);
}
