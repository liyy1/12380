package com.domor.utils;

import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFRow;


/**
 * 导出报表工具类
 */
public class ExportExcelUtil {
    /**
     *
     * @param title 标题
     * @param headers  表头
     * @param values  表中元素
     * @return
     */
    public static HSSFWorkbook getHSSFWorkbook(String title, String headers[], String [][] values){

        //创建一个HSSFWorkbook，对应一个Excel文件
        HSSFWorkbook hssfWorkbook = new HSSFWorkbook();

        //在workbook中添加一个sheet,对应Excel文件中的sheet
        HSSFSheet hssfSheet = hssfWorkbook.createSheet(title);

        //创建标题合并行
        hssfSheet.addMergedRegion(new CellRangeAddress(0,(short)0,0,(short)headers.length - 1));

        //设置字体
        Font titleFont = hssfWorkbook.createFont();
        titleFont.setFontHeightInPoints((short) 16);
        Font contentFont = hssfWorkbook.createFont();
        contentFont.setFontHeightInPoints((short) 12);

        //设置标题样式
        HSSFCellStyle style = hssfWorkbook.createCellStyle();
        style.setAlignment(HorizontalAlignment.CENTER);   //设置居中样式
        style.setVerticalAlignment(VerticalAlignment.CENTER);
        style.setFont(titleFont);

        //设置值表头样式 设置表头居中
        HSSFCellStyle hssfCellStyle = hssfWorkbook.createCellStyle();
        hssfCellStyle.setAlignment(HorizontalAlignment.CENTER);   //设置居中样式
        hssfCellStyle.setBorderBottom(BorderStyle.THIN);
        hssfCellStyle.setBorderLeft(BorderStyle.THIN);
        hssfCellStyle.setBorderRight(BorderStyle.THIN);
        hssfCellStyle.setBorderTop(BorderStyle.THIN);
        hssfCellStyle.setFont(contentFont);

        //设置表内容样式
        //创建单元格，并设置值表头 设置表头居中
        HSSFCellStyle style1 = hssfWorkbook.createCellStyle();
        style1.setBorderBottom(BorderStyle.THIN);
        style1.setBorderLeft(BorderStyle.THIN);
        style1.setBorderRight(BorderStyle.THIN);
        style1.setBorderTop(BorderStyle.THIN);
        style1.setFont(contentFont);

        //产生标题行
        HSSFRow hssfRow = hssfSheet.createRow(0);
        hssfRow.setHeightInPoints(35);
        HSSFCell cell = hssfRow.createCell(0);
        cell.setCellValue(title);
        cell.setCellStyle(style);



        //产生表头
        HSSFRow row1 = hssfSheet.createRow(1);
        row1.setHeightInPoints(25);
        for (int i = 0; i < headers.length; i++) {
            HSSFCell hssfCell = row1.createCell(i);
            hssfCell.setCellValue(headers[i]);
            hssfCell.setCellStyle(hssfCellStyle);
        }

        //创建内容
        for (int i = 0; i <values.length; i++){
            row1 = hssfSheet.createRow(i +2);
            row1.setHeightInPoints(25);
            for (int j = 0; j < values[i].length; j++){
                //将内容按顺序赋给对应列对象
                HSSFCell hssfCell = row1.createCell(j);
                hssfCell.setCellValue(values[i][j]);
                hssfCell.setCellStyle(style1);
            }
        }

        for (int k = 0; k < headers.length; k++) {
            hssfSheet.autoSizeColumn(k);
        }

        setSizeColumn(hssfSheet, headers.length);

        return hssfWorkbook;
    }

    // 自适应宽度(中文支持)
    private static void setSizeColumn(HSSFSheet sheet, int size) {
        for (int columnNum = 0; columnNum < size; columnNum++) {
            int columnWidth = sheet.getColumnWidth(columnNum) / 256;
            for (int rowNum = 0; rowNum < sheet.getLastRowNum(); rowNum++) {
                HSSFRow currentRow;
                //当前行未被使用过
                if (sheet.getRow(rowNum) == null) {
                    currentRow = sheet.createRow(rowNum);
                } else {
                    currentRow = sheet.getRow(rowNum);
                }

                if (currentRow.getCell(columnNum) != null) {
                    HSSFCell currentCell = currentRow.getCell(columnNum);
                    if (currentCell.getCellTypeEnum() == CellType.STRING) {
                        int length = currentCell.getStringCellValue().getBytes().length;
                        if (columnWidth < length) {
                            columnWidth = length;
                        }
                    }
                }
            }
            sheet.setColumnWidth(columnNum, columnWidth * 256+500);
        }
    }

}
