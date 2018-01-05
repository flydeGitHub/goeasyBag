package cn.xcdm.adminBag.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class TestController {
/**
 * 首页
 * @return
 */
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public ModelAndView index(){
	ModelAndView m=	new ModelAndView("index");
		return m;
	}
}
