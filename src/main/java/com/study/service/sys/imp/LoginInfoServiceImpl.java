package com.study.service.sys.imp;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.study.mapper.sys.LoginInfoMapper;
import com.study.pojo.sys.LoginInfo;
import com.study.service.sys.LoginInfoService;
import com.study.utils.sys.DataGridView;
import com.study.vo.sys.LoginInfoVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LoginInfoServiceImpl implements LoginInfoService {

    @Autowired
    private LoginInfoMapper loginInfoMapper;

    //TODO 查询日志
    @Override
    public DataGridView queryAllLoginInfo(LoginInfoVo loginInfoVo) {
        Page<Object> page = PageHelper.startPage(loginInfoVo.getPage(), loginInfoVo.getLimit());
        List<LoginInfo> data = this.loginInfoMapper.queryAllLoginInfo(loginInfoVo);
        return new DataGridView(page.getTotal(),data);
    }

   //TODO  添加日志
    @Override
    public void addLoginInfo(LoginInfoVo loginInfoVo) {
        this.loginInfoMapper.insertSelective(loginInfoVo);
    }

    //TODO 删除日志
    @Override
    public void deleteLoginInfo(Integer loginInfoId) {
        this.loginInfoMapper.deleteByPrimaryKey(loginInfoId);
    }

    //TODO 批量删除日志
    @Override
    public void deleteBatchLoginInfo(Integer[] ids) {
        for (Integer loginInfoId : ids) {
            deleteLoginInfo(loginInfoId);
        }
    }
}
