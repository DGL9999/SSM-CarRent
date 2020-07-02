package com.study.constant;

import javax.print.DocFlavor;

/**
 * 系统常量
 * @author Deja wu
 */
public class SystemConstant {

    //TODO 用户登录 —— 常量
    public static final String USER_LOGIN_ERROR_MSG = "用户名或密码错误";
    public static final Object USER_LOGIN_CODE_ERROR_MSG = "验证码错误";

    // TODO 左边栏菜单是否可用 —— 常量
    public static final Integer AVAILABLE_TRUE = 1;
    public static final Integer AVAILABLE_FALSE = 0;

    // TODO 用户类型
    public static final Integer USER_TYPE_SUPER = 1;
    public static final Integer USER_TYPE_NORMAL= 2;

    //TODO 左边栏菜单是否展开
    public static final Integer SPREAD_TRUE = 1;
    public static final Integer SPREAD_FALSE = 0;

    //TODO 操作状态
    public static final String ADD_SUCCESS = "添加成功";
    public static final String ADD_ERROR = "添加失败";

    public static final String UPDATE_SUCCESS = "修改成功";
    public static final String UpDATE_ERROR = "修改失败";

    public static final String DELETE_SUCCESS = "删除成功";
    public static final String DELETE_ERROR = "删除失败";

    public static final String RESET_SUCCESS = "重置成功";
    public static final String RESET_ERROR = "重置失败";

    public static final String DISPATCH_SUCCESS = "分配成功";
    public static final String DISPATCH_ERROR = "分配失败";

    public static final Integer CODE_SUCCESS = 0;  //操作成功返回码
    public static final Integer CODE_ERROR = -1;   //操作失败返回码


    //TODO 菜单是否被选中
    public static final Integer MENU_CHECKED = 1;
    public static final Integer MENU_UNCHECKED = 0;

    //TODO 默认密码
    public static final String USER_DEFAULT_PWD = "123456";


    //TODO 临时文件标记
    public static final String FILE_UPLOAD_TEMP = "_temp";

    //TODO 默认图片
    public static final String DEFAULT_CAR_IMG = "images/defaultCarImage.jpg";
    public static final String DEFAULT_USER_IMG = "images/defaultUserImage.PNG";

    //TODO 单号的前缀
    public static final String CAR_ORDER_CZ = "CZ";
    public static final String CAR_ORDER_JC = "JC";

    //TODO 车辆是否归还
    public static final Integer RENT_BACK_FALSE = 0;
    public static final Integer RENT_BACK_TRUE = 1;

    //TODO 车辆是否出租
    public static final Integer IS_RENTING_TRUE = 1;
    public static final Integer IS_RENTING_FALSE = 0;

}
