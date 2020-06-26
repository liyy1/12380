package com.domor.service;

import com.domor.dao.ReportDao;
import com.domor.model.PagerReturns;
import com.domor.model.Report;
import com.domor.utils.ParamUtils;
import com.github.pagehelper.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ReportService {

	@Autowired
	private ReportDao dao;

	public int insert(Report record){
		return dao.insert(record);
	}

	public List<Report> selectList(Map<String, Object> params){
		return dao.selectList(params);
	}

	public Report selectById(Integer id){
		return dao.selectById(id);
	}

}
