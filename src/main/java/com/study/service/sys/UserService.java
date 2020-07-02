package com.study.service.sys;

import com.study.pojo.sys.User;
import com.study.utils.sys.DataGridView;
import com.study.vo.sys.UserVo;



public interface UserService {


    /**
     * 用户登录
     * @param userVo
     * @return
     */
    User login(UserVo userVo);



    //=========================用户管理页面============================

        /**
     * 角色管理页面--查询所有用户
     * @param userVo 这个视图对象中带有分页的参数
     * @return 返回一个简单json格式，给角色管理
     */
    DataGridView queryAllUser(UserVo userVo);

    /**
     * 用户管理页面--添加用户
     * @param userVo
     */
    void addUser(UserVo userVo);

    /**
     * 用户管理页面--修改用户
     * @param userVo
     */
    void updateUser(UserVo userVo);


    /**
     * 用户管理页面-- 根据ID删除用户
     * @param userId
     */
    void deleteUser(Integer userId);

    /**
     * 批量删除用户
     * @param ids
     */
    void deleteBatchUser(Integer[] ids);

    /**
     * 重置密码
     * @param userId
     */
    void reSetUserPwd(Integer userId);

    /**
     * 加载用户管理的分配角色的数据
     * @param userId
     * @return
     */
    DataGridView queryUserRole(Integer userId);


    /**
     * 保存用户与角色关系
     * @param userVo
     */
    void saveRoleUser(UserVo userVo);

    /**
     * 通过userId查询用户
     * @param userId
     * @return
     */
    User queryUserById(Integer userId);

    /**
     * 通过userId查询用户数据
     * @param userId
     * @return
     */
    DataGridView queryUserDataById(Integer userId);
}
