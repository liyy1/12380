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


}
