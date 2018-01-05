package cn.xcdm.adminBag.po;

import java.math.BigDecimal;

public class UserRecommendedPosition {
/**
 * 用户推荐信息实体类 
 */
	private long urpid;//用户编号
	private String  updated ;//
	private String created;
	private String phone;//表中存的旧的电话
	private String newphone;//现在用的新的电话 
	private String address;
	private BigDecimal longitude;
	private BigDecimal latitude;
	private String information;
	public long getUrpid() {
		return urpid;
	}
	public void setUrpid(long urpid) {
		this.urpid = urpid;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public BigDecimal getLongitude() {
		return longitude;
	}
	public void setLongitude(BigDecimal longitude) {
		this.longitude = longitude;
	}
	public BigDecimal getLatitude() {
		return latitude;
	}
	public void setLatitude(BigDecimal latitude) {
		this.latitude = latitude;
	}
	public String getInformation() {
		return information;
	}
	public void setInformation(String information) {
		this.information = information;
	}
	@Override
	public String toString() {
		return "UserRecommendedPosition [urpid=" + urpid + ", updated=" + updated + ", created=" + created + ", phone="
				+ phone + ", address=" + address + ", longitude=" + longitude + ", latitude=" + latitude
				+ ", information=" + information + "]";
	}
	public String getNewphone() {
		return newphone;
	}
	public void setNewphone(String newphone) {
		this.newphone = newphone;
	}
	
}
