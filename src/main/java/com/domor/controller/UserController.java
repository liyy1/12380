package com.domor.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.domor.model.Result;
import com.domor.utils.MapUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.domor.service.UserService;
import com.domor.utils.ParamUtils;

@Controller
@RequestMapping("admin/user")
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping("/index")
	public String index(HttpServletRequest request) {
		return "/admin/user/user";
	}

    @ResponseBody
    @RequestMapping("/query")
    public Object query(HttpServletRequest request) {
        Map<String, Object> params = ParamUtils.getParameterMap(request);
        return userService.query(params);
    }
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public ModelAndView insertGet(HttpServletRequest request) {
		return new ModelAndView("/admin/user/user_add");
	}
	
	@ResponseBody
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public Object insertPost(HttpServletRequest request) {
		Map<String,Object> user = ParamUtils.getParameterMap(request);
		String username = MapUtils.getStringValue(user, "username");
		Map<String, Object> u = userService.getByName(username);
		if(u==null || u.isEmpty()){
			userService.insert(user);
		}else {
			return Result.error("帐号[" +username+"]已存在！");
		}
        return Result.success();
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public Object updateGet(HttpServletRequest request) {
		String username = ParamUtils.getStringParameter(request, "username");
		Map<String,Object> user = userService.getByName(username);
		return new ModelAndView("/admin/user/user_edit", "user", user);
	}
	
	@ResponseBody
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public Object updatePost(HttpServletRequest request) {
		Map<String,Object> user = ParamUtils.getParameterMap(request);
		userService.update(user);
        return Result.success();
	}

	@ResponseBody
	@RequestMapping("/user_initPwd")
	public Object user_initPwd(String username) {
		userService.initUserPwd(username);
		return Result.success();
	}

}
