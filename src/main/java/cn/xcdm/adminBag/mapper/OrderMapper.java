package cn.xcdm.adminBag.mapper;

import java.util.List;
import java.util.Map;

import cn.xcdm.adminBag.po.Order;

public interface OrderMapper {

	public long selectAll();

	public List<Order> selectAllOrder(Map<String, Object> map);
	

	 
}
