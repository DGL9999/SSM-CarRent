package com.study.controller.sys;

import com.study.service.sys.RoleService;
import com.study.utils.sys.*;
import com.study.vo.sys.RoleVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;




/**
 * 角色管理控制器
 *
 * @author Deja wu
 */

@RestController
@RequestMapping("role")
public class RoleController {

    @Autowired
    private RoleService roleService;
    
    //TODO 加载角色列表
    @RequestMapping("loadAllRole")
    public DataGridView loadRoleMangerList(RoleVo roleVo) {
        return this.roleService.queryAllRole(roleVo);
    }

    //TODO 添加角色
    @RequestMapping("addRole")
    public ResultObj addRole(RoleVo roleVo) {

        try {
            this.roleService.addRole(roleVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    //TODO 修改角色
    @RequestMapping("updateRole")
    public ResultObj updateRole(RoleVo roleVo) {
        try {
            this.roleService.updateRole(roleVo);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UpDATE_ERROR;
        }
    }


    //TODO 删除角色
    @RequestMapping("deleteRole")
    public ResultObj deleteRole(RoleVo roleVo) {
        try {
            this.roleService.deleteRole(roleVo.getRoleid());
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_SUCCESS;
        }
    }

    //TODO 批量删除角色
    @RequestMapping("deleteBatchRole")
    public ResultObj deleteBatchRole(RoleVo roleVo) {
        try {
            this.roleService.deleteBatchRole(roleVo.getIds());
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_SUCCESS;
        }
    }


    //TODO 加载角色管理分配菜单的json
    @RequestMapping("initRoleMenuTreeJson")
    public DataGridView initRoleMenuTreeJson(Integer roleid){
        return this.roleService.initRoleMenuTreeJson(roleid);
    }

    //TODO 保存角色与菜单的关系
    @RequestMapping("saveRoleMenu")
    public ResultObj saveRoleMenu(RoleVo roleVo){
        try {
            this.roleService.saveRoleMenu(roleVo);
            return ResultObj.DISPATCH_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DISPATCH_ERROR;
        }
    }
}
