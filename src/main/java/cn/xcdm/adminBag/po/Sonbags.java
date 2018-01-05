package cn.xcdm.adminBag.po;

public class Sonbags {
	/**
	 * 柜子信息
	 * 
	 */ 
	private long sonbagid;// 柜子号
	private long parentbagsid;// 父柜子号
	private String updated;// 更新时间
	private String created;// 初始化时间
	private String address;// 地址
	private String isusered;// 是否在使用
	private String type;// 柜子类型 。大/小
 
	public long getSonbagid() {
		return sonbagid;
	}
	public void setSonbagid(long sonbagid) {
		this.sonbagid = sonbagid;
	}
	public long getParentbagsid() {
		return parentbagsid;
	}
	public void setParentbagsid(long parentbagsid) {
		this.parentbagsid = parentbagsid;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getIsusered() {
		return isusered;
	}
	public void setIsusered(String isusered) {
		this.isusered = isusered;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "Sonbags [sonbagid=" + sonbagid + ", parentbagid=" + parentbagsid + ", updated=" + updated
				+ ", created=" + created + ", address=" + address + ", isusered=" + isusered + ", type=" + type + "]";
	}
 
}
