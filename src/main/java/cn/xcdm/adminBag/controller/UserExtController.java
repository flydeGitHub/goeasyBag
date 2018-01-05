package cn.xcdm.adminBag.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.xcdm.adminBag.service.AccountService;
import cn.xcdm.adminBag.service.UserExtService;
import cn.xcdm.adminBag.vo.EasyUIDataGridResult;
import cn.xcdm.adminBag.vo.Pager;

@Controller
public class UserExtController {

	@Autowired
	private UserExtService userExtService;
	@ResponseBody
	@RequestMapping(value = "/userExtList") 
	public EasyUIDataGridResult userExtList(Pager pager) {
		//查询所有用户余额信息 
		return userExtService.userExtList(pager); 
	}
}
