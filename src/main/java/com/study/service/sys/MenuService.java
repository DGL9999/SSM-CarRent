package com.study.service.sys;

import com.study.pojo.sys.Menu;
import com.study.utils.sys.DataGridView;
import com.study.vo.sys.MenuVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 菜单管理的业务
 * @author Deja wu
 */
public interface MenuService {

    //=========================  首页左导航栏菜单业务  =============================
    /**
     *  首页左导航栏-- 查询所有菜单
     * @param menuVo
     * @return List<Menu> 这里不进行数据格式处理
     */
    List<Menu> queryAllMenuForList(MenuVo menuVo);

    /**
     * 首页左导航栏-- 根据用户ID查询相应的菜单
     * @param menuVo
     * @return List<Menu>
     */
    List<Menu> queryMenuByUserIdForList(MenuVo menuVo,Integer userId);


    //=========================  菜单管理页面菜单业务  =============================

    /**
     * 菜单管理页面--查询所有菜单
     * @param menuVo 这个视图对象中带有分页的参数
     * @return 返回一个简单json格式，给菜单管理
     */
    DataGridView queryAllMenu(MenuVo menuVo);

    /**
     * 菜单管理页面--添加菜单
     * @param menuVo
     */
    void addMenu(MenuVo menuVo);

    /**
     * 菜单管理页面--修改菜单
     * @param menuVo
     */
    void updateMenu(MenuVo menuVo);


    /**
     * 菜单管理页面-- 删除菜单
     * @param menuVo
     */
    void deleteMenu(MenuVo menuVo);

    /**
     * 通过Pid查询所有节点
     * @param pid
     * @return
     */
    Integer queryMenuByPid(Integer pid);
}
