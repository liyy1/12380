package com.domor.service;

import com.domor.dao.IndexDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class IndexService {

	@Autowired
	private IndexDao dao;

	public void savePwd(Map<String, Object> params) {
		dao.savePwd(params);
	}

}
