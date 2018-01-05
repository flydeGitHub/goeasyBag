package cn.xcdm.adminBag.mapper;

import java.util.List;
import java.util.Map;

import cn.xcdm.adminBag.po.UserRecommendedPosition;

public interface RecommendedPositionMapper {

	public List<UserRecommendedPosition> selectAllPosition(Map<String, Object> map);

	public long selectTotal(); 
}
