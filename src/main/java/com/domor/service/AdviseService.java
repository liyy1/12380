package com.domor.service;

import com.domor.dao.AdviseDao;
import com.domor.model.Advise;
import com.domor.model.PagerReturns;
import com.domor.utils.ParamUtils;
import com.github.pagehelper.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class AdviseService {

	@Autowired
	private AdviseDao dao;

	public int insert(Advise record){
		return dao.insert(record);
	}

	public PagerReturns selectList(Map<String, Object> params){
		Page page = ParamUtils.startPage(params);
		List<Advise> advises = dao.selectList(params);
		return new PagerReturns(advises, page.getTotal());
	}

	public Advise selectById(Integer id){
		return dao.selectById(id);
	}

}
