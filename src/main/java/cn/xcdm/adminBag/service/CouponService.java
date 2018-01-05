package cn.xcdm.adminBag.service;

import cn.xcdm.adminBag.po.Coupon;
import cn.xcdm.adminBag.vo.EasyUIDataGridResult;
import cn.xcdm.adminBag.vo.Pager;

public interface CouponService {

public	EasyUIDataGridResult showAllCoupon(Pager pager);

public void addCoupon(Coupon coupon); 

}
