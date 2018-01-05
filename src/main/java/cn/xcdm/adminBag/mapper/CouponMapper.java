package cn.xcdm.adminBag.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.xcdm.adminBag.po.Coupon;

public interface CouponMapper {

 

public List<Coupon> selectAllCoupon(Map<String, Object> map);


public long selectAll();


public void insert(@Param(value="coupon") Coupon coupon); 
 
}
