package cn.xcdm.adminBag.mapper;

import java.util.List;
import java.util.Map;

import cn.xcdm.adminBag.po.Account;

public interface AccountMapper {

	public long selectAll();

	public List<Account> accountList(Map<String,Object> map); 

}
