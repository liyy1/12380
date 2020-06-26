package com.domor.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.domor.dao.DictDao;
import com.domor.dao.UserDao;
import com.domor.model.PagerReturns;
import com.domor.utils.DigestUtil;
import com.domor.utils.ParamUtils;
import com.github.pagehelper.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

	@Autowired
	private UserDao dao;
	@Autowired
	private DictDao dictDao;

	public PagerReturns query(Map<String,Object> params){
		Page page = ParamUtils.startPage(params);
		List<Map<String, Object>> users = dao.query(params);
        return new PagerReturns(users, page.getTotal());
	}

	public Map<String,Object> getByName(String username) {
		return dao.getByName(username);
	}

	public void insert(Map<String,Object> user) {
		user.put("password", DigestUtil.md5(dictDao.getByKey("password")));
		dao.insert(user);		
	}
	
	public void update(Map<String,Object> user) {
		dao.update(user);
	}
	
	public int delete(Map<String,Object> user) {
		return dao.delete(user);
	}
	
	public void initUserPwd(String username) {
		Map<String, Object> params = new HashMap<>();
		params.put("username", username);
		params.put("password", DigestUtil.md5(dictDao.getByKey("password")));
		dao.initUserPwd(params);
	}
	
}
