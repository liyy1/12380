package com.domor.service;

import com.domor.dao.ReportDao;
import com.domor.model.PagerReturns;
import com.domor.model.Report;
import com.domor.utils.ParamUtils;
import com.github.pagehelper.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class ReportService {

	@Autowired
	private ReportDao dao;

	@Transactional
	public int insert(Report record){
		int num=dao.getnum();
		num=num+1;
		String code="";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		Date date = new Date();
		code= sdf.format(date);
		if(num<10){
			code=code+"-00"+num;
		}else if(num<100 && num>=10){
			code=code+"-0"+num;
		}else{
			code=code+"-"+num;
		}
		record.setCode(code);
		return dao.insert(record);
	}

	public List<Report> selectList(Map<String, Object> params){
		return dao.selectList(params);
	}

	public Report selectById(Integer id){
		return dao.selectById(id);
	}


	public Map<String, Object> getReportById(int id){
		return dao.getReportById(id);
	}
}
