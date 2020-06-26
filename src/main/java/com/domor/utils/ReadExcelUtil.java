package com.domor.utils;

import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.regex.Pattern;

import com.domor.common.MyException;
import org.apache.commons.io.IOUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
 
public class ReadExcelUtil {
	
    private static final DecimalFormat DECIMAL_FORMAT = new DecimalFormat("0");// 格式化 number为整
	
	private static final DecimalFormat DECIMAL_FORMAT_PERCENT = new DecimalFormat("##.00%");//格式化分比格式，后面不足2位的用0补齐
	
	private static final Pattern POINTS_PATTERN = Pattern.compile("0.0+_*[^/s]+"); //小数匹配
	
	/**
	 * 对外提供读取excel 的方法
	 * @param file
	 * @return
	 * @throws IOException
	 */
	public static List<Map<String,Object>> readExcel(MultipartFile file) throws Exception {
		String extension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1).toLowerCase();
		if(Objects.equals("xls", extension) || Objects.equals("xlsx", extension)) {
			return readExcel(file.getInputStream());
		} else {
			throw new MyException("不支持的文件类型");
		}
	}
	
	/**
	 * 读取 office excel
	 * @param inputStream
	 * @return
	 * @throws IOException
	 */
	private static List<Map<String,Object>> readExcel(InputStream inputStream) throws IOException {
		List<Map<String,Object>> list = new LinkedList<>();
		Workbook workbook = null;
		try {
			workbook = WorkbookFactory.create(inputStream);
			Sheet sheet = workbook.getSheetAt(0);
			for (int i = 1; i <= sheet.getLastRowNum(); i++) { // 从第二行开始读取
				Row row = sheet.getRow(i);
				if (StringUtils.isEmpty(row)) {
					continue;
				}
				Map<String, Object> data = new HashMap<>();
				for (int j = 0; j <= row.getLastCellNum(); j++) {
					Object value = getCellValue(row.getCell(j));
					if (value!=null && !value.equals(""))
						data.put(""+j, getCellValue(row.getCell(j)));
				}
				if (!data.isEmpty())
					list.add(data);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			IOUtils.closeQuietly(workbook);
			IOUtils.closeQuietly(inputStream);
		}
		return list;
	}
 
	/**
	 * 获取excel 单元格数据
	 * @param cell
	 * @return
	 */
	private static Object getCellValue(Cell cell) {
		if (StringUtils.isEmpty(cell))
			return null;

		Object value = null;
		switch (cell.getCellTypeEnum()) {
		case _NONE:
			break;
		case STRING:
			value = cell.getStringCellValue().trim();
			break;
		case NUMERIC:
			if(DateUtil.isCellDateFormatted(cell)){ //日期
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:sss");
				value = sdf.format(DateUtil.getJavaDate(cell.getNumericCellValue()));
			} else if("@".equals(cell.getCellStyle().getDataFormatString())
					|| "General".equals(cell.getCellStyle().getDataFormatString()) 
					|| "0_ ".equals(cell.getCellStyle().getDataFormatString())){
				//文本  or 常规 or 整型数值
				value = DECIMAL_FORMAT.format(cell.getNumericCellValue());
			} else if(POINTS_PATTERN.matcher(cell.getCellStyle().getDataFormatString()).matches()){ //正则匹配小数类型	
				value = cell.getNumericCellValue();  //直接显示
			} else if("0.00E+00".equals(cell.getCellStyle().getDataFormatString())){//科学计数
				value = cell.getNumericCellValue();	//待完善		 	
			} else if("0.00%".equals(cell.getCellStyle().getDataFormatString())){//百分比
				value = cell.getNumericCellValue(); //待完善
				value = DECIMAL_FORMAT_PERCENT.format(value);
			} else if("# ?/?".equals(cell.getCellStyle().getDataFormatString())){//分数
				value = cell.getNumericCellValue(); ////待完善
			} else { //货币		
				value = cell.getNumericCellValue();
				value = DecimalFormat.getCurrencyInstance().format(value);
			}
			break;
		case BOOLEAN:
			value = cell.getBooleanCellValue();
			break;
		case BLANK:
			//value = ",";
			break;
		default:
			value = cell.toString().trim();
		}
		return value;
	}
}