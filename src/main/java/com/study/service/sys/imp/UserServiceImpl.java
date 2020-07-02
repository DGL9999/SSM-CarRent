package com.study.service.sys.imp;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.study.constant.SystemConstant;
import com.study.mapper.sys.RoleMapper;
import com.study.mapper.sys.UserMapper;
import com.study.pojo.sys.Role;
import com.study.pojo.sys.User;
import com.study.service.sys.UserService;
import com.study.utils.bus.AppFileUtils;
import com.study.utils.sys.DataGridView;
import com.study.vo.sys.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private RoleMapper roleMapper;

    //TODO 用户登录业务
    public User login(UserVo userVo) {
        //将表单中明文密码进行MD5加密
        String pwd = DigestUtils.md5DigestAsHex(userVo.getPwd().getBytes());
        userVo.setPwd(pwd);
        return userMapper.login(userVo);
    }


    //TODO 用户管理页面 查询所有用户
    @Override
    public DataGridView queryAllUser(UserVo userVo) {
        Page<Object> page = PageHelper.startPage(userVo.getPage(), userVo.getLimit());
        List<User> data = this.userMapper.queryAllUser(userVo);
        return new DataGridView(page.getTotal(), data);
    }

    //TODO 用户管理页面 添加用户
    @Override
    public void addUser(UserVo userVo) {
        //新添加的用户密码为默认密码123456
        //将默认密码加密
        userVo.setPwd(DigestUtils.md5DigestAsHex(SystemConstant.USER_DEFAULT_PWD.getBytes()));
        //设置用户类型都是普通用户 type=2
        userVo.setType(SystemConstant.USER_TYPE_NORMAL);
        this.userMapper.insertSelective(userVo);
    }

    //TODO 用户管理页面 修改用户
    @Override
    public void updateUser(UserVo userVo) {
        this.userMapper.updateByPrimaryKeySelective(userVo);
    }


    //TODO 用户管理页面 删除用户
    @Override
    public void deleteUser(Integer userId) {
        //同时将用户图片删除
        User user = this.userMapper.selectByPrimaryKey(userId);
        if (!user.getUserimg().equals(SystemConstant.DEFAULT_USER_IMG)){
            //如果图片不是默认图片再删除
            AppFileUtils.deleteFileUsePath(user.getUserimg());
        }
        //根据id删除用户
        this.userMapper.deleteByPrimaryKey(userId);
        //根据用户id删除sys_role_user中的数据
        this.userMapper.deleteRoleUserByUid(userId);

    }

    //TODO 批量删除
    @Override
    public void deleteBatchUser(Integer[] ids) {
        for (Integer uid : ids) {
            deleteUser(uid);
        }
    }

    //TODO 重置用户密码，变成默认密码
    @Override
    public void reSetUserPwd(Integer userId) {
        User user = new User();
        //设置默认密码
        user.setPwd(DigestUtils.md5DigestAsHex(SystemConstant.USER_DEFAULT_PWD.getBytes()));
        user.setUserid(userId);
        //更新
        this.userMapper.updateByPrimaryKeySelective(user);
    }

    //TODO 加载用户管理的分配角色的数据
    @Override
    public DataGridView queryUserRole(Integer userId) {
        //查询所有可用角色
        Role role = new Role();
        role.setAvailable(SystemConstant.AVAILABLE_TRUE);
        List<Role> allRole = this.roleMapper.queryAllRole(role);
        //根据用户id查询已拥有的角色
        List<Role> userRole = this.roleMapper.queryRoleByUid(SystemConstant.AVAILABLE_TRUE, userId);

        List<Map<String, Object>> data = new ArrayList<Map<String, Object>>();
        for (Role r1 : allRole) {
            Boolean LAY_CHECKED = false;
            for (Role r2 : userRole) {
                if (r1.getRoleid() == r2.getRoleid()) {
                    LAY_CHECKED = true;
                }
            }
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("roleid", r1.getRoleid());
            map.put("rolename", r1.getRolename());
            map.put("roledesc", r1.getRoledesc());
            map.put("LAY_CHECKED", LAY_CHECKED);
            data.add(map);
        }
        return new DataGridView(data);
    }

    //TODO 保存用户与角色关系
    @Override
    public void saveRoleUser(UserVo userVo) {
        Integer uid = userVo.getUserid();
        Integer[] rIds = userVo.getIds();
        //相当于清空
        if (userVo.getIds()==null) {
            this.userMapper.deleteRoleUserByUid(uid);
        } else {
            this.userMapper.deleteRoleUserByUid(uid);
            for (Integer rid : rIds) {
                this.userMapper.insertRoleUser(uid, rid);
            }
        }
    }

    @Override
    public User queryUserById(Integer userId) {
        return this.userMapper.selectByPrimaryKey(userId);
    }

       @Override
    public DataGridView queryUserDataById(Integer userId) {
        User user = this.userMapper.selectByPrimaryKey(userId);
        return new DataGridView(user);
    }
}
