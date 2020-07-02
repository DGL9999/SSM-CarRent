package com.study.mapper.bus;

import com.study.pojo.bus.Check;

import java.util.List;

public interface CheckMapper {
    int deleteByPrimaryKey(String checkid);

    int insert(Check record);

    int insertSelective(Check record);

    Check selectByPrimaryKey(String checkid);

    int updateByPrimaryKeySelective(Check record);

    int updateByPrimaryKey(Check record);

    //TODO 查询
    List<Check> queryAllCheck(Check check);
}