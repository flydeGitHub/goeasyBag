package cn.xcdm.adminBag.controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.xcdm.adminBag.po.Coupon;
import cn.xcdm.adminBag.service.CouponService;
import cn.xcdm.adminBag.util.TimeUtil;
import cn.xcdm.adminBag.vo.EasyUIDataGridResult;
import cn.xcdm.adminBag.vo.Pager;

@Controller
public class CouponController {
	@Autowired
	private CouponService couponService;

	@RequestMapping(value = "/couponList", method = RequestMethod.POST)
	@ResponseBody
	public EasyUIDataGridResult couponList(Pager pager) {
		// System.out.println("进入表格json的");
		return couponService.showAllCoupon(pager);
	}

	@RequestMapping(value = "/addcoupon", method = RequestMethod.POST)
	@ResponseBody
	public String addcoupon(HttpServletRequest request, HttpServletResponse response) throws ParseException {
		/* 获取参数 */
		String name = request.getParameter("name").trim();
		String rule = request.getParameter("rule").trim();
		String soule = request.getParameter("soule").trim();
		String status = request.getParameter("status");
		System.out.println(request.getParameter("start_time"));
		String start_time = TimeUtil.changeToUnix(request.getParameter("start_time"));
		String end_time = TimeUtil.changeToUnix(request.getParameter("end_time"));

		// String start_time=request.getParameter("start_time");
		System.out.println(start_time);
		// String end_time=request.getParameter("end_time");

		Coupon coupon = new Coupon();
		coupon.setEnd_time(end_time);
		coupon.setName(name);
		coupon.setRule(rule);
		coupon.setSoule(soule);
		coupon.setStart_time(start_time);
		coupon.setStatus(status);
		//Map<String, Object> map = new HashMap<String, Object>();
		//map.put("coupon", coupon);
		//couponService.addCoupon(coupon);
		// return "success";

		try {
			couponService.addCoupon(coupon);
			return "success";
		} catch (Exception e) { // TODO: handle exception 

			return "failed";
		}
	}

}
