package com.study.service.bus;



import com.study.pojo.bus.Rent;
import com.study.utils.bus.DataGridView;
import com.study.vo.bus.RentVo;



public interface RentService {

    /****************************  汽车出租管理  ******************************/
    /**
     * 保存出租单信息
     * @param rentVo
     */
    void addRent(RentVo rentVo);


     /****************************  出租单管理  ******************************/
    /**
     * 查询出租单
     * @param rentVo
     * @return
     */
    DataGridView queryAllRent(RentVo rentVo);

    /**
     * 修改出租单
     * @param rentVo
     */
    void updateRent(RentVo rentVo);

    /**
     * 删除出租单
     * @param rentid
     */
    void deleteRent(String rentid);

    /**
     * 根据出租单号查出租单
     * @param rentid
     * @return
     */
    Rent queryRentById(String rentid);

}
