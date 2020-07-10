package com.domor.controller;

import com.domor.service.LawService;
import com.domor.utils.ParamUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class WebController {
	@Autowired
	private LawService service;

	@RequestMapping("/")
    public String index() {
        return "forward:/index";
    }
	
	@RequestMapping("/index")
	public String index(Model model) {
		model.addAttribute("data", service.queryLawIndex());
		return "/web/index";
	}

	@RequestMapping("/report")
	public String report(Model model) {
		return "/web/report";
	}
	@RequestMapping("/handle")
	public String handle(Model model) {
		return "/web/handle";
	}
	@RequestMapping("/contact_us")
	public String contact_us(Model model) {
		return "/web/contact_us";
	}
	@RequestMapping("/regulations")
	public ModelAndView regulations(Model model) {
		List<Map<String, Object>> rows = service.queryList();
		ModelAndView mav=new ModelAndView();
		mav.addObject("data",rows);
		mav.setViewName("/web/regulations");
		return mav;
	}
	@RequestMapping("/reg_detial")
	public String reg_detial(Model model,int id) {
		model.addAttribute("law", service.getById(id));
		return "/web/reg_detial";
	}
	@RequestMapping("/jb_company")
	public String jb_company(Model model) {
		return "/web/jb_company";
	}
	@RequestMapping("/jb_person")
	public String jb_person(Model model) {
		return "/web/jb_person";
	}

}
