package cn.xcdm.adminBag.mapper;

import java.util.List;
import java.util.Map;

import cn.xcdm.adminBag.po.UserExt;

public interface UserExtMapper {

public	long selectAll();

public List<UserExt> userExtList(Map<String, Object> map);


}
