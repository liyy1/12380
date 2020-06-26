package com.domor.dao;

import com.domor.model.Advise;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface AdviseDao {

    int insert(Advise record);

    List<Advise> selectList(Map<String, Object> params);

    Advise selectById(Integer id);

}