package com.domor.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.domor.dao.SystemDao;
import com.domor.model.Menu;
import com.domor.utils.StringUtils;

@Service
public class SystemService {

	@Autowired
	private SystemDao dao;

	public Map<String, Object> getUser(String username) {
		return dao.getUser(username);
	}

	public List<Menu> getMenusByUser(String username) {
	    List<Menu> menus = dao.getMenusByUser(username);
	    List<Menu> menuList = new ArrayList<Menu>();
	    // 先找到所有的一级菜单
	    for(Menu menu:menus) {
	    	if(menu.getParentId()==0) {
	    		menuList.add(menu);
	    	}
	    }
	    // 为一级菜单设置子菜单，getChild是递归调用的
	    for (Menu menu : menuList) {
	        menu.setChildren(getChild(menu.getMenuId(), menus));
	    }
		return menuList;
	}
	/**
	 * 递归查找子菜单
	 * @param id 当前菜单id
	 * @param rootMenu 要查找的列表
	 * @return
	 */
	private List<Menu> getChild(int id, List<Menu> menus) {
	    List<Menu> childList = new ArrayList<>();
	    for (Menu menu : menus) {
	        // 遍历所有节点，将父菜单id与传过来的id比较
            if (menu.getParentId().equals(id)) {
                childList.add(menu);
            }
	    }
	    // 把子菜单的子菜单再循环一遍
	    for (Menu menu : childList) {// 没有url子菜单还有子菜单
	        if (StringUtils.isEmpty(menu.getMenuUrl())) {
	            menu.setChildren(getChild(menu.getMenuId(), menus));
	        }
	    } // 递归退出条件
	    if (childList.size() == 0)
	        return null;
	    return childList;
	}
	
	public List<Map<Object, Object>> getButtonAuth(Map<String, Object> params) {
		return dao.getButtonAuth(params);
	}

	public List<Map<Object, Object>> getActionsByUser(String username) {
		return dao.getActionsByUser(username);
	}

}
