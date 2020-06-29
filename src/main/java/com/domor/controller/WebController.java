package com.domor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
public class WebController {

	@RequestMapping("/")
    public String index() {
        return "forward:/index";
    }
	
	@RequestMapping("/index")
	public String index(Model model) {
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
	public String regulations(Model model) {
		return "/web/regulations";
	}
	@RequestMapping("/reg_detial")
	public String reg_detial(Model model) {
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
