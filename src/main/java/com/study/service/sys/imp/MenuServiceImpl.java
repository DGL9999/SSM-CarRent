package com.study.service.sys.imp;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.study.mapper.sys.MenuMapper;
import com.study.pojo.sys.Menu;
import com.study.service.sys.MenuService;
import com.study.utils.sys.DataGridView;
import com.study.vo.sys.MenuVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MenuMapper menuMapper;


    //-----------1.之所以这样划分，因为左导航栏中的菜单，使用的json格式是数组类型且有层级划分（层级划分在controller层）
    //-----------2.而菜单管理页面的菜单，使用的json格式是对象类型，没有层级划分
    // ======================== 左导航栏中的菜单查询业务  =============================

    //TODO 首页左导航栏查询所有菜单
    @Override
    public List<Menu> queryAllMenuForList(MenuVo menuVo) {
        return this.menuMapper.queryAllMenu(menuVo);
    }

    //TODO 根据权限查询相应菜单
    @Override
    public List<Menu> queryMenuByUserIdForList(MenuVo menuVo, Integer userId) {
         return this.menuMapper.queryMenuByUid(menuVo.getAvailable(),userId);
    }

    // ======================== 菜单管理页面的菜单查询业务  =============================

    //TODO 菜单管理页面 查询所有菜单
    @Override
    public DataGridView queryAllMenu(MenuVo menuVo) {
        Page<Object> page = PageHelper.startPage(menuVo.getPage(), menuVo.getLimit());
        List<Menu> data = this.menuMapper.queryAllMenu(menuVo);
        return new DataGridView(page.getTotal(),data);
    }

    //TODO 菜单管理页面 添加菜单
    @Override
    public void addMenu(MenuVo menuVo) {
        this.menuMapper.insertSelective(menuVo);
    }

    //TODO 菜单管理页面 修改菜单
    @Override
    public void updateMenu(MenuVo menuVo) {
        this.menuMapper.updateByPrimaryKeySelective(menuVo);
    }


    //TODO 菜单管理页面 删除菜单
    @Override
    public void deleteMenu(MenuVo menuVo) {

        //删除菜单表的数据
        this.menuMapper.deleteByPrimaryKey(menuVo.getId());

        //根据菜单id删除sys_role_menu里面的数据
        this.menuMapper.deleteRoleMenuByMid(menuVo.getId());
    }

    //TODO 通过pid查询所有节点
    @Override
    public Integer queryMenuByPid(Integer pid) {
        return this.menuMapper.queryMenuByPid(pid);
    }
}

