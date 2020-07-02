package com.study.controller.bus;

import com.study.constant.SystemConstant;
import com.study.pojo.bus.Customer;
import com.study.pojo.sys.User;
import com.study.service.bus.CustomerService;
import com.study.service.bus.RentService;
import com.study.utils.bus.DataGridView;
import com.study.utils.bus.RandomUtils;
import com.study.utils.bus.ResultObj;
import com.study.utils.bus.WebUtils;
import com.study.vo.bus.RentVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

/**
 * 出租单管理控制器
 * @author Deja wu
 */
@RestController
@RequestMapping("rent")
public class RentController {

    @Autowired
    private RentService rentService;

    @Autowired
    private CustomerService customerService;

    /****************************  汽车出租管理  ******************************/
    //TODO 检查身份证号是否存在
    @RequestMapping("checkCustomerExist")
    public ResultObj checkCustomerExist(RentVo rentVo) {
        Customer customer = customerService.queryCustomerByIdentity(rentVo.getIdentity());
        if (customer != null) {
            return ResultObj.STATUS_TRUE;
        } else {
            return ResultObj.STATUS_FALSE;
        }
    }

    //TODO 初始化汽车出租弹出层表单数据
    @RequestMapping("initRentFrom")
    public RentVo initRentFrom(RentVo rentVo){
        //生成出租单号
        rentVo.setRentid(RandomUtils.createRandomStringUseTime(SystemConstant.CAR_ORDER_CZ));
        //设置起租时间
        rentVo.setBegindate(new Date());
        //设置操作员
        User user = (User) WebUtils.getHttpSession().getAttribute("user");
        rentVo.setOpername(user.getRealname());
        return rentVo;
    }

    //TODO 保存出租单信息
    @RequestMapping("saveRent")
    public ResultObj saveRent(RentVo rentVo){

        try {
            //获得起租时间
            Date begindate = rentVo.getBegindate();
            //获得归还时间
            Date returndate = rentVo.getReturndate();
            if (returndate.compareTo(begindate)>0){        //如果归还时间大于起租时间，则保存
                //设置归还状态
                rentVo.setRentflag(SystemConstant.RENT_BACK_FALSE);
                //设置创建时间
                rentVo.setCreatetime(new Date());
                //保存出租单
                this.rentService.addRent(rentVo);
                return ResultObj.ADD_SUCCESS;
            }
            //否则添加失败
            return ResultObj.ADD_ERROR;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    /****************************  出租单管理  ******************************/

   //TODO 查询
    @RequestMapping("loadAllRent")
    public DataGridView loadAllRent(RentVo rentVo){
        return this.rentService.queryAllRent(rentVo);
    }

    //TODO 编辑出租单信息
    @RequestMapping("updateRent")
    public ResultObj updateRent(RentVo rentVo){

        try {
            //获得起租时间
            Date begindate = rentVo.getBegindate();
            //获得归还时间
            Date returndate = rentVo.getReturndate();
            if (returndate.compareTo(begindate)>0){        //如果归还时间大于起租时间，则保存
                //保存出租单
                this.rentService.updateRent(rentVo);
                return ResultObj.UPDATE_SUCCESS;
            }
            //否则添加失败
            return ResultObj.UpDATE_ERROR;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UpDATE_ERROR;
        }
    }

    //TODO 删除出租单信息
    @RequestMapping("deleteRent")
    public ResultObj deleteRent(RentVo rentVo){

        try {
            //删除出租单
            this.rentService.deleteRent(rentVo.getRentid());
            return ResultObj.DELETE_SUCCESS;

        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }
}
