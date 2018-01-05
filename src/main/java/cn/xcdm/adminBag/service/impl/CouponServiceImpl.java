package cn.xcdm.adminBag.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.xcdm.adminBag.mapper.CouponMapper;
import cn.xcdm.adminBag.po.Coupon;
import cn.xcdm.adminBag.service.CouponService;
import cn.xcdm.adminBag.vo.EasyUIDataGridResult;
import cn.xcdm.adminBag.vo.Pager;

@Service
public class CouponServiceImpl implements CouponService {
	@Autowired
	private CouponMapper couponMapper;

	public EasyUIDataGridResult showAllCoupon(Pager pager) {
		// TODO 分页查找所有优惠券
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pager", pager);

		// 构建结果对象
		EasyUIDataGridResult result = new EasyUIDataGridResult();
		// 计算分页参数
		pager.setPagerParams();
		// 计算总共记录数
		long total = couponMapper.selectAll();
		// 查询数据列表信息
		List<Coupon> rows = couponMapper.selectAllCoupon(map);
		// 构建返回结果
		result.setRows(rows);
		result.setTotal(total);
		return result;
	}

	// 增加优惠券
	public void addCoupon(Coupon coupon) {
		// TODO Auto-generated method stub
		couponMapper.insert(coupon); 
	}

}
