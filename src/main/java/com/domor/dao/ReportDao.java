package com.domor.dao;

import com.domor.model.Report;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ReportDao {

    int insert(Report record);

    Report selectById(Integer id);

    List<Report> selectList(Map<String, Object> param);

}