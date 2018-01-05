package cn.xcdm.adminBag.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.xcdm.adminBag.mapper.ParentbagsMapper;
import cn.xcdm.adminBag.po.Parentbags;
import cn.xcdm.adminBag.service.ParentbagsService;
import cn.xcdm.adminBag.vo.EasyUIDataGridResult;
import cn.xcdm.adminBag.vo.Pager;

@Service
public class ParentbagsServiceImpl implements ParentbagsService {
	@Autowired
	private ParentbagsMapper parentbagsMapper; 
 
	public EasyUIDataGridResult showAllparentbag(Pager pager) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pager", pager);

		// 构建结果对象
		EasyUIDataGridResult result = new EasyUIDataGridResult();
		// 计算分页参数
		pager.setPagerParams();
		// 计算总共记录数
		long total = parentbagsMapper.selectAll();
		// 查询数据列表信息
		List<Parentbags> rows = parentbagsMapper.showAllparentbag(map);
		// 构建返回结果
		result.setRows(rows);
		result.setTotal(total);
		return result;
	}

	public int deleteParent(String id) {
		// TODO Auto-generated method stub
		//删除父柜子 
		
		return 0;
	}

	public void addParentBag(Parentbags parentbags) {
		// TODO Auto-generated method stub
		parentbagsMapper.insert(parentbags);  
	}

	public boolean selectpaid(long parentbagsid) {
		// TODO 查找是否有记录  
		if(parentbagsMapper.selectpaid(parentbagsid)<1)
			
		return false;
		else
		{
			return true;
		}
	}

	public Parentbags getParentByid(long parentbagsid) {
		// TODO 根据id 查找对象
		return parentbagsMapper.getParentByid(parentbagsid);
	}

	public void editParentBag(Parentbags parentbags) {
		// TODO 编辑父柜子 
		parentbagsMapper.editParentBag(parentbags);
		
	} 
}
