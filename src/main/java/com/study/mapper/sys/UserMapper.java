package com.study.mapper.sys;

import com.study.pojo.sys.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    //TODO 用户登录
    User login(User user);

    /**
     * 查询所有用户
     */
    List<User> queryAllUser(User user);


    //TODO 根据用户id删除sys_role_user中的数据
    void deleteRoleUserByUid(@Param("uid") Integer userId);

    //TODO 保存用户与角色关系
    void insertRoleUser(@Param("uid") Integer uid, @Param("rid") Integer rid);
}