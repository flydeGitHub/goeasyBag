package cn.xcdm.adminBag.po;

public class Coupon {

	/**
	 * 优惠券实体类
	 * 
	 */
	private long couponid;
	private String name;// 优惠券名陈
	private String rule;// 规则
	private String soule;// 方案
	private String start_time;// 开始时间
	private String end_time; // 结束时间
	private String status;// 0未启用 1启用
 
	public long getCouponid() {
		return couponid;
	}

	public void setCouponid(long couponid) {
		this.couponid = couponid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRule() {
		return rule;
	}

	public void setRule(String rule) {
		this.rule = rule;
	}

	public String getSoule() {
		return soule;
	}

	public void setSoule(String soule) {
		this.soule = soule;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

 
}
