package com.domor.controller;

import com.domor.service.IndexService;
import com.domor.common.MyException;
import com.domor.model.Result;
import com.domor.utils.DigestUtil;
import com.domor.utils.MapUtils;
import com.domor.utils.ParamUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping("admin/index")
public class IndexController {

	@Autowired
	private IndexService service;

	@RequestMapping("/home")
	public String home(HttpServletRequest request) {
		return "/index/home";
	}

	@RequestMapping("/editPwd")
	public String editPwd(HttpServletRequest request) {
		return "/admin/index/password";
	}

	@ResponseBody
	@RequestMapping("/savePwd")
	public Object savePwd(HttpServletRequest request) {
		Map<String, Object> user = (Map<String, Object>) request.getSession().getAttribute("user");
		Map<String,Object> params = ParamUtils.getParameterMap(request);
		String md5pwd = DigestUtil.md5(MapUtils.getStringValue(params, "oldpwd"));
		String passwrod = MapUtils.getStringValue(user, "password");
		String username = MapUtils.getStringValue(user, "username");

		if(md5pwd!=null && md5pwd.equals(passwrod)) {
			String md5npwd = DigestUtil.md5(MapUtils.getStringValue(params, "newpwd"));
			params.put("username", username);
			params.put("password", md5npwd);
			service.savePwd(params);
		}else {
			throw new MyException("原始密码输入错误！");
		}
		return Result.success();
	}

}
