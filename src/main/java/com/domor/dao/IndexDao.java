package com.domor.dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface IndexDao {

	void savePwd(Map<String, Object> parmas);

}