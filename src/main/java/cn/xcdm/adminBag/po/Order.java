package cn.xcdm.adminBag.po;

public class Order {
	/**
	 * order订单表
	 * 
	 */
 
	private String orderid;// 订单号
	private long sonbagid;// 子柜号
	private String status;//订单状态
	private String nickname;//用户昵称
	private String paymoney;// 金额
	private String start_time;// 订单开始时间
	private String end_time;// 结束时间
	private String phone; // 旧的注册电话
	private String newphone;// 新的在用电话
	private String paytype;// 支付种类 支付宝。微信
	private String  ordertype;//订单类型 消费。充值
	private String  dowhat;//用途
	
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
 
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPaymoney() {
		return paymoney;
	}
	public void setPaymoney(String paymoney) {
		this.paymoney = paymoney;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
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
	public String getPaytype() {
		return paytype;
	}
	public void setPaytype(String paytype) {
		this.paytype = paytype;
	}
	public String getOrdertype() {
		return ordertype;
	}
	public void setOrdertype(String ordertype) {
		this.ordertype = ordertype;
	}
	public String getDowhat() {
		return dowhat;
	}
	public void setDowhat(String dowhat) {
		this.dowhat = dowhat;
	}
	public long getSonbagid() {
		return sonbagid;
	}
	public void setSonbagid(long sonbagid) {
		this.sonbagid = sonbagid;
	} 

}
