package cn.xcdm.adminBag.po;

public class Admin {

	/**
	 * 管理员实体类 
	 **/
	public int id;
	public String adminname;
	public String password;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAdminname() {
		return adminname;
	}
	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "Admin [id=" + id + ", adminname=" + adminname + ", password=" + password + "]";
	} 
	
}
