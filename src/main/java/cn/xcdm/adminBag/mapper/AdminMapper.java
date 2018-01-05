package cn.xcdm.adminBag.mapper;

import org.apache.ibatis.annotations.Param;

import cn.xcdm.adminBag.po.Admin;

public interface AdminMapper {

	public Admin selectAdminByName(String username);

	public void chagepwd( @Param(value="username")String username,@Param(value="newpass")  String newpass);
	 
}
