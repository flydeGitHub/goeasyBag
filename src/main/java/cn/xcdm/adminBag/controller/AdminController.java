package cn.xcdm.adminBag.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.xcdm.adminBag.po.Admin;
import cn.xcdm.adminBag.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;

	/**
	 * 登录页面
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}

	@RequestMapping(value = "login_check", method = RequestMethod.POST)
	@ResponseBody
	public String login_check(HttpServletRequest request, HttpServletResponse response) {
		String username = request.getParameter("username");
		Admin admin = new Admin();
		admin = adminService.selectAdminByName(username);
		if (admin == null) {
			// 没有此用户
			return "error";
		} else {
			return "success";
		}
	}

	/**
	 * ajax登录
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/do_login", method = RequestMethod.POST)
	@ResponseBody
	public String login(HttpServletRequest request, HttpServletResponse response) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		// 验证身份信息
		if (adminService.login(username, password)) {
			// 登录验证信息成功就返回ajax
			HttpSession session = request.getSession();
			// 清除上一次的
			// session.removeAttribute("admin");
			Admin admin = new Admin();
			admin = adminService.selectAdminByName(username);
			session.removeAttribute("admin");
			session.setAttribute("admin", admin);
			return "success";
		} else {
			return "error";
		}

	}

	/**
	 * 退出登录
	 * 
	 * @param request
	 * @param response
	 * @return
	 */

	@RequestMapping(value = "/loginout", method = RequestMethod.POST)
	@ResponseBody
	public String loginout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.removeAttribute("admin");
		return "success";
	}

	/**
	 * 修改密码
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/editpassword", method = RequestMethod.POST)
	@ResponseBody
	public String editpassword(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("进入进入contr");
		HttpSession session = request.getSession();
		Admin admin = new Admin();
		admin = (Admin) session.getAttribute("admin");
		System.out.println(admin.toString());

		String username = admin.getAdminname();

		String newpass = request.getParameter("newpass");
		System.out.println(newpass);
		try {
			adminService.changepwd(username, newpass);
			admin.setAdminname(username);
			admin.setPassword(newpass);
			session.removeAttribute("admin");
			session.setAttribute("admin", admin);
			return "success";
		} catch (Exception e) {
			// TODO: handle exception
			return "false";
		}
	}
}
