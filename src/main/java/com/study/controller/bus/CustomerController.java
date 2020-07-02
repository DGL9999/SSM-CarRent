package com.study.controller.bus;


import com.study.service.bus.CustomerService;
import com.study.utils.bus.DataGridView;
import com.study.utils.bus.ResultObj;
import com.study.vo.bus.CustomerVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


/**
 * 客户管理控制器
 *
 * @author Deja wu
 */

@RestController
@RequestMapping("customer")
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    //TODO 加载客户列表
    @RequestMapping("loadAllCustomer")
    public DataGridView loadCustomerMangerList(CustomerVo customerVo) {
        return this.customerService.queryAllCustomer(customerVo);
    }


   //TODO 添加客户
    @RequestMapping("addCustomer")
    public ResultObj addNews(CustomerVo customerVo) {

        try {
            this.customerService.addCustomer(customerVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    //TODO 修改客户
    @RequestMapping("updateCustomer")
    public ResultObj updateCustomer(CustomerVo customerVo) {
        try {
            this.customerService.updateCustomer(customerVo);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UpDATE_ERROR;
        }
    }


    //TODO 删除客户
    @RequestMapping("deleteCustomer")
    public ResultObj deleteCustomer(CustomerVo customerVo) {
        try {
            this.customerService.deleteCustomer(customerVo.getIdentity());
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_SUCCESS;
        }
    }

    //TODO 批量删除客户
    @RequestMapping("deleteBatchCustomer")
    public ResultObj deleteBatchCustomer(CustomerVo customerVo) {
        try {
            this.customerService.deleteBatchCustomer(customerVo.getIdentities());
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_SUCCESS;
        }
    }
}
