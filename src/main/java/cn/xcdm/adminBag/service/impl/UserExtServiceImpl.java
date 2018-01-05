package cn.xcdm.adminBag.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.xcdm.adminBag.mapper.UserExtMapper;
import cn.xcdm.adminBag.po.UserExt;
import cn.xcdm.adminBag.service.UserExtService;
import cn.xcdm.adminBag.vo.EasyUIDataGridResult;
import cn.xcdm.adminBag.vo.Pager;

@Service
public class UserExtServiceImpl implements UserExtService {
	@Autowired
	private UserExtMapper userExtMapper;
 

	public EasyUIDataGridResult userExtList(Pager pager) {
		// TODO Auto-generated method stub
		EasyUIDataGridResult result = new EasyUIDataGridResult();
		//构造参数列表
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("pager", pager);
		pager.setPagerParams();
		// 一共多少条信息
		long total = userExtMapper.selectAll();
		//信息列表
		List<UserExt> rows=userExtMapper.userExtList(map);
		result.setRows(rows);
		result.setTotal(total);  
		return result;
	}
}
