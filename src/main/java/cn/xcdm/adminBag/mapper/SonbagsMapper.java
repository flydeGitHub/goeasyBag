package cn.xcdm.adminBag.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.xcdm.adminBag.po.Account;
import cn.xcdm.adminBag.po.Coupon;
import cn.xcdm.adminBag.po.Order;
import cn.xcdm.adminBag.po.Parentbags;
import cn.xcdm.adminBag.po.Sonbags;

public interface SonbagsMapper {

	public long selectAll(Map<String, Object> map); 
	

	public List<Sonbags> showAllsonbag(Map<String, Object> map);


	public long selectsoid(long sonbagid);


	public void insert(@Param(value="sonbags")Sonbags sonbags);


	public Sonbags getSonbagByid(long sonbagid);


	public void editSonBag(@Param(value="sonbags")Sonbags sonbags);
	
	
	 
	 
}
