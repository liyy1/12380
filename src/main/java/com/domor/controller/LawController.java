package com.domor.controller;

import com.domor.model.PagerReturns;
import com.domor.model.Result;
import com.domor.service.LawService;
import com.domor.utils.MapUtils;
import com.domor.utils.ParamUtils;
import com.github.pagehelper.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping()
public class LawController {

	@Autowired
	private LawService service;

	@RequestMapping(value = "/admin/law", method = RequestMethod.GET)
	public String index() {
		return "/admin/law/index";
	}

	@ResponseBody
	@RequestMapping("/admin/law/query")
	public Object query(HttpServletRequest request) {
		Map<String, Object> params = ParamUtils.getParameterMap(request);
		int total = service.count(params);
		ParamUtils.addSkipCount(params, total);
		List<Map<String, Object>> rows = service.query(params);
		return new PagerReturns(rows, total);
	}

	@RequestMapping(value = "/admin/law/insert", method = RequestMethod.GET)
	public String insertGet() {
		return "/admin/law/add";
	}

	@RequestMapping(value = "/admin/law/update", method = RequestMethod.GET)
	public Object updateGet(Model model, int id) {
		model.addAttribute("law", service.getById(id));
		return "/admin/law/edit";
	}
	@RequestMapping(value = "/admin/law/detail", method = RequestMethod.GET)
	public Object detail(Model model, int id) {
		model.addAttribute("law", service.getById(id));
		return "/admin/law/detail";
	}

	@ResponseBody
	@RequestMapping(value = "/admin/law/save", method = RequestMethod.POST)
	public Object insertPost(HttpServletRequest request) {
		Map<String,Object> params = ParamUtils.getParameterMap(request);
		int id = MapUtils.getIntValue(params, "id");
		if (id == 0) {
			service.insert(params);
		} else {
			service.update(params);
		}
		return Result.success();
	}

	@ResponseBody
	@RequestMapping(value = "/admin/law/delete", method = RequestMethod.POST)
	public Object delete(HttpServletRequest request) {
		Map<String,Object> params = ParamUtils.getParameterMap(request);
		service.delete(params);
		return Result.success();
	}

	/**
	 * 网页接口，获取法规列表
	 * @param params
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/law/list")
	public Object query(Map<String,Object> params){
		Page page = ParamUtils.startPage(params);
		List<Map<String, Object>> list = service.query(params);
		return new PagerReturns(list, page.getTotal());
	}

	/**
	 * 网页接口，获取法规详情
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/law/detail")
	public Object getById(int id){
		return service.getById(id);
	}

}
