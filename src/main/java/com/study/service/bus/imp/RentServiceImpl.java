package com.study.service.bus.imp;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.study.constant.SystemConstant;
import com.study.mapper.bus.CarMapper;
import com.study.mapper.bus.RentMapper;
import com.study.pojo.bus.Car;
import com.study.pojo.bus.Rent;
import com.study.service.bus.RentService;
import com.study.utils.bus.DataGridView;
import com.study.vo.bus.RentVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class RentServiceImpl implements RentService {

    @Autowired
    private RentMapper rentMapper;

    @Autowired
    private CarMapper carMapper;

    /****************************  汽车出租管理  ******************************/
    @Override
    public void addRent(RentVo rentVo) {
        this.rentMapper.insertSelective(rentVo);
        //更改车辆出租状态
        Car car = new Car();
        car.setCarnumber(rentVo.getCarnumber());
        car.setIsrenting(SystemConstant.IS_RENTING_TRUE);
        carMapper.updateByPrimaryKeySelective(car);
    }


    /****************************  出租单管理  ******************************/
    @Override
    public DataGridView queryAllRent(RentVo rentVo) {
        Page<Object> page = PageHelper.startPage(rentVo.getPage(),rentVo.getLimit());
        List<Rent> data = this.rentMapper.queryAllRent(rentVo);
        return new DataGridView(page.getTotal(),data);
    }

    @Override
    public void updateRent(RentVo rentVo) {
        //当将是否出归还从否设置为是时 ，需要将汽车管理中的是否出租设置为否
        if (rentVo.getRentflag()==1){
            Car car = new Car();
            car.setCarnumber(rentVo.getCarnumber());
            car.setIsrenting(SystemConstant.IS_RENTING_FALSE);
            this.carMapper.updateByPrimaryKeySelective(car);
        }
        this.rentMapper.updateByPrimaryKeySelective(rentVo);
    }

    @Override
    public void deleteRent(String rentid) {
        //更改汽车的出租状态
        Rent rent = this.rentMapper.selectByPrimaryKey(rentid);
        Car car = new Car();
        car.setCarnumber(rent.getCarnumber());
        car.setIsrenting(SystemConstant.IS_RENTING_FALSE);
        carMapper.updateByPrimaryKeySelective(car);
        //删除出租单
        this.rentMapper.deleteByPrimaryKey(rentid);
    }

    @Override
    public Rent queryRentById(String rentid) {
        return this.rentMapper.selectByPrimaryKey(rentid);
    }
}
