package com.study.controller.bus;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * 商务的菜单页面跳转控制器
 * @author Deja wu
 */
@Controller
@RequestMapping("bus")
public class BusController {

    //TODO 跳转到客户管理页面
    @RequestMapping("toCustomerManager")
    public String toCustomerManager(){
        return "business/customer/customerManager";
    }

    //TODO 跳转到车辆管理页面
    @RequestMapping("toCarManager")
    public String toCarManager(){
        return "business/car/carManager";
    }


    //TODO 跳转到出租管理页面
    @RequestMapping("toRentCarManager")
    public String toRentCarManager(){
        return "business/rent/rentCarManager";
    }

    //TODO 跳转到出租单管理页面
    @RequestMapping("toRentManager")
    public String toRentManager(){
        return "business/rent/rentManager";
    }

    //TODO 跳转到汽车入库管理页面
    @RequestMapping("toCheckCarManager")
    public String toCheckCarManager(){
        return "business/check/checkCarManager";
    }

    //TODO 跳转到检查单管理页面
    @RequestMapping("toCheckManager")
    public String toNewsManager(){
        return "business/check/checkManager";
    }
}
