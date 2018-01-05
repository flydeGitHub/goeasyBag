package cn.xcdm.adminBag.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.xcdm.adminBag.mapper.RecommendedPositionMapper;
import cn.xcdm.adminBag.po.UserRecommendedPosition;
import cn.xcdm.adminBag.service.RecommendedPositionService;
import cn.xcdm.adminBag.vo.EasyUIDataGridResult;
import cn.xcdm.adminBag.vo.Pager;

@Service
public class RecommendedPositionServiceImpl implements RecommendedPositionService {

	@Autowired
	private RecommendedPositionMapper recommendedPositionMapper;

	public EasyUIDataGridResult showAllPosition(Pager pager) {
		// TODO 分页查找所有推荐位置
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pager", pager);
		
		// 构建结果对象
		EasyUIDataGridResult result = new EasyUIDataGridResult();
		//计算分页参数
	     pager.setPagerParams();
		//计算总共记录数 
		long total = recommendedPositionMapper.selectTotal();
		//查询数据列表信息
		List<UserRecommendedPosition> rows = recommendedPositionMapper.selectAllPosition(map);
		//构建返回结果
		result.setRows(rows);
		result.setTotal(total);
		return result;
	} 

}
