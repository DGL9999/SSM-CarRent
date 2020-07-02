package com.study.service.bus;

import com.study.pojo.bus.Car;
import com.study.utils.bus.DataGridView;
import com.study.vo.bus.CarVo;


public interface CarService {


    /**
     * 查询所有车辆
     * @param carVo 这个视图对象中带有分页的参数
     * @return 返回一个简单json格式，给角色管理
     */
    DataGridView queryAllCar(CarVo carVo);

     /**
     * 添加车辆
     * @param carVo
     */
    void addCar(CarVo carVo);

    /**
     * 修改车辆
     * @param carVo
     */
    void updateCar(CarVo carVo);

    /**
     * 根据车牌删除车辆
     * @param carnumber
     */
    void deleteCar(String carnumber);

    /**
     * 批量删除车辆
     * @param carnumbers
     */
    void deleteBatchCar(String[] carnumbers);

    /**
     * 通过车牌查询车辆
     * @param carNumber
     * @return
     */
    Car queryCarByCarNumber(String carNumber);

}
