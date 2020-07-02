package com.study.service.sys.imp;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.study.constant.SystemConstant;
import com.study.mapper.sys.MenuMapper;
import com.study.mapper.sys.RoleMapper;
import com.study.pojo.sys.Menu;
import com.study.pojo.sys.Role;
import com.study.service.sys.RoleService;
import com.study.utils.sys.DataGridView;
import com.study.utils.sys.TreeNode;
import com.study.vo.sys.RoleVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private MenuMapper menuMapper;
  
    //TODO 查询所有角色
    @Override
    public List<Role> queryAllRoleForList(RoleVo roleVo) {
        return this.roleMapper.queryAllRole(roleVo);
    }

    //TODO 根据权限查询相应角色
    @Override
    public List<Role> queryRoleByUserIdForList(RoleVo roleVo, Integer userId) {
         return this.roleMapper.queryAllRole(roleVo);
    }



    //TODO 角色管理页面 查询所有角色
    @Override
    public DataGridView queryAllRole(RoleVo roleVo) {
        Page<Object> page = PageHelper.startPage(roleVo.getPage(), roleVo.getLimit());
        List<Role> data = this.roleMapper.queryAllRole(roleVo);
        return new DataGridView(page.getTotal(),data);
    }

    //TODO 角色管理页面 添加角色
    @Override
    public void addRole(RoleVo roleVo) {
        this.roleMapper.insertSelective(roleVo);
    }

    //TODO 角色管理页面 修改角色
    @Override
    public void updateRole(RoleVo roleVo) {
        this.roleMapper.updateByPrimaryKeySelective(roleVo);
    }


    //TODO 角色管理页面 删除角色
    @Override
    public void deleteRole(Integer roleId) {
        //根据id删除角色
        this.roleMapper.deleteByPrimaryKey(roleId);
        //根据角色id删除sys_role_menu中的数据
        this.roleMapper.deleteRoleMenuByRid(roleId);
        //根据角色id删除sys_role_user中的数据
        this.roleMapper.deleteRoleUserByRid(roleId);

    }

    //TODO 批量删除
    @Override
    public void deleteBatchRole(Integer[] ids) {
        for (Integer rid : ids) {
            deleteRole(rid);
        }
    }

    //TODO 加载角色管理分配菜单的json
    @Override
    public DataGridView initRoleMenuTreeJson(Integer roleid) {
        //查询所有的可用菜单
        Menu menu = new Menu();
        menu.setAvailable(SystemConstant.AVAILABLE_TRUE);
        List<Menu> allMenu = menuMapper.queryAllMenu(menu);
        //根据角色ID查询当前角色拥有的菜单
        List<Menu> roleMenu = menuMapper.queryMenuByRid(SystemConstant.AVAILABLE_TRUE,roleid);

        List<TreeNode> data = new ArrayList<TreeNode>();
        for (Menu m1 : allMenu) {
            String checkArr = SystemConstant.MENU_UNCHECKED+"";
            for (Menu m2 : roleMenu) {
                if (m1.getId()==m2.getId()){
                    checkArr = SystemConstant.MENU_CHECKED+"";
                    break;
                }
            }
            data.add(new TreeNode(
                m1.getId(),
                m1.getPid(),
                m1.getTitle(),
                m1.getSpread()==SystemConstant.SPREAD_TRUE?true:false,
                checkArr
            ));
        }
        return new DataGridView(data);
    }

    //TODO 保存角色与菜单的关系
    @Override
    public void saveRoleMenu(RoleVo roleVo) {
        Integer rid = roleVo.getRoleid();
        Integer[] mIds =roleVo.getIds();
        if (mIds==null){
                //如果前端页面空选，直接清楚此rid在sys_role_menu中的所有数据
            this.roleMapper.deleteRoleMenuByRid(rid);
        }else {
            //sys_role_menu表中是联合主键，不能重复
            //先清空此rid在sys_role_menu中的所有数据
            this.roleMapper.deleteRoleMenuByRid(rid);
            //保存角色和菜单的关系
            for (Integer mid : mIds) {
                this.roleMapper.insertRoleMenu(rid,mid);
            }
        }
    }
}

