package com.study.service.bus.imp;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.study.mapper.bus.CustomerMapper;
import com.study.pojo.bus.Customer;
import com.study.service.bus.CustomerService;
import com.study.utils.bus.DataGridView;
import com.study.vo.bus.CustomerVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerMapper customerMapper;

    //TODO 查询客户
    @Override
    public DataGridView queryAllCustomer(CustomerVo customerVo) {
        Page<Object> page = PageHelper.startPage(customerVo.getPage(), customerVo.getLimit());
        List<Customer> data = this.customerMapper.queryAllCustomer(customerVo);
        return new DataGridView(page.getTotal(),data);
    }

   //TODO  添加客户
    @Override
    public void addCustomer(CustomerVo customerVo) {
        customerVo.setCreatetime(new Date());
        this.customerMapper.insertSelective(customerVo);
    }

      //TODO  修改客户
    @Override
    public void updateCustomer(CustomerVo customerVo) {
        this.customerMapper.updateByPrimaryKeySelective(customerVo);
    }

    //TODO 删除客户
    @Override
    public void deleteCustomer(String identity) {
        this.customerMapper.deleteByPrimaryKey(identity);
    }

    //TODO 批量删除客户
    @Override
    public void deleteBatchCustomer(String[] identities) {
        for (String identity : identities) {
            deleteCustomer(identity);
        }
    }

    @Override
    public Customer queryCustomerByIdentity(String identity) {
        return this.customerMapper.selectByPrimaryKey(identity);
    }

    @Override
    public List<Customer> queryAllCustomerForList(CustomerVo customerVo) {
        return this.customerMapper.queryAllCustomer(customerVo);
    }
}
