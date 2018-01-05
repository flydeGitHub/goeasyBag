package cn.xcdm.adminBag.po;

public class UserExt {
	/**
	 * user详细信息
	 * 
	 */
 
	private String nickname;// 昵称
	private String sex;// 性别
	private String birthday;// 生日
	private String updated;// 更新日期
	private String created;// 注册日期
	private String phone; // 旧的注册电话
	private String newphone;// 新的在用电话
	private String head;// 头像

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getUpdated() {
		return updated;
	}

	public void setUpdated(String updated) {
		this.updated = updated;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getNewphone() {
		return newphone;
	}

	public void setNewphone(String newphone) {
		this.newphone = newphone;
	}

	public String getHead() {
		return head;
	}

	public void setHead(String head) {
		this.head = head;
	}

}
