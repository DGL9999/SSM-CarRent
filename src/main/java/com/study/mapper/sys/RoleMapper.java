package com.study.mapper.sys;

import com.study.pojo.sys.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleMapper {
    int deleteByPrimaryKey(Integer roleid);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer roleid);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);

    //TODO 查询所有角色
    List<Role> queryAllRole(Role role);

    //TODO 根据角色id删除sys_role_menu中的数据
    void deleteRoleMenuByRid(@Param("rid")Integer roleId);

    //TODO 根据角色id删除sys_role_user中的数据
    void deleteRoleUserByRid(@Param("rid")Integer roleId);

    //TODO 保存角色与菜单的关系 sys_role_menu
    void insertRoleMenu(@Param("rid")Integer rid,@Param("mid")Integer mid);

    //TODO 通过用户id查询已拥有的角色
    List<Role> queryRoleByUid(@Param("available")Integer available, @Param("uid") Integer userId);
}