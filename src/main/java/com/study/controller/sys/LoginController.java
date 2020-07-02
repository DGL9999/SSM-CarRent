package com.study.controller.sys;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.LineCaptcha;
import com.study.constant.SystemConstant;
import com.study.pojo.sys.User;
import com.study.service.sys.LoginInfoService;
import com.study.service.sys.UserService;
import com.study.utils.sys.WebUtils;
import com.study.vo.sys.LoginInfoVo;
import com.study.vo.sys.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;

import static com.study.constant.SystemConstant.USER_LOGIN_ERROR_MSG;


/**
 * 用户登录控制器
 *
 * @author Deja wu
 */
@Controller
@RequestMapping("login")
public class LoginController {

    @Autowired
    private UserService userService;

    @Autowired
    private LoginInfoService loginInfoService;

    //TODO 跳转到登录页面
    @RequestMapping("toLogin")
    public String toLogin() {
        return "system/main/login";
    }

    //TODO 登录
    @RequestMapping("login")
    public String login(UserVo userVo, Model model) {
        Object code = WebUtils.getHttpSession().getAttribute("code");
        if (userVo.getCode().equals(code)){
            User user = this.userService.login(userVo);
            if (user != null){
                //放入Session
                WebUtils.getHttpSession().setAttribute("user",user);
                //记录登录日志 向sys_login_log里面插入数据
                LoginInfoVo loginInfoVo = new LoginInfoVo();
                loginInfoVo.setLoginname(user.getRealname()+"-"+user.getLoginname());
                loginInfoVo.setLoginip(WebUtils.getHttpServletRequest().getRemoteAddr());
                loginInfoVo.setLogintime(new Date());
                this.loginInfoService.addLoginInfo(loginInfoVo);
                return "system/main/index";
            }else {
                model.addAttribute("error", USER_LOGIN_ERROR_MSG);
                return "system/main/login";
            }
        }else {
             model.addAttribute("error", SystemConstant.USER_LOGIN_CODE_ERROR_MSG);
            return "system/main/login";
        }
    }

    //TODO 得到登陆验证码
    @RequestMapping("getCode")
    public void getCode(HttpServletResponse response, HttpSession session) throws IOException {
        //定义图形验证码的长和宽
        LineCaptcha lineCaptcha = CaptchaUtil.createLineCaptcha(116, 36,4,5);
        session.setAttribute("code",lineCaptcha.getCode());
        ServletOutputStream outputStream = response.getOutputStream();
        ImageIO.write(lineCaptcha.getImage(),"JPEG",outputStream);
    }

    //TODO 登出
    @RequestMapping("loginOut")
    public void loginOut(HttpServletResponse resp){
        HttpSession session = WebUtils.getHttpSession();
        session.removeAttribute("user");
        try {
            resp.sendRedirect("../index.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
