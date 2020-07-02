package com.study.vo.sys;

import com.study.pojo.sys.Menu;
import lombok.Data;

@Data
public class MenuVo extends Menu {

    /**
     * 分页参数
     */

    private Integer page;
    private Integer limit;

}
