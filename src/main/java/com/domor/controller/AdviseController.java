package com.domor.controller;

import com.alibaba.fastjson.JSON;
import com.domor.model.Advise;
import com.domor.model.PagerReturns;
import com.domor.model.Result;
import com.domor.service.AdviseService;
import com.domor.utils.DateUtils;
import com.domor.utils.MapUtils;
import com.domor.utils.ParamUtils;
import com.github.pagehelper.Page;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping()
public class AdviseController {

	@Autowired
	private AdviseService service;

	@RequestMapping("/admin/advise")
	public String index() {
		return "/admin/advise/index";
	}

	@RequestMapping("/admin/advise/detail")
	public String detail(Model model, int id) {
		model.addAttribute("advise", service.selectById(id));
		return "/admin/advise/detail";
	}

	@ResponseBody
	@RequestMapping("/admin/advise/list")
	public Object list(HttpServletRequest request) {
		Map<String, Object> params = ParamUtils.getParameterMap(request);
		Page page = ParamUtils.startPage(params);
		List<Advise> advises = service.selectList(params);
		return new PagerReturns(advises, page.getTotal());
	}

	@ResponseBody
	@RequestMapping("/advise/save")
	public Object save(Advise advise) {
		service.insert(advise);
		return Result.success();
	}

	@RequestMapping("/admin/advise/excel")
	public String excel(String params, HttpServletResponse response) {
		try {
			Map map =  JSON.parseObject(params,Map.class);
			InputStream inp = new ClassPathResource("/excel/advise.xlsx").getInputStream();
			Workbook wb = WorkbookFactory.create(inp);
			//获取sheet1
			Sheet sheet = wb.getSheetAt(0);
			// 填写数据
			List<Advise> advises = service.selectList(map);
			writeDefine(sheet, wb, advises);
			// 导出文件名称
			String exportFileName = "意见建议记录.xlsx";
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
	private void writeDefine(Sheet sheet, Workbook wb,List<Advise> list) {
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
			Advise r = list.get(i);
			Row row = sheet.createRow(i + 2);
			row.setHeight((short)520);
			// 内容
			Cell cell1 = row.createCell(0);
			cell1.setCellStyle(cellStyle);
			cell1.setCellValue(r.getName());
			Cell cell2 = row.createCell(1);
			cell2.setCellStyle(cellStyle);
			cell2.setCellValue(r.getPhone());
			Cell cell3 = row.createCell(2);
			cell3.setCellStyle(cellStyle);
			cell3.setCellValue(r.getContent());
			Cell cell7 = row.createCell(3);
			cell7.setCellStyle(cellStyle);
			Date date = r.getCreatetime();
			cell7.setCellValue(DateUtils.formatDate(date, DateUtils.DATE_FROMAT1));
		}

	}

}
