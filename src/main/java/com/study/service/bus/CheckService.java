package com.study.service.bus;

import com.study.utils.bus.DataGridView;
import com.study.vo.bus.CheckVo;

import java.util.Map;

public interface CheckService {

    /**
     * 根据出租单号加载检查单与出租单——车辆——客户信息
     * @param rentid
     * @return
     */
    Map<String, Object> initCheckFormData(String rentid);

    /**
     * 保存检查单数据
     * @param checkVo
     */
    void addCheck(CheckVo checkVo);

    /**
     * 查询
     */
    DataGridView queryAllCheck(CheckVo checkVo);

    /**
     * 修改
     * @param checkVo
     */
    void updateCheck(CheckVo checkVo);
}
