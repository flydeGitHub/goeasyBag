package cn.xcdm.adminBag.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.xcdm.adminBag.po.Parentbags;

public interface ParentbagsMapper {

public 	long selectAll();


public List<Parentbags> showAllparentbag(Map<String, Object> map);


public void insert(@Param(value="parentbags")Parentbags parentbags);


public long selectpaid(long parentbagsid);



public Parentbags getParentByid(long parentbagsid);


public void editParentBag(@Param(value="parentbags")Parentbags parentbags);




}
