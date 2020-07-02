package com.study.controller.stat;


import com.study.pojo.bus.Customer;
import com.study.pojo.bus.Rent;
import com.study.pojo.stat.BaseEntity;
import com.study.service.bus.CustomerService;
import com.study.service.bus.RentService;
import com.study.service.stat.StatService;
import com.study.utils.stat.ExportExcelFileUtils;
import com.study.utils.stat.ZXingCodeEncodeUtils;
import com.study.vo.bus.CustomerVo;
import org.apache.catalina.loader.WebappClassLoader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("stat")
public class statController {

    @Autowired
    private StatService statService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private RentService rentService;

    /********************** 跳转控制器 ********************/
    //TODO 跳转到客户地区统计页面
    @RequestMapping("toCustomerAreaStat")
    public String toCustomerAreaStat(){
        return "stat/customerAreaStat";
    }

    //TODO 跳转到业务员销售额统计页面
    @RequestMapping("toOpernameSaleStat")
    public String toOpernameSaleStat(){
        return "stat/opernameSaleStat";
    }

    //TODO 跳转到公司销售额统计页面
    @RequestMapping("toCompanySaleStat")
    public String toCompanySaleStat(){
        return "stat/companySaleStat";
    }

    /*********************** json控制器  **************************/


    //TODO 加载客户地区数据
    @RequestMapping("loadCustomerAreaStat")
    @ResponseBody
    public List<BaseEntity> loadCustomerAreaStat(){
        return this.statService.loadCustomerAreaStat();
    }

    //TODO 加载业务员销售额数据  (月度)
    @RequestMapping("loadOpernameSaleStat")
    @ResponseBody
    public Map<String,Object> loadOpernameSaleStat(String month){
        List<BaseEntity> entities= this.statService.loadOpernameSaleStat(month);
        Map<String, Object> map = new HashMap<String, Object>();
        List<String> names = new ArrayList<String>();
        List<Double> values = new ArrayList<Double>();
        for (BaseEntity entity : entities) {
            names.add(entity.getName());
            values.add(entity.getValue());
        }
        map.put("name",names);
        map.put("value",values);
        return map;
    }

    //TODO 加载业务员销售额数据 （年度）
    @RequestMapping("loadOpernameYearGradeStatJson")
    @ResponseBody
    public Map<String,Object> loadOpernameYearGradeStatJson(String year){
        List<BaseEntity> entities= this.statService.loadOpernameYearGradeStatJson(year);
        Map<String, Object> map = new HashMap<String, Object>();
        List<String> names = new ArrayList<String>();
        List<Double> values = new ArrayList<Double>();
        for (BaseEntity entity : entities) {
            names.add(entity.getName());
            values.add(entity.getValue());
        }
        map.put("name",names);
        map.put("value",values);
        return map;
    }

    //TODO 加载业务员销售额数据 （年度）
    @RequestMapping("loadCompanySaleStat")
    @ResponseBody
    public Map<String,Object> loadCompanySaleStat(String year){
        List<BaseEntity> entities= this.statService.loadCompanySaleStat(year);
        Map<String, Object> map = new HashMap<String, Object>();
        List<String> names = new ArrayList<String>();
        List<Double> values = new ArrayList<Double>();
        for (BaseEntity entity : entities) {
            names.add(entity.getName());
            values.add(entity.getValue());
        }
        map.put("name",names);
        map.put("value",values);
        return map;
    }

    //TODO 导出客户
    @RequestMapping("exportCustomer")
    public ResponseEntity<Object> exportCustomer(CustomerVo customerVo){
        List<Customer> customers = customerService.queryAllCustomerForList(customerVo);
        String fileName = "客户数据.xls";
        String sheetName = "客户数据";
        String title = "客户数据列表";

        ByteArrayOutputStream bos = ExportExcelFileUtils.exportCustomer(customers,sheetName,title);
        try {
            //处理文件名乱码
            fileName= URLEncoder.encode(fileName,"UTF-8");
            //创建 封装响应头信息的对象
            HttpHeaders headers = new HttpHeaders();
            //封装响应内容类型(APPLICATION_OCTET_STREAM 响应的内容不限定)
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            //设置下载的文件的名称
            headers.setContentDispositionFormData("attachment",fileName);
            return new ResponseEntity<Object>(bos.toByteArray(),headers, HttpStatus.CREATED);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    //TODO 导出出租单
    @RequestMapping("exportRent")
    public ResponseEntity<Object> exportRent(String rentid){
        //根据出租单号查询出租单
        Rent rent = rentService.queryRentById(rentid);
        //根据身份证号查询客户信息
        Customer customer = customerService.queryCustomerByIdentity(rent.getIdentity());

        String fileName = customer.getCustname()+"的出租单.xls";
        String sheetName = customer.getCustname()+"出租单";
        String title = customer.getCustname()+"的出租单据列表";
        String logo = "logo.jpg";

        ByteArrayOutputStream bos = ExportExcelFileUtils.exportRent(rent,customer,sheetName,title,logo);

        try {
            //处理文件名乱码
            fileName= URLEncoder.encode(fileName,"UTF-8");
            //创建 封装响应头信息的对象
            HttpHeaders headers = new HttpHeaders();
            //封装响应内容类型(APPLICATION_OCTET_STREAM 响应的内容不限定)
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            //设置下载的文件的名称
            headers.setContentDispositionFormData("attachment",fileName);
            return new ResponseEntity<Object>(bos.toByteArray(),headers, HttpStatus.CREATED);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
