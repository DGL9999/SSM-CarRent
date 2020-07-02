package com.study.controller.sys;


import com.study.constant.SystemConstant;
import com.study.pojo.sys.User;
import com.study.service.sys.UserService;
import com.study.utils.bus.AppFileUtils;
import com.study.utils.sys.DataGridView;
import com.study.utils.sys.ResultObj;

import com.study.utils.sys.WebUtils;
import com.study.vo.sys.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


/**
 * 用户管理控制器
 *
 * @author Deja wu
 */

@RestController
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserService userService;
    
    //TODO 加载用户列表
    @RequestMapping("loadAllUser")
    public DataGridView loadUserMangerList(UserVo userVo) {
        return this.userService.queryAllUser(userVo);
    }

    //TODO 添加用户
    @RequestMapping("addUser")
    public ResultObj addUser(UserVo userVo) {
        try {
            userVo.setUserimg(SystemConstant.DEFAULT_USER_IMG);
            this.userService.addUser(userVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    //TODO 修改用户
    @RequestMapping("updateUser")
    public ResultObj updateUser(UserVo userVo) {
        try {
            String userImg = userVo.getUserimg();
            //如果不是默认图片就去掉图片的_temp的后缀
            if (!userImg.equals(SystemConstant.DEFAULT_USER_IMG)) {
                String filePath = AppFileUtils.updateFileName(userImg, SystemConstant.FILE_UPLOAD_TEMP);
                userVo.setUserimg(filePath);
                //把原图删掉
                User user = this.userService.queryUserById(userVo.getUserid());
                if (user.getUserimg() != null) {
                    AppFileUtils.deleteFileUsePath(user.getUserimg());
                }
            }
            this.userService.updateUser(userVo);
            return ResultObj.UPDATE_SUCCESS;
            } catch(Exception e){
                e.printStackTrace();
                return ResultObj.UpDATE_ERROR;
            }
          }


    //TODO 删除用户
    @RequestMapping("deleteUser")
    public ResultObj deleteUser(UserVo userVo) {
        try {
            this.userService.deleteUser(userVo.getUserid());
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_SUCCESS;
        }
    }

    //TODO 批量删除用户
    @RequestMapping("deleteBatchUser")
    public ResultObj deleteBatchUser(UserVo userVo) {
        try {
            this.userService.deleteBatchUser(userVo.getIds());
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_SUCCESS;
        }
    }

    //TODO 重置密码
    @RequestMapping("reSetUserPwd")
    public ResultObj reSetUserPwd(UserVo userVo) {
        try {
            this.userService.reSetUserPwd(userVo.getUserid());
            return ResultObj.RESET_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.RESET_SUCCESS;
        }
    }

    //TODO 加载用户管理的分配角色的数据
    @RequestMapping("initUserRole")
    public DataGridView initUserRole(UserVo userVo){
        return this.userService.queryUserRole(userVo.getUserid());
    }

    //TODO 保存用户与角色关系
    @RequestMapping("saveRoleUser")
    public ResultObj saveRoleUser(UserVo userVo){
        try {
            this.userService.saveRoleUser(userVo);
            return ResultObj.DISPATCH_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DISPATCH_ERROR;
        }
    }

    //TODO 初始化用户信息
    @RequestMapping("initUserInfo")
    public DataGridView initUserInfo(Integer userid){
        return this.userService.queryUserDataById(userid);
    }

    //TODO 修改密码
    @RequestMapping("changePwd")
    public void changePwd(String newPwd, HttpServletResponse resp){
            HttpSession session = WebUtils.getHttpSession();
            User user = (User) session.getAttribute("user");
            UserVo userVo = new UserVo();
            userVo.setUserid(user.getUserid());
            userVo.setPwd(DigestUtils.md5DigestAsHex(newPwd.getBytes()));
            this.userService.updateUser(userVo);

    }
}
