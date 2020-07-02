package com.study.mapper.bus;

import com.study.pojo.bus.Customer;

import java.util.List;

public interface CustomerMapper {
    int deleteByPrimaryKey(String identity);

    int insert(Customer record);

    int insertSelective(Customer record);

    Customer selectByPrimaryKey(String identity);

    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(Customer record);


     //TODO 查询客户
    List<Customer> queryAllCustomer(Customer customer);
}