package cn.xcdm.adminBag.po;

import java.math.BigDecimal;

public class Parentbags {

	/**
	 * 父柜子po
	 */
	private long parentbagsid;// 父柜子编号
	private BigDecimal longitude;// 经度
	private BigDecimal latitude;// 纬度
	private String address;// 地址
	private String updated;// 更新时间
	private String created;// 初始化时间

	public long getParentbagsid() {
		return parentbagsid;
	}

	public void setParentbagsid(long parentbagsid) {
		this.parentbagsid = parentbagsid;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	@Override
	public String toString() {
		return "Parentbags [parentbagsid=" + parentbagsid + ", longitude=" + longitude + ", latitude=" + latitude
				+ ", address=" + address + ", updated=" + updated + ", created=" + created + "]";
	}
	
}
