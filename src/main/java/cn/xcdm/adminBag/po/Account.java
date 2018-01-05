package cn.xcdm.adminBag.po;

import java.math.BigDecimal;

public class Account {
	/**
	 * 用户余额 以及个人信息
	 * 
	 */
	private BigDecimal balance;// 余额
	private String phone;// 注册时的电话
	private String newphone;//现在用的电话号
	private String nickname;// 用户昵称

	public BigDecimal getBalance() {
		return balance;
	}

	public void setBalance(BigDecimal balance) {
		this.balance = balance;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getNewphone() {
		return newphone;
	}

	public void setNewphone(String newphone) {
		this.newphone = newphone;
	}

}
