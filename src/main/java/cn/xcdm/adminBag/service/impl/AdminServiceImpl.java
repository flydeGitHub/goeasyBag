package cn.xcdm.adminBag.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.xcdm.adminBag.mapper.AdminMapper;
import cn.xcdm.adminBag.po.Admin;
import cn.xcdm.adminBag.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminMapper adminMapper;

	public boolean login(String username, String password) {
		// TODO 验证身份
		Admin admin = new Admin();
		admin = adminMapper.selectAdminByName(username);
		if (admin == null) {
			// 没有此用户
			return false;
		} else {
			if (password.equals(adminMapper.selectAdminByName(username).getPassword())) {
				return true;
			} else {
				// 密码错误
				return false;
			}

		}
	}

	public Admin selectAdminByName(String username) {
		// TODO Auto-generated method stub
		return adminMapper.selectAdminByName(username);
	}

	public void changepwd(String username, String newpass) {
		// TODO 修改密码
		adminMapper.chagepwd(username, newpass);
	}

}
