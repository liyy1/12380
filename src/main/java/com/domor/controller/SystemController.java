package com.domor.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.domor.service.DictService;
import com.domor.common.MyException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.domor.service.SystemService;
import com.domor.model.Menu;
import com.domor.model.Result;
import com.domor.utils.DigestUtil;
import com.domor.utils.MapUtils;
import com.domor.utils.ParamUtils;

@Controller
@RequestMapping("admin")
public class SystemController {

	@Autowired
	private SystemService service;
	@Autowired
	private DictService dictService;
	
	@RequestMapping("/")
    public String index() {
        return "forward:/admin/index";
    }
	
	@RequestMapping("/index")
	public String index(Model model, HttpSession session) {
		Map<Object, Object> user = (Map<Object, Object>) session.getAttribute("user");
		List<Menu> menus = service.getMenusByUser(user.get("username").toString());
		model.addAttribute("menus", menus);
		model.addAttribute("user", user);
		model.addAttribute("web_url",dictService.getByKey("web_url"));
		return "/admin/index";
	}
	
    @RequestMapping(value = "/toLogin",method = RequestMethod.GET)
    public String login_view(){
        return "/admin/login";
    }

    @ResponseBody
	@RequestMapping(value = "/login")
	public Object login(HttpServletRequest request,String username,String password) {
		String md5pwd = DigestUtil.md5(password);
		Map<String, Object> user = service.getUser(username);
		if (user == null || user.isEmpty()) {
			throw new MyException("手机号或用户名不存在！");
		} else if(!MapUtils.getStringValue(user, "password").equals(md5pwd)){
			throw new MyException("密码错误!");
		} else {
			request.getSession().setAttribute("user", user);
		}
		return Result.success();
	}
    
    @RequestMapping("/exit")
	public String exit(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:/admin/toLogin";
	}
    
	@ResponseBody
	@RequestMapping("/getActionsByUser")
	public Object getActionsByUser(HttpSession session) {
		Map<Object, Object> user = (Map<Object, Object>) session.getAttribute("user");
		return service.getActionsByUser(user.get("username").toString());
	}
	
	@ResponseBody
	@RequestMapping("/getButtonAuth")
	public Object getButtonAuth(HttpServletRequest request) {
		Map<String, Object> params = ParamUtils.getParameterMap(request);
		return service.getButtonAuth(params);
	}

}
