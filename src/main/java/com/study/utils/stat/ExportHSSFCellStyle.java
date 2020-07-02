package com.study.utils.stat;

import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * excel文件表格格式
 * @author Deja wu
 */
public class ExportHSSFCellStyle {


	/**
	 * 创建基础样式
	 * 水平和垂直居中
	 */
	public static HSSFCellStyle createBaseStyle(HSSFWorkbook workbook) {
		HSSFCellStyle style = workbook.createCellStyle();
		//设置水平居中
		style.setAlignment(HorizontalAlignment.CENTER);
		//设置垂直居中
		style.setVerticalAlignment(VerticalAlignment.CENTER);
		return style;
	}

	/**
	 * 创建数据表格的头的样式
	 */
	public static HSSFCellStyle createTableTitleStyle(HSSFWorkbook workbook) {
		HSSFCellStyle style = createBaseStyle(workbook);

		//设置字体
		HSSFFont font=workbook.createFont();
		font.setBold(true);//是否加粗
		font.setItalic(true);//是否斜体
		font.setFontHeightInPoints((short)20); //设置字体大小
		font.setColor(HSSFColor.HSSFColorPredefined.DARK_YELLOW.getIndex());//设置颜色
		font.setFontName("黑体");//设置字体
		style.setFont(font);

		return style;
	}


	/**
	 * 创建小标题样式
	 */
	public static HSSFCellStyle createSubTitleStyle(HSSFWorkbook workbook) {
		HSSFCellStyle style = createBaseStyle(workbook);
		//设置字体
		HSSFFont font=workbook.createFont();
		font.setBold(true);//是否加粗
		font.setFontHeightInPoints((short)18); //设置字体大小
		font.setColor(HSSFColor.HSSFColorPredefined.SKY_BLUE.getIndex());//设置颜色
		font.setFontName("黑体");//设置字体
		style.setFont(font);
		return style;
	}



	/**
	 * 创建标题样式
	 */
	public static HSSFCellStyle createTitleStyle(HSSFWorkbook workbook) {
		HSSFCellStyle style = createBaseStyle(workbook);
		//设置字体
		HSSFFont font=workbook.createFont();
		font.setBold(true);//是否加粗
		font.setFontHeightInPoints((short)35); //设置字体大小
		font.setColor(HSSFColor.HSSFColorPredefined.RED.getIndex());//设置颜色
		font.setFontName("华文行楷");//设置字体
		style.setFont(font);
		return style;
	}
}
