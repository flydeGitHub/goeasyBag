package cn.xcdm.adminBag.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.xcdm.adminBag.service.OrderService;
import cn.xcdm.adminBag.vo.EasyUIDataGridResult;
import cn.xcdm.adminBag.vo.Pager;

@Controller
public class OrderController {
@Autowired 
private OrderService orderService;

	@RequestMapping(value = "/orderList", method = RequestMethod.POST)
	@ResponseBody
	public EasyUIDataGridResult orderList(Pager pager) {
	//	System.out.println("进入表格json的");
		return orderService.orderList(pager);
	}  
}
