package com.study.utils.stat;

import com.study.pojo.bus.Customer;
import com.study.pojo.bus.Rent;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;


import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;

/**
 * 导出excel文件工具类
 * @author Deja wu
 */
public class ExportExcelFileUtils {

    /**
     * 导出客户数据
     * @param customers
     * @param title
     * @return
     */
    public static ByteArrayOutputStream exportCustomer(List<Customer> customers, String title, String sheetName) {
        //一、组装excel文档
        //1、创建工作簿
        HSSFWorkbook workbook = new HSSFWorkbook();
        //2、创建样式
        HSSFCellStyle baseStyle = ExportHSSFCellStyle.createBaseStyle(workbook);
        HSSFCellStyle subTitleStyle = ExportHSSFCellStyle.createSubTitleStyle(workbook);
        HSSFCellStyle tableTitleStyle = ExportHSSFCellStyle.createTableTitleStyle(workbook);
        HSSFCellStyle titleStyle = ExportHSSFCellStyle.createTitleStyle(workbook);
        //3、在工作簿创建sheet
        HSSFSheet sheet = workbook.createSheet(sheetName);
        //4、设置sheet
        sheet.setDefaultColumnWidth(25);
        //5、合并单元格
        CellRangeAddress cellAddresses1 = new CellRangeAddress(0, 0, 0, 6);
        CellRangeAddress cellAddresses2 = new CellRangeAddress(1, 1, 0, 6);
        sheet.addMergedRegion(cellAddresses1);
        sheet.addMergedRegion(cellAddresses2);
        //6、创建第一行
        int index = 0;
        HSSFRow row1 = sheet.createRow(index);
        //6.1、在第一行里创建单元格
        HSSFCell row1_cell1 = row1.createCell(0);
        //6.2、设置标题样式
        row1_cell1.setCellStyle(titleStyle);
        //6.3、设置标题内容
        row1_cell1.setCellValue(title);
        //7、第二行
        index++;
        HSSFRow row2 = sheet.createRow(index);
        //7.1、在第一行里创建单元格
        HSSFCell row2_cell1 = row2.createCell(0);
        //7.2、设置标题样式
        row2_cell1.setCellStyle(subTitleStyle);
        //7.3、设置标题内容
        row2_cell1.setCellValue("总条数"+customers.size()+"     导出时间:"+new Date().toLocaleString());
        //8、第三行
        String[] tableTitles = {"客户姓名", "客户电话", "身份证号", "客户地址", "客户职业", "性别", "创建时间"};
        index++;
        HSSFRow row3 = sheet.createRow(index);
        for (int i = 0; i < tableTitles.length; i++) {
            HSSFCell row3_cell = row3.createCell(i);
            row3_cell.setCellStyle(tableTitleStyle);
            row3_cell.setCellValue(tableTitles[i]);
        }
        //9、第四行
        for (int i = 0; i < customers.size(); i++) {
            Customer customer = customers.get(i);
            index++;
            HSSFRow rowX = sheet.createRow(index);
            //9.1、创建列 客户姓名
            HSSFCell cell_custname = rowX.createCell(0);
            cell_custname.setCellStyle(baseStyle);
            cell_custname.setCellValue(customer.getCustname());
            //9.2、创建列 客户电话
            HSSFCell cell_phone = rowX.createCell(1);
            cell_phone.setCellStyle(baseStyle);
            cell_phone.setCellValue(customer.getPhone());
            //9.3、创建列 身份证号
            HSSFCell cell_identity = rowX.createCell(2);
            cell_identity.setCellStyle(baseStyle);
            cell_identity.setCellValue(customer.getIdentity());
            //9.4、创建列 客户地址
            HSSFCell cell_address = rowX.createCell(3);
            cell_address.setCellStyle(baseStyle);
            cell_address.setCellValue(customer.getAddress());
            //9.5、创建列 客户职业
            HSSFCell cell_career = rowX.createCell(4);
            cell_career.setCellStyle(baseStyle);
            cell_career.setCellValue(customer.getCareer());
            //9.6、创建列 性别
            HSSFCell cell_sex = rowX.createCell(5);
            cell_sex.setCellStyle(baseStyle);
            cell_sex.setCellValue(customer.getSex()==1?"男":"女");
            //9.7、创建列 创建时间
            HSSFCell cell_createtime = rowX.createCell(6);
            cell_createtime.setCellStyle(baseStyle);
            cell_createtime.setCellValue(customer.getCreatetime().toLocaleString());
        }

        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        //把workbook中的数据写到outputStream中
        try {
            workbook.write(outputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return outputStream;
    }

     /**
     * 导出出租单数据
     * @param rent
     * @param customer
     * @param sheetName
     * @param title
     * @return
     */
    public static ByteArrayOutputStream exportRent(Rent rent, Customer customer, String sheetName, String title,String logo) {
         //一、组装excel文档
        //1、创建工作簿
        HSSFWorkbook workbook = new HSSFWorkbook();
        //2、创建样式
        HSSFCellStyle baseStyle = ExportHSSFCellStyle.createBaseStyle(workbook);
        HSSFCellStyle subTitleStyle = ExportHSSFCellStyle.createSubTitleStyle(workbook);
        HSSFCellStyle tableTitleStyle = ExportHSSFCellStyle.createTableTitleStyle(workbook);
        HSSFCellStyle titleStyle = ExportHSSFCellStyle.createTitleStyle(workbook);
        //3、在工作簿创建sheet
        HSSFSheet sheet = workbook.createSheet(sheetName);
        //4、设置sheet
        sheet.setDefaultColumnWidth(30);
        sheet.setColumnWidth(1,50*256);
        //5、合并单元格
        CellRangeAddress cellAddresses1 = new CellRangeAddress(0, 0, 0, 3);
        //6、创建第一行
        int index = 0;
        HSSFRow row1 = sheet.createRow(index);
        //6.1、在第一行里创建单元格
        HSSFCell row1_cell1 = row1.createCell(0);
        //6.2、设置标题样式
        row1_cell1.setCellStyle(titleStyle);
        //6.3、设置标题内容
        row1_cell1.setCellValue(title);
        //7、第二行
        index++;
        HSSFRow row2 = sheet.createRow(index);
        row2.setHeightInPoints(150);

        HSSFCell row2_cell1 = row2.createCell(0);
        row2_cell1.setCellStyle(baseStyle);
        row2_cell1.setCellValue("出租单号:");

        HSSFCell row2_cell2 = row2.createCell(1);
        row2_cell2.setCellStyle(baseStyle);
        row2_cell2.setCellValue(rent.getRentid());

        HSSFCell row2_cell3 = row2.createCell(2);
        row2_cell3.setCellStyle(baseStyle);
        row2_cell3.setCellValue("二维码:");

        HSSFCell row2_cell4 = row2.createCell(3);
        row2_cell4.setCellStyle(baseStyle);
        row2_cell4.setCellValue("");



        InputStream logoStream = ExportExcelFileUtils.class.getClassLoader().getResourceAsStream(logo);
        BufferedImage image = ZXingCodeEncodeUtils.createZxingCodeUseLogo(rent.getRentid(), 150, 150,logoStream);
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        try {
            ImageIO.write(image,"JPEG",bos);
        } catch (IOException e) {
            e.printStackTrace();
        }

        //画图的顶级管理器，一个sheet只能获取一个
        HSSFPatriarch patriarch = sheet.createDrawingPatriarch();

        /**
         * 参数4  设置图片的平铺程度  最大值是255  255代表铺满当前单元格 小于255就铺不满
         * 参数5  列的开始坐标
         * 参数6  行的开始坐标
         * 参数7  列的结束坐标
         * 参数8  行的结束坐标
         */
        HSSFClientAnchor anchor = new HSSFClientAnchor(0, 0, 0, 255, (short) 3, 1, (short) 4, 1);
        anchor.setAnchorType(ClientAnchor.AnchorType.DONT_MOVE_AND_RESIZE);
        patriarch.createPicture(anchor,workbook.addPicture(bos.toByteArray(),HSSFWorkbook.PICTURE_TYPE_JPEG));


        //8、第三行
        index++;
        HSSFRow row3 = sheet.createRow(index);

        HSSFCell row3_cell1 = row3.createCell(0);
        row3_cell1.setCellStyle(baseStyle);
        row3_cell1.setCellValue("客户姓名:");

        HSSFCell row3_cell2 = row3.createCell(1);
        row3_cell2.setCellStyle(baseStyle);
        row3_cell2.setCellValue(customer.getCustname());

        HSSFCell row3_cell3 = row3.createCell(2);
        row3_cell3.setCellStyle(baseStyle);
        row3_cell3.setCellValue("身份证号:");

        HSSFCell row3_cell4 = row3.createCell(3);
        row3_cell4.setCellStyle(baseStyle);
        row3_cell4.setCellValue(rent.getIdentity());

        //9、第四行
        index++;
        HSSFRow row4 = sheet.createRow(index);

        HSSFCell row4_cell1 = row4.createCell(0);
        row4_cell1.setCellStyle(baseStyle);
        row4_cell1.setCellValue("起租时间:");

        HSSFCell row4_cell2 = row4.createCell(1);
        row4_cell2.setCellStyle(baseStyle);
        row4_cell2.setCellValue(rent.getBegindate().toLocaleString());

        HSSFCell row4_cell3 = row4.createCell(2);
        row4_cell3.setCellStyle(baseStyle);
        row4_cell3.setCellValue("还车时间:");

        HSSFCell row4_cell4 = row4.createCell(3);
        row4_cell4.setCellStyle(baseStyle);
        row4_cell4.setCellValue(rent.getReturndate().toLocaleString());

        //10、第五行
        index++;
        HSSFRow row5 = sheet.createRow(index);

        HSSFCell row5_cell1 = row5.createCell(0);
        row5_cell1.setCellStyle(baseStyle);
        row5_cell1.setCellValue("车牌号:");

        HSSFCell row5_cell2 = row5.createCell(1);
        row5_cell2.setCellStyle(baseStyle);
        row5_cell2.setCellValue(rent.getCarnumber());

        HSSFCell row5_cell3 = row5.createCell(2);
        row5_cell3.setCellStyle(baseStyle);
        row5_cell3.setCellValue("出租价格:");

        HSSFCell row5_cell4 = row5.createCell(3);
        row5_cell4.setCellStyle(baseStyle);
        row5_cell4.setCellValue(rent.getPrice());

        //11、第六行  空行
        index++;

        //12、第七行
        index++;
        HSSFRow row7 = sheet.createRow(index);

        HSSFCell row7_cell3 = row7.createCell(2);
        row7_cell3.setCellStyle(baseStyle);
        row7_cell3.setCellValue("打印时间:");

        HSSFCell row7_cell4 = row7.createCell(3);
        row7_cell4.setCellStyle(baseStyle);
        row7_cell4.setCellValue(new Date().toLocaleString());

        //13、第八行
        index++;
        HSSFRow row8 = sheet.createRow(index);

        HSSFCell row8_cell3 = row8.createCell(2);
        row8_cell3.setCellStyle(baseStyle);
        row8_cell3.setCellValue("操作员:");

        HSSFCell row8_cell4 = row8.createCell(3);
        row8_cell4.setCellStyle(baseStyle);
        row8_cell4.setCellValue(rent.getOpername());

        //14、第九行
        index++;
        HSSFRow row9 = sheet.createRow(index);

        HSSFCell row9_cell3 = row9.createCell(2);
        row9_cell3.setCellStyle(baseStyle);
        row9_cell3.setCellValue("客户签名:");

        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        //把workbook中的数据写到outputStream中
        try {
            workbook.write(outputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return outputStream;
    }
}
