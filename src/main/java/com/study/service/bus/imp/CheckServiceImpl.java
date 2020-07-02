package com.study.service.bus.imp;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.study.constant.SystemConstant;
import com.study.mapper.bus.CarMapper;
import com.study.mapper.bus.CheckMapper;
import com.study.mapper.bus.CustomerMapper;
import com.study.mapper.bus.RentMapper;
import com.study.pojo.bus.Car;
import com.study.pojo.bus.Check;
import com.study.pojo.bus.Customer;
import com.study.pojo.bus.Rent;
import com.study.pojo.sys.User;
import com.study.service.bus.CheckService;
import com.study.utils.bus.DataGridView;
import com.study.utils.bus.RandomUtils;
import com.study.utils.bus.WebUtils;
import com.study.vo.bus.CheckVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CheckServiceImpl implements CheckService {

    @Autowired
    private RentMapper rentMapper;

    @Autowired
    private CarMapper carMapper;

    @Autowired
    private CustomerMapper customerMapper;

    @Autowired
    private CheckMapper checkMapper;

    // TODO 根据出租单号加载检查单与出租单——车辆——客户信息
    @Override
    public Map<String, Object> initCheckFormData(String rentid) {
        //根据出租单号查询出租单信息
        Rent rent = this.rentMapper.selectByPrimaryKey(rentid);
        //根据车牌号查询车辆信息
        Car car = this.carMapper.selectByPrimaryKey(rent.getCarnumber());
        //根据身份证号查询客户信息
        Customer customer = this.customerMapper.selectByPrimaryKey(rent.getIdentity());
        //组装check
        Check check = new Check();
        check.setCheckid(RandomUtils.createRandomStringUseTime(SystemConstant.CAR_ORDER_JC));
        check.setRentid(rentid);
        check.setCheckdate(new Date());
        User user = (User) WebUtils.getHttpSession().getAttribute("user");
        check.setOpername(user.getRealname());
        //组装map
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("check",check);
        map.put("customer",customer);
        map.put("car",car);
        map.put("rent",rent);
        return map;
    }

    //TODO 保存检查单
    @Override
    public void addCheck(CheckVo checkVo) {
        this.checkMapper.insertSelective(checkVo);
        //更改出租单状态
        Rent rent = this.rentMapper.selectByPrimaryKey(checkVo.getRentid());
        rent.setRentflag(SystemConstant.RENT_BACK_TRUE);
        this.rentMapper.updateByPrimaryKeySelective(rent);
        //更改汽车出租状态
        Car car = new Car();
        car.setCarnumber(rent.getCarnumber());
        car.setIsrenting(SystemConstant.IS_RENTING_FALSE);
        this.carMapper.updateByPrimaryKeySelective(car);
    }

    //TODO 查询
    @Override
    public DataGridView queryAllCheck(CheckVo checkVo) {
        Page<Object> page = PageHelper.startPage(checkVo.getPage(),checkVo.getLimit());
        List<Check> data = this.checkMapper.queryAllCheck(checkVo);
        return new DataGridView(page.getTotal(),data);
    }

    @Override
    public void updateCheck(CheckVo checkVo) {
        this.checkMapper.updateByPrimaryKeySelective(checkVo);
    }
}
