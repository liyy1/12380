package com.domor.controller;

import com.domor.model.Advise;
import com.domor.model.Result;
import com.domor.service.AdviseService;
import com.domor.utils.ParamUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping()
public class AdviseController {

	@Autowired
	private AdviseService service;

	@RequestMapping("/admin/advise")
	public String index() {
		return "/admin/advise/index";
	}

	@RequestMapping("/admin/advise/detail")
	public String detail(Model model, int id) {
		model.addAttribute("advise", service.selectById(id));
		return "/admin/advise/detail";
	}

	@ResponseBody
	@RequestMapping("/admin/advise/list")
	public Object list(HttpServletRequest request) {
		Map<String, Object> params = ParamUtils.getParameterMap(request);
		return service.selectList(params);
	}

	@ResponseBody
	@RequestMapping("/advise/save")
	public Object save(Advise advise) {
		service.insert(advise);
		return Result.success();
	}

}
