package com.study.service.bus.imp;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.study.constant.SystemConstant;
import com.study.mapper.bus.CarMapper;
import com.study.pojo.bus.Car;
import com.study.service.bus.CarService;
import com.study.utils.bus.AppFileUtils;
import com.study.utils.bus.DataGridView;
import com.study.vo.bus.CarVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class CarServiceImpl implements CarService {

    @Autowired
    private CarMapper carMapper;

    //TODO 查询车辆
    @Override
    public DataGridView queryAllCar(CarVo carVo) {
        Page<Object> page = PageHelper.startPage(carVo.getPage(), carVo.getLimit());
        List<Car> data = this.carMapper.queryAllCar(carVo);
        return new DataGridView(page.getTotal(),data);
    }

   //TODO  添加车辆
    @Override
    public void addCar(CarVo carVo) {
        carVo.setCreatetime(new Date());
        this.carMapper.insertSelective(carVo);
    }

      //TODO  修改车辆
    @Override
    public void updateCar(CarVo carVo) {
        this.carMapper.updateByPrimaryKeySelective(carVo);
    }

    //TODO 删除车辆
    @Override
    public void deleteCar(String carnumber) {
        //删除数据库同时将图片删除
        Car car = this.carMapper.selectByPrimaryKey(carnumber);
        if (!car.getCarimg().equals(SystemConstant.DEFAULT_CAR_IMG)){
            //如果图片不是默认图片再删除
            AppFileUtils.deleteFileUsePath(car.getCarimg());
        }
        this.carMapper.deleteByPrimaryKey(carnumber);
    }

    //TODO 批量删除车辆
    @Override
    public void deleteBatchCar(String[] carnumbers) {
        for (String carnumber : carnumbers) {
            deleteCar(carnumber);
        }
    }

    //TODO 通过车牌查询车辆
    @Override
    public Car queryCarByCarNumber(String carNumber) {
        return this.carMapper.selectByPrimaryKey(carNumber);
    }

}
