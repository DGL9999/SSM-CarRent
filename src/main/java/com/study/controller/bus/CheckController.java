package com.study.controller.bus;

import com.study.constant.SystemConstant;
import com.study.pojo.bus.Rent;
import com.study.service.bus.CheckService;
import com.study.service.bus.RentService;
import com.study.utils.bus.DataGridView;
import com.study.utils.bus.ResultObj;
import com.study.vo.bus.CheckVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.Map;

/**
 * 检查单管理控制器
 * @author Deja wu
 */
@RestController
@RequestMapping("check")
public class CheckController {

    @Autowired
    private RentService rentService;

    @Autowired
    private CheckService checkService;


        /*****************************  汽车入库管理页面  ****************************/
    //TODO 根据出租单号查询
    @RequestMapping("checkRentExist")
    public Rent checkRentExist(String rentid){
        Rent rent  = rentService.queryRentById(rentid);
        return rent;
    }

    //TODO 根据出租单号加载检查单与出租单——车辆——客户信息
    @RequestMapping("initCheckFormData")
    public Map<String,Object> initCheckFormData(String rentid){
        return checkService.initCheckFormData(rentid);
    }

    //TODO 保存检查单数据
    @RequestMapping("saveCheck")
    public ResultObj saveCheck(CheckVo checkVo){

        try {
            checkVo.setCreatetime(new Date());
            this.checkService.addCheck(checkVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    /*****************************  检查单管理页面  ****************************/
    //TODO 查询检查单
    @RequestMapping("loadAllCheck")
    public DataGridView loadAllCheck(CheckVo checkVo){
        return  this.checkService.queryAllCheck(checkVo);
    }

    //TODO 修改检查单
    @RequestMapping("updateCheck")
    public ResultObj updateCheck(CheckVo checkVo){
        try {
            checkVo.setCheckdate(new Date());
            this.checkService.updateCheck(checkVo);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UpDATE_ERROR;
        }
    }

}
