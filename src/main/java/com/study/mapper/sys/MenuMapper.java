package com.study.mapper.sys;

import com.study.pojo.sys.Menu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MenuMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Menu record);

    int insertSelective(Menu record);

    Menu selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Menu record);

    int updateByPrimaryKey(Menu record);

    //TODO 查询所有菜单
    List<Menu> queryAllMenu(Menu menu);

    //TODO 根据pid查询节点数
    Integer queryMenuByPid(@Param("pid")Integer pid);

    //TODO 根据Mid删除sys_role_menu中的数据
    void deleteRoleMenuByMid(@Param("mid")Integer id);


    //----------------------  角色管理页面   ------------------------------
    //TODO 根据Rid查询查询菜单
    List<Menu> queryMenuByRid(@Param("available")Integer available,@Param("rid")Integer roleid);

    //----------------------用于权限管理
    //TODO 根据用户ID查询菜单
    List<Menu> queryMenuByUid(@Param("available")Integer available,@Param("uid")Integer userId);
}