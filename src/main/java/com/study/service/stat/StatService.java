package com.study.service.stat;


import com.study.pojo.stat.BaseEntity;

import java.util.List;

/**
 * 统计分析的数据服务接口
 * @author Deja wu
 */
public interface StatService {

    /**
     * 查询客户地区数据
     * @return
     */
    List<BaseEntity> loadCustomerAreaStat();

    /**
     * 查询业务员销售额数据 （月度）
     * @return
     * @param month
     */
    List<BaseEntity> loadOpernameSaleStat(String month);

    /**
     * 查询业务员销售额数据 （年度）
     * @param year
     * @return
     */
    List<BaseEntity> loadOpernameYearGradeStatJson(String year);

    /**
     * 查询公司销售额数据（年度）
     * @param year
     * @return
     */
    List<BaseEntity> loadCompanySaleStat(String year);
}
