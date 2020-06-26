package com.domor.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserDao {

	int insert(Map<String,Object> user);
	int update(Map<String,Object> user);		
	int delete(Map<String,Object> user);
	
	Map<String,Object> getByName(String username);
	List<Map<String,Object>> query(Map<String, Object> params);

	void initUserPwd(Map<String, Object> params);

}
