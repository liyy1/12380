package com.domor.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.domor.model.Menu;

@Mapper
public interface SystemDao {

	Map<String, Object> getUser(String username);

	List<Menu> getMenusByUser(String username);
	
	List<Map<Object, Object>> getButtonAuth(Map<String, Object> params);

	List<Map<Object, Object>> getAllActions();

	List<Map<Object, Object>> getActionsByUser(String username);

}