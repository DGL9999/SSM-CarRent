package com.study.controller.sys;


import com.study.service.sys.LoginInfoService;
import com.study.utils.sys.DataGridView;
import com.study.utils.sys.ResultObj;
import com.study.vo.sys.LoginInfoVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


/**
 * 日志管理控制器
 *
 * @author Deja wu
 */

@RestController
@RequestMapping("loginInfo")
public class LoginInfoController {

    @Autowired
    private LoginInfoService loginInfoService;
    
    //TODO 加载日志列表
    @RequestMapping("loadAllLoginInfo")
    public DataGridView loadLoginInfoMangerList(LoginInfoVo loginInfoVo) {
        return this.loginInfoService.queryAllLoginInfo(loginInfoVo);
    }

    
    //TODO 删除日志
    @RequestMapping("deleteLoginInfo")
    public ResultObj deleteLoginInfo(LoginInfoVo loginInfoVo) {
        try {
            this.loginInfoService.deleteLoginInfo(loginInfoVo.getId());
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_SUCCESS;
        }
    }

    //TODO 批量删除日志
    @RequestMapping("deleteBatchLoginInfo")
    public ResultObj deleteBatchLoginInfo(LoginInfoVo loginInfoVo) {
        try {
            this.loginInfoService.deleteBatchLoginInfo(loginInfoVo.getIds());
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_SUCCESS;
        }
    }
}
