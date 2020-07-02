package com.study.service.bus;

import com.study.pojo.bus.Customer;
import com.study.utils.bus.DataGridView;
import com.study.vo.bus.CustomerVo;
import com.study.vo.sys.NewsVo;

import java.util.List;


public interface CustomerService {


    /**
     * 查询所有客户
     * @param customerVo 这个视图对象中带有分页的参数
     * @return 返回一个简单json格式，给角色管理
     */
    DataGridView queryAllCustomer(CustomerVo customerVo);

     /**
     * 添加客户
     * @param customerVo
     */
    void addCustomer(CustomerVo customerVo);

    /**
     * 修改客户
     * @param customerVo
     */
    void updateCustomer(CustomerVo customerVo);

    /**
     * 根据ID删除客户
     * @param identity
     */
    void deleteCustomer(String identity);

    /**
     * 批量删除客户
     * @param identities
     */
    void deleteBatchCustomer(String[] identities);

    /**
     * 根据身份证号查询客户信息
     * @param identity
     * @return
     */
    Customer queryCustomerByIdentity(String identity);


    /**
     * 查询客户数据返回集合
     * @param customerVo
     * @return
     */
    List<Customer> queryAllCustomerForList(CustomerVo customerVo);
}
