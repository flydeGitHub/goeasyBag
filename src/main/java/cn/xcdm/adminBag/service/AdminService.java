package cn.xcdm.adminBag.service;

import cn.xcdm.adminBag.po.Admin;

public interface AdminService {

	public boolean login(String username, String password);

	public Admin selectAdminByName(String username);

	public void changepwd(String username, String newpass);
	
	
    
}
