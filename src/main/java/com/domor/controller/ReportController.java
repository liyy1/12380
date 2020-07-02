package com.domor.controller;

import com.alibaba.fastjson.JSON;
import com.domor.model.PagerReturns;
import com.domor.model.Report;
import com.domor.model.Result;
import com.domor.service.ReportService;
import com.domor.utils.MapUtils;
import com.domor.utils.ParamUtils;
import com.github.pagehelper.Page;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping()
public class ReportController {

	@Autowired
	private ReportService service;

	@RequestMapping("/admin/report1")
	public String report1(Model model) {
		model.addAttribute("reportType", 1);
		return "/admin/report/index";
	}

	@RequestMapping("/admin/report2")
	public String report2(Model model) {
		model.addAttribute("reportType", 2);
		return "/admin/report/index";
	}

	@RequestMapping("/admin/report/detail")
	public String detail(Model model, int id) {
		model.addAttribute("report", service.selectById(id));
		return "/admin/report/detail";
	}

	@ResponseBody
	@RequestMapping("/admin/report/list")
	public Object list(HttpServletRequest request) {
		Map<String, Object> params = ParamUtils.getParameterMap(request);
		Page page = ParamUtils.startPage(params);
		List<Report> reports = service.selectList(params);
		return new PagerReturns(reports, page.getTotal());
	}

	@ResponseBody
	@RequestMapping("/report/save")
	public Object save(Report report) {
		service.insert(report);
		return Result.success();
	}

	@RequestMapping("/admin/report/excel")
	public String excel(String params, HttpServletResponse response) {
		try {
			Map map =  JSON.parseObject(params,Map.class);
			int type = MapUtils.getIntValue(map, "type");
			String title = type == 1 ? "个人" : "单位";
			String filename = type == 1 ? "report1.xlsx" : "report2.xlsx";
			InputStream inp = new ClassPathResource("/excel/"+filename).getInputStream();
			Workbook wb = WorkbookFactory.create(inp);
			//获取sheet1
			Sheet sheet = wb.getSheetAt(0);
			// 填写数据
			List<Report> reports = service.selectList(map);
			writeDefine(sheet, wb, reports, type);
			// 导出文件名称
			String exportFileName = title + "投诉记录.xlsx";
			OutputStream outputStream = response.getOutputStream();
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(exportFileName, "utf-8"));

			wb.write(outputStream);
			outputStream.flush();
			outputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 向导出的 Excel 文件中填写数据
	 */
	private void writeDefine(Sheet sheet, Workbook wb,List<Report> list, int type) {
		// 获取需要导出的数据
		//设置表格的样式
		XSSFCellStyle cellStyle = (XSSFCellStyle) wb.createCellStyle();
		cellStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		cellStyle.setAlignment(HorizontalAlignment.CENTER);
		cellStyle.setBorderBottom(BorderStyle.THIN);
		cellStyle.setBorderTop(BorderStyle.THIN);
		cellStyle.setBorderRight(BorderStyle.THIN);
		cellStyle.setBorderLeft(BorderStyle.THIN);
		Font font = wb.createFont();
		font.setFontName("宋体");//字体类型
		font.setFontHeightInPoints((short)11);
		cellStyle.setFont(font);
		for (int i = 0; i < list.size(); i++) {
			Report r = list.get(i);
			Row row = sheet.createRow(i + 3);
			row.setHeight((short)520);
			// 内容
			Cell cell1 = row.createCell(0);
			cell1.setCellStyle(cellStyle);
			cell1.setCellValue(r.getCreatetime());
			Cell cell2 = row.createCell(1);
			cell2.setCellStyle(cellStyle);
			cell2.setCellValue(r.getJbrname());
			Cell cell3 = row.createCell(2);
			cell3.setCellStyle(cellStyle);
			cell3.setCellValue(r.getJbrsex());
			Cell cell6 = row.createCell(3);
			cell6.setCellStyle(cellStyle);
			cell6.setCellValue(r.getJbrarea());
			Cell cell7 = row.createCell(4);
			cell7.setCellStyle(cellStyle);
			cell7.setCellValue(r.getJbrunit());
			Cell cell8 = row.createCell(5);
			cell8.setCellStyle(cellStyle);
			cell8.setCellValue(r.getJbrid());
			Cell cell9 = row.createCell(6);
			cell9.setCellStyle(cellStyle);
			cell9.setCellValue(r.getJbraddr());
			Cell cell10 = row.createCell(7);
			cell10.setCellStyle(cellStyle);
			cell10.setCellValue(r.getJbrphone());
			if (type == 1) {
				Cell cell11 = row.createCell(8);
				cell11.setCellStyle(cellStyle);
				cell11.setCellValue(r.getBjbname());
				Cell cell12 = row.createCell(9);
				cell12.setCellStyle(cellStyle);
				cell12.setCellValue(r.getBjbsex());
				Cell cell13 = row.createCell(10);
				cell13.setCellStyle(cellStyle);
				cell13.setCellValue(r.getBjbarea());
				Cell cell14 = row.createCell(11);
				cell14.setCellStyle(cellStyle);
				cell14.setCellValue(r.getBjbunit());
				Cell cell15 = row.createCell(12);
				cell15.setCellStyle(cellStyle);
				cell15.setCellValue(r.getBjbduty());
				Cell cell16 = row.createCell(13);
				cell16.setCellStyle(cellStyle);
				cell16.setCellValue(r.getBjblevel());
				Cell cell17 = row.createCell(14);
				cell17.setCellStyle(cellStyle);
				cell17.setCellValue(r.getBjbtype());
				Cell cell18 = row.createCell(15);
				cell18.setCellStyle(cellStyle);
				cell18.setCellValue(r.getBjbmemo());
			} else {
				Cell cell13 = row.createCell(8);
				cell13.setCellStyle(cellStyle);
				cell13.setCellValue(r.getBjbarea());
				Cell cell14 = row.createCell(9);
				cell14.setCellStyle(cellStyle);
				cell14.setCellValue(r.getBjbunit());
				Cell cell16 = row.createCell(10);
				cell16.setCellStyle(cellStyle);
				cell16.setCellValue(r.getBjblevel());
				Cell cell17 = row.createCell(11);
				cell17.setCellStyle(cellStyle);
				cell17.setCellValue(r.getBjbtype());
				Cell cell18 = row.createCell(12);
				cell18.setCellStyle(cellStyle);
				cell18.setCellValue(r.getBjbmemo());
			}
		}

	}

}
