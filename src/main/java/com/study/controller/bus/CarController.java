package com.study.controller.bus;


import com.study.constant.SystemConstant;
import com.study.pojo.bus.Car;
import com.study.service.bus.CarService;
import com.study.utils.bus.AppFileUtils;
import com.study.utils.bus.DataGridView;
import com.study.utils.bus.ResultObj;
import com.study.utils.bus.WebUtils;
import com.study.vo.bus.CarVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.List;


/**
 * 车辆管理控制器
 *
 * @author Deja wu
 */

@RestController
@RequestMapping("car")
public class CarController {

    @Autowired
    private CarService carService;

    //TODO 加载车辆列表
    @RequestMapping("loadAllCar")
    public DataGridView loadCarMangerList(CarVo carVo) {
        return this.carService.queryAllCar(carVo);
    }


   //TODO 添加车辆
    @RequestMapping("addCar")
    public ResultObj addNews(CarVo carVo) {

        try {
             carVo.setCreatetime(new Date());
            //如果不是默认图片就去掉图片的_temp的后缀
            if(!carVo.getCarimg().equals(SystemConstant.DEFAULT_CAR_IMG)){
                String filePath = AppFileUtils.updateFileName(carVo.getCarimg(), SystemConstant.FILE_UPLOAD_TEMP);
                carVo.setCarimg(filePath);
            }
            this.carService.addCar(carVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    //TODO 修改车辆
    @RequestMapping("updateCar")
    public ResultObj updateCar(CarVo carVo) {
        try {
            String carImg = carVo.getCarimg();
            //如果上传的文件以_temp结尾，去掉_temp后缀
            if (carImg.endsWith(SystemConstant.FILE_UPLOAD_TEMP)){
                String filePath = AppFileUtils.updateFileName(carVo.getCarimg(), SystemConstant.FILE_UPLOAD_TEMP);
                carVo.setCarimg(filePath);

                //把原图片删除
                Car car = this.carService.queryCarByCarNumber(carVo.getCarnumber());
                AppFileUtils.deleteFileUsePath(car.getCarimg());
            }
            this.carService.updateCar(carVo);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UpDATE_ERROR;
        }
    }


    //TODO 删除车辆
    @RequestMapping("deleteCar")
    public ResultObj deleteCar(CarVo carVo) {
        try {
            this.carService.deleteCar(carVo.getCarnumber());
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_SUCCESS;
        }
    }

    //TODO 批量删除车辆
    @RequestMapping("deleteBatchCar")
    public ResultObj deleteBatchCar(CarVo carVo) {
        try {
            this.carService.deleteBatchCar(carVo.getCarnumbers());
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_SUCCESS;
        }
    }
}
