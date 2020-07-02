package com.domor.service;

import com.domor.dao.LawDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class LawService {

    @Autowired
    private LawDao dao;

    public int count(Map<String, Object> params) {
        return dao.count(params);
    }

    public List<Map<String, Object>> query(Map<String, Object> params) {
        return dao.query(params);
    }

    public Map<String, Object> getById(int id) {
        return dao.getById(id);
    }

    public void insert(Map<String, Object> params) {
        dao.insert(params);
    }

    public void update(Map<String, Object> params) {
        dao.update(params);
    }

    public void delete(Map<String, Object> params) {
        dao.delete(params);
    }

}
