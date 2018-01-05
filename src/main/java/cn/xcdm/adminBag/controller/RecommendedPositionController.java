package cn.xcdm.adminBag.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.xcdm.adminBag.service.RecommendedPositionService;
import cn.xcdm.adminBag.vo.EasyUIDataGridResult;
import cn.xcdm.adminBag.vo.Pager;

@Controller
public class RecommendedPositionController {

	@Autowired
	private RecommendedPositionService recommendedPositionService;
	
 	@RequestMapping(value = "/position", method = RequestMethod.GET) 
	public String position() { 
 		System.out.println("sadmfejrghqerighqeihgih");
		return "position";
	}  
 
	
	@RequestMapping(value = "/positionList", method = RequestMethod.POST)
	@ResponseBody
	public EasyUIDataGridResult positionList(Pager pager,HttpServletRequest request) {
	//	System.out.println("进入表格json的");
 	String phone=request.getParameter("phone");
		 System.out.println("adnfkjafejfoogeihg'+positionList"+phone);
		return recommendedPositionService.showAllPosition(pager);
	}  
}
