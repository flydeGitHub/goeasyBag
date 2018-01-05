package cn.xcdm.adminBag.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.xcdm.adminBag.mapper.OrderMapper;
import cn.xcdm.adminBag.po.Order;
import cn.xcdm.adminBag.service.OrderService;
import cn.xcdm.adminBag.vo.EasyUIDataGridResult;
import cn.xcdm.adminBag.vo.Pager;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderMapper orderMapper; 

	public EasyUIDataGridResult orderList(Pager pager) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pager", pager);

		// 构建结果对象
		EasyUIDataGridResult result = new EasyUIDataGridResult();
		// 计算分页参数
		pager.setPagerParams();
		// 计算总共记录数
		long total = orderMapper.selectAll();
		// 查询数据列表信息
		List<Order> rows = orderMapper.selectAllOrder(map);
		// 构建返回结果
		result.setRows(rows);
		result.setTotal(total);
		return result;
	}

}
