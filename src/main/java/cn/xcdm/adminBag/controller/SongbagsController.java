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

import cn.xcdm.adminBag.po.Parentbags;
import cn.xcdm.adminBag.po.Sonbags;
import cn.xcdm.adminBag.service.ParentbagsService;
import cn.xcdm.adminBag.service.SonbagsService;
import cn.xcdm.adminBag.vo.EasyUIDataGridResult;
import cn.xcdm.adminBag.vo.Pager;

@Controller
public class SongbagsController {
@Autowired 
private SonbagsService songbagsService;
@Autowired
private ParentbagsService parentbagsService;


	@RequestMapping(value = "/sonbagList", method = RequestMethod.POST)
	@ResponseBody
	public EasyUIDataGridResult sonbagList(Pager pager,HttpServletRequest request) {
	//	System.out.println("进入表格json的");
		long parentbagsid=Long.parseLong(request.getParameter("parentbagsid"));
	//	System.out.println(parentbagsid); 
	/*String a=	songbagsService.showAllsonbag(pager,parentbagsid).getRows().get(0).toString();
	System.out.println(a);*/
	return songbagsService.showAllsonbag(pager,parentbagsid);
	} 
	@RequestMapping(value = "/sonbags", method = RequestMethod.GET) 
	public  String  sonbag(HttpServletRequest request,HttpServletResponse response){
		 	
		return "sonbags" ;
		
	}
	
	/*
	 * 跳转页面 显示增加页面 
	 */
	@RequestMapping(value = "/sonbagadd", method = RequestMethod.GET) 
	public  String  sonbagadd(HttpServletRequest request,HttpServletResponse response){
		long parentbagsid = Integer.parseInt(request.getParameter("parentbagsid"));
		Parentbags parentbags=parentbagsService.getParentByid(parentbagsid);
		HttpSession session=request.getSession();
		session.setAttribute("parentbags", parentbags);
		return "sonbags-add" ;
		
	}
	
	/**
	 * 增加子柜子
	 */

	@RequestMapping(value = "/addSonbag", method = RequestMethod.POST)
	@ResponseBody
	public String addSonbag(HttpServletRequest request, HttpServletResponse response) throws ParseException {
		long parentbagsid = Integer.parseInt(request.getParameter("parentbagsid"));
	 	long sonbagid=Integer.parseInt(request.getParameter("sonbagid"));
		String address = request.getParameter("address").trim();
		String updated = System.currentTimeMillis()/1000+"";
		String created = new Date().getTime()/1000+"";  
		String isusered=request.getParameter("isusered");
		String type=request.getParameter("type");
		
		
		Sonbags sonbags=new Sonbags();
		 
		sonbags.setCreated(created);
		sonbags.setUpdated(updated);
		sonbags.setIsusered(isusered);
		 
		sonbags.setSonbagid(sonbagid);
		sonbags.setType(type);
	
		 	if(songbagsService.selectsoid(sonbagid)){
			return "exist";
		}
		else
		{
		try {
			songbagsService.addSonBag(sonbags);
			return "success";
		} catch (Exception e) {
			// TODO: handle exception
			return "failed";
		}
		}
		
	} 
	//	页面跳转  传参  

	@RequestMapping(value = "/sonbags-edit", method = RequestMethod.GET) 
   
	public String  sonbagsedit(HttpServletRequest request, HttpServletResponse response) 
		{
		
		long parentbagsid = Integer.parseInt(request.getParameter("parentbagsid"));
		
		long sonbagid=Long.parseLong( request.getParameter("sonbagid"));
		System.out.println(sonbagid);
		 Sonbags sonbags=songbagsService.getSonbagByid(sonbagid);
		 Parentbags parentbags=parentbagsService.getParentByid(parentbagsid);
			
	 	HttpSession session=request.getSession();
		session.setAttribute("sonbags", sonbags);
		session.setAttribute("parentbags", parentbags);
		
	 	System.out.println("sonbags-edit");  
		return "sonbags-edit"; 
		}  
	
	/**
	 * 修改子柜子  
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value = "/editSonbag", method = RequestMethod.POST)
	@ResponseBody
	public String editSonbag(HttpServletRequest request, HttpServletResponse response) throws ParseException {
		long sonbagid=Long.parseLong( request.getParameter("sonbagid"));
		String isusered=request.getParameter("isusered");
		String type=request.getParameter("type");
		String updated = System.currentTimeMillis()/1000+"";
		
		Sonbags sonbags=new Sonbags();
		sonbags.setSonbagid(sonbagid);
		sonbags.setIsusered(isusered);
		sonbags.setType(type);
		sonbags.setUpdated(updated);
	 
		try {
			songbagsService.editSonBag(sonbags);
			return "success";
		} catch (Exception e) {
			// TODO: handle exception
			return "failed";
		}
		}
		
 
	
}
