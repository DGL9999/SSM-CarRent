package com.study.mapper.bus;

import com.study.pojo.bus.Car;

import java.util.List;

public interface CarMapper {
    int deleteByPrimaryKey(String carnumber);

    int insert(Car record);

    int insertSelective(Car record);

    Car selectByPrimaryKey(String carnumber);

    int updateByPrimaryKeySelective(Car record);

    int updateByPrimaryKey(Car record);

    //TODO 查询车辆
    List<Car> queryAllCar(Car car);
}