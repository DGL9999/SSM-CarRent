package com.study.service.stat.imp;

import com.study.mapper.stat.StatMapper;
import com.study.pojo.stat.BaseEntity;
import com.study.service.stat.StatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StatServiceImpl implements StatService {

    @Autowired
    private StatMapper statMapper;

    //TODO 查询客户地区数据
    @Override
    public List<BaseEntity> loadCustomerAreaStat() {
        return statMapper.loadCustomerAreaStat();
    }

    //TODO 查询业务员销售额数据  (月度)
    @Override
    public List<BaseEntity> loadOpernameSaleStat(String month) {
        return statMapper.loadOpernameSaleStat(month);
    }

    //TODO 查询业务员销售额数据  (年度)
    @Override
    public List<BaseEntity> loadOpernameYearGradeStatJson(String year) {
        return statMapper.loadOpernameYearGradeStatJson(year);
    }

    @Override
    public List<BaseEntity> loadCompanySaleStat(String year) {
        return statMapper.loadCompanySaleStat(year);
    }
}
