package com.study.controller.sys;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 工作台的控制器
 * @author  Deja wu
 */

@Controller
@RequestMapping("desk")
public class DeskController {

    //TODO 跳转到工作台的页面
    @RequestMapping("toDeskManager")
    public String toDeskManager(){
        return "system/main/deskManager";
    }
}
