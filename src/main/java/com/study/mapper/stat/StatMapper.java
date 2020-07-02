package com.study.mapper.stat;

import com.study.pojo.stat.BaseEntity;

import java.util.List;

public interface StatMapper {

    //TODO 加载客户地区统计数据
    List<BaseEntity> loadCustomerAreaStat();

    //TODO 加载业务员销售额统计数据 (月度)
    List<BaseEntity> loadOpernameSaleStat(String month);

    //TODO 加载业务员销售额统计数据  （年度）
    List<BaseEntity> loadOpernameYearGradeStatJson(String year);

    //TODO 加载公司销售额统计数据  （年度）
    List<BaseEntity> loadCompanySaleStat(String year);
}
