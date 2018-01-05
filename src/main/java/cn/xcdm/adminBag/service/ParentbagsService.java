package cn.xcdm.adminBag.service;

import cn.xcdm.adminBag.po.Parentbags;
import cn.xcdm.adminBag.vo.EasyUIDataGridResult;
import cn.xcdm.adminBag.vo.Pager;

public interface ParentbagsService {

public 	EasyUIDataGridResult showAllparentbag(Pager pager);

public int deleteParent(String id);

public void addParentBag(Parentbags parentbags);

public boolean selectpaid(long parentbagsid);

public Parentbags getParentByid(long parentbagsid);

public void editParentBag(Parentbags parentbags);





	

}
