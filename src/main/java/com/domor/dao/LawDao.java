package com.domor.dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface LawDao {

    Map<String, Object> getById(int id);

    int count(Map<String, Object> params);

    List<Map<String, Object>> query(Map<String, Object> params);

    void insert(Map<String, Object> params);

    void update(Map<String, Object> params);

    void delete(Map<String, Object> params);

}
