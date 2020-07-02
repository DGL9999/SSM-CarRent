package com.study.mapper.sys;

import com.study.pojo.sys.LoginInfo;

import java.util.List;

public interface LoginInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LoginInfo record);

    int insertSelective(LoginInfo record);

    LoginInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LoginInfo record);

    int updateByPrimaryKey(LoginInfo record);

    //TODO 查询日志
    List<LoginInfo> queryAllLoginInfo(LoginInfo loginInfo);
}