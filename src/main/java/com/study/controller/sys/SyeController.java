package com.study.controller.sys;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * 系统的菜单页面跳转控制器
 * @author Deja wu
 */
@Controller
@RequestMapping("sys")
public class SyeController {

    //TODO 跳转到菜单管理页面
    @RequestMapping("toMenuManager")
    public String toMenuManager(){
        return "system/menu/menuManager";
    }

    //TODO 跳转到菜单管理左边的菜单树页面
    @RequestMapping("toMenuLeft")
    public String toMenuLeft(){
        return "system/menu/menuLeft";
    }

    //TODO 跳转到菜单管理右边的菜单列表
    @RequestMapping("toMenuRight")
    public String toMenuRight(){
        return "system/menu/menuRight";
    }


    //TODO 跳转到角色管理页面
    @RequestMapping("toRoleManager")
    public String toRoleManager(){
        return "system/role/roleManager";
    }

    //TODO 跳转到用户管理页面
    @RequestMapping("toUserManager")
    public String toUserManager(){
        return "system/user/userManager";
    }

    //TODO 跳转到日志管理页面
    @RequestMapping("toLoginInfoManager")
    public String toLoginInfo(){
        return "system/loginInfo/loginInfoManager";
    }

    //TODO 跳转到公告管理页面
    @RequestMapping("toNewsManager")
    public String toNewsManager(){
        return "system/news/newsManager";
    }

    //TODO 跳转到个人资料页面
    @RequestMapping("toUserInfo")
    public String toUserInfo(){
        return "system/user/userInfo";
    }

    //TODO 跳转到修改密码页面
    @RequestMapping("toChangePwd")
    public String toChangePwd(){
        return "system/user/changePwd";
    }

    //TODO 跳转到公告查看页面
    @RequestMapping("toNewsPage")
    public String toNewsPage(){
        return "system/news/newsPage";
    }
}
