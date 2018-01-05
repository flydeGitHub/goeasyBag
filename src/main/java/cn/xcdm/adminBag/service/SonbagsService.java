package cn.xcdm.adminBag.service;

import cn.xcdm.adminBag.po.Sonbags;
import cn.xcdm.adminBag.vo.EasyUIDataGridResult;
import cn.xcdm.adminBag.vo.Pager;

public interface SonbagsService {

	//public EasyUIDataGridResult showAllsonbag(Pager pager);

	public EasyUIDataGridResult showAllsonbag(Pager pager, long parentbagsid);

	public boolean selectsoid(long sonbagid);

	public void addSonBag(Sonbags sonbags);

	public Sonbags getSonbagByid(long sonbagid);

	public void editSonBag(Sonbags sonbags);
	
	
	
	
	
	

}
