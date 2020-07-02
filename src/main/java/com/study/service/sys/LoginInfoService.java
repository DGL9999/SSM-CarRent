package com.study.service.sys;

import com.study.pojo.sys.LoginInfo;
import com.study.utils.sys.DataGridView;
import com.study.vo.sys.LoginInfoVo;
import com.study.vo.sys.UserVo;


public interface LoginInfoService {


    /**
     * 查询所有日志
     * @param loginInfoVo 这个视图对象中带有分页的参数
     * @return 返回一个简单json格式，给角色管理
     */
    DataGridView queryAllLoginInfo(LoginInfoVo loginInfoVo);

     /**
     * 添加日志
     * @param loginInfoVo
     */
    void addLoginInfo(LoginInfoVo loginInfoVo);

    /**
     * 根据ID删除日志
     * @param loginInfoId
     */
    void deleteLoginInfo(Integer loginInfoId);

    /**
     * 批量删除日志
     * @param ids
     */
    void deleteBatchLoginInfo(Integer[] ids);

}
