package com.study.service.sys;

import com.study.pojo.sys.Role;
import com.study.utils.sys.DataGridView;
import com.study.vo.sys.RoleVo;

import java.util.List;

/**
 * 角色管理的业务
 * @author Deja wu
 */
public interface RoleService {


    /**
     *  查询所有角色
     * @param roleVo
     * @return List<Role> 这里不进行数据格式处理
     */
    List<Role> queryAllRoleForList(RoleVo roleVo);

    /**
     *  根据用户ID查询相应的角色
     * @param roleVo
     * @return List<Role>
     */
    List<Role> queryRoleByUserIdForList(RoleVo roleVo, Integer userId);



    /**
     * 角色管理页面--查询所有角色
     * @param roleVo 这个视图对象中带有分页的参数
     * @return 返回一个简单json格式，给角色管理
     */
    DataGridView queryAllRole(RoleVo roleVo);

    /**
     * 角色管理页面--添加角色
     * @param roleVo
     */
    void addRole(RoleVo roleVo);

    /**
     * 角色管理页面--修改角色
     * @param roleVo
     */
    void updateRole(RoleVo roleVo);


    /**
     * 角色管理页面-- 根据ID删除角色
     * @param roleId
     */
    void deleteRole(Integer roleId);

    /**
     * 批量删除角色
     * @param ids
     */
    void deleteBatchRole(Integer[] ids);

    /**
     * 加载角色管理分配菜单的json
     * @param roleid
     * @return
     */
    DataGridView initRoleMenuTreeJson(Integer roleid);

    /**
     * 保存角色与菜单的关系
     * @param roleVo
     */
    void saveRoleMenu(RoleVo roleVo);
}
