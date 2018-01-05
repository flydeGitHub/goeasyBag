package cn.xcdm.adminBag.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.xcdm.adminBag.po.Admin;

@Controller
public class IndexController {

	@RequestMapping("/")
	public String showIndex(HttpServletRequest request){ 
	 
		HttpSession session=request.getSession();
		if(session.getAttribute("admin")==null)
		{
			return "login";
		}
		else return "index";
			
		
	}
	
 	@RequestMapping("/{page}")
	public String showPage(@PathVariable String page){
		return page;
	}   
}
