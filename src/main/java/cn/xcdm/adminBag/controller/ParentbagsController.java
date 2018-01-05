package cn.xcdm.adminBag.controller;

import java.math.BigDecimal;
import java.text.ParseException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.xcdm.adminBag.po.Parentbags;
import cn.xcdm.adminBag.service.ParentbagsService;
import cn.xcdm.adminBag.vo.EasyUIDataGridResult;
import cn.xcdm.adminBag.vo.Pager;

@Controller
public class ParentbagsController {
	@Autowired
	private ParentbagsService parentbagsService;

	@RequestMapping(value = "/parentbagsList", method = RequestMethod.POST)
	@ResponseBody
	public EasyUIDataGridResult parentbagsList(Pager pager) {
		// System.out.println("进入表格json的");
		return parentbagsService.showAllparentbag(pager);
	}

	/**
	 * 删除某个父柜子
	 * 
	 * @return
	 */
	@RequestMapping(value = "/deleteParent", method = RequestMethod.POST)
	@ResponseBody
	public String deleteParent(String id) {
		System.out.println(id);
		int result = parentbagsService.deleteParent(id);
		if (result > 0) {
			return "success";
		} else {
			return "false";
		}
	}

	/**
	 * 增加父柜子
	 */

	@RequestMapping(value = "/addParentbag", method = RequestMethod.POST)
	@ResponseBody
	public String addParentbag(HttpServletRequest request, HttpServletResponse response) throws ParseException {
		long parentbagsid = Integer.parseInt(request.getParameter("parentbagsid"));
		// 经度
		BigDecimal longitude = new BigDecimal(request.getParameter("longitude"));
		// 纬度
		BigDecimal latitude = new BigDecimal(request.getParameter("latitude"));
		String address = request.getParameter("address").trim();
		String updated = System.currentTimeMillis()/1000+"";
		String created = new Date().getTime()/1000+"";  
		Parentbags parentbags = new Parentbags();
		parentbags.setAddress(address);
		parentbags.setCreated(created);
		parentbags.setLatitude(latitude);
		parentbags.setLongitude(longitude);
		parentbags.setParentbagsid(parentbagsid);
		parentbags.setUpdated(updated); 
		if(parentbagsService.selectpaid(parentbagsid)){
			return "exist";
		}
		else
		{
		try {
			parentbagsService.addParentBag(parentbags);
			return "success";
		} catch (Exception e) {
			// TODO: handle exception
			return "failed";
		}
		}
		
	} 
	/**
	 * 修改柜子 信息 
	 * @param request
	 * @param response
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value = "/editParentbag", method = RequestMethod.POST)
	@ResponseBody
	public String editParentbag(HttpServletRequest request, HttpServletResponse response) throws ParseException {
		long parentbagsid = Integer.parseInt(request.getParameter("parentbagsid"));
		// 经度
		BigDecimal longitude = new BigDecimal(request.getParameter("longitude"));
		// 纬度
		BigDecimal latitude = new BigDecimal(request.getParameter("latitude"));
		String address = request.getParameter("address").trim();
		String updated = System.currentTimeMillis()/1000+"";
		Parentbags parentbags = new Parentbags();
		parentbags.setAddress(address);
		parentbags.setLatitude(latitude);
		parentbags.setLongitude(longitude);
		parentbags.setParentbagsid(parentbagsid);
		parentbags.setUpdated(updated);  
		try {
			parentbagsService.editParentBag(parentbags);
			return "success";
		} catch (Exception e) {
			// TODO: handle exception
			return "failed";
		}
		}
		
 
 
	@RequestMapping(value = "/parentbags", method = RequestMethod.GET) 
	 	public String parentbags(){
		return "parentbags"; 
	}
	/**
	 * 页面跳转  
	 * @param request
	 * @param response
	 * @return
	 */
	
		@RequestMapping(value = "/parentbags-edit", method = RequestMethod.GET) 
	   
		public String  edit(HttpServletRequest request, HttpServletResponse response) 
			{
			long parentbagsid=Long.parseLong( request.getParameter("parentbagsid"));
			System.out.println(parentbagsid);
			 
		Parentbags parentbags=parentbagsService.getParentByid(parentbagsid);
		System.out.println(parentbags.toString());
			HttpSession session=request.getSession();
			session.setAttribute("parentbags", parentbags);
			System.out.println("parentbags-edit");  
			return "parentbags-edit"; 
			} 
}
