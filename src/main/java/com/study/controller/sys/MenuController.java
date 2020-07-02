package com.study.controller.sys;

import com.study.constant.SystemConstant;
import com.study.pojo.sys.Menu;
import com.study.pojo.sys.User;
import com.study.service.sys.MenuService;
import com.study.utils.sys.*;
import com.study.vo.sys.MenuVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;


/**
 * 菜单管理控制器
 *
 * @author Deja wu
 */

@RestController
@RequestMapping("menu")
public class MenuController {

    @Autowired
    private MenuService menuService;

    //TODO 加载页面左边菜单栏
    @RequestMapping("loadIndexLeftMenuJson")
    public List<TreeNode> loadIndexLeftMenuJson(MenuVo menuVo) {
        //得到当前用户对象
        User user = (User) WebUtils.getHttpSession().getAttribute("user");
        //list存放从数据库中查询的menu
        List<Menu> list = null;
        menuVo.setAvailable(SystemConstant.AVAILABLE_TRUE); //只查询可用的
        //判断用户对象类型
        if (user.getType() == SystemConstant.USER_TYPE_SUPER) {
            list = this.menuService.queryAllMenuForList(menuVo);
        } else {
            list = this.menuService.queryMenuByUserIdForList(menuVo, user.getUserid());
        }

        //创建一个List容器来辅助 数据转换
        List<TreeNode> nodes = new ArrayList();
        //通过for循环将 menu对象放入nodes中
        for (Menu menu : list) {
            nodes.add(new TreeNode(
                    menu.getId(),
                    menu.getPid(),
                    menu.getTitle(),
                    menu.getIcon(),
                    menu.getHref(),
                    menu.getSpread() == SystemConstant.SPREAD_TRUE ? true : false,
                    menu.getTarget()));
        }
        //将简单集合转换为有层级的集合（封装成了工具类）
        return TreeNodeBuilder.builder(nodes, 1);
    }

    //TODO 加载菜单管理页面，左边的菜单树
    @RequestMapping("loadMenuMangerLeftTreeJson")
    public DataGridView loadMenuMangerLeftTreeJson(MenuVo menuVo) {
        menuVo.setAvailable(SystemConstant.AVAILABLE_TRUE);
        List<Menu> list = this.menuService.queryAllMenuForList(menuVo);

        //创建一个List容器来辅助 数据转换
        List<TreeNode> nodes = new ArrayList();
        //通过for循环将 menu对象放入nodes中
        for (Menu menu : list) {
            nodes.add(new TreeNode(
                    menu.getId(),
                    menu.getPid(),
                    menu.getTitle(),
                    menu.getIcon(),
                    menu.getHref(),
                    menu.getSpread() == SystemConstant.SPREAD_TRUE ? true : false,
                    menu.getTarget()));
        }
        return new DataGridView(nodes);
    }

    //TODO 加载菜单管理的菜单列表
    @RequestMapping("loadMenuMangerList")
    public DataGridView loadMenuMangerList(MenuVo menuVo) {
        return this.menuService.queryAllMenu(menuVo);
    }

    //TODO 添加菜单
    @RequestMapping("addMenu")
    public ResultObj addMenu(MenuVo menuVo) {

        try {
            this.menuService.addMenu(menuVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    //TODO 修改菜单
    @RequestMapping("updateMenu")
    public ResultObj updateMenu(MenuVo menuVo) {
        try {
            this.menuService.updateMenu(menuVo);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UpDATE_ERROR;
        }
    }

    //TODO 查询当前节点是否有子节点
    @RequestMapping("checkMenuChildren")
    public ResultObj checkMenuChildren(MenuVo menuVo) {
        Integer count = this.menuService.queryMenuByPid(menuVo.getId());
        if (count > 0){
            return ResultObj.STATUS_TRUE;
        }else {
            return ResultObj.STATUS_FALSE;
        }
    }

        //TODO 删除菜单
    @RequestMapping("deleteMenu")
    public ResultObj deleteMenu(MenuVo menuVo) {
        try {
            this.menuService.deleteMenu(menuVo);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_SUCCESS;
        }
    }
}
