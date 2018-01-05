package cn.xcdm.adminBag.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.xcdm.adminBag.mapper.SonbagsMapper;
import cn.xcdm.adminBag.po.Sonbags;
import cn.xcdm.adminBag.service.SonbagsService;
import cn.xcdm.adminBag.vo.EasyUIDataGridResult;
import cn.xcdm.adminBag.vo.Pager;

@Service
public class SongbagsServiceImpl implements SonbagsService {
	@Autowired
	private SonbagsMapper songbagsMapper; 
 
	public EasyUIDataGridResult showAllsonbag(Pager pager, long parentbagsid) {
		// TODO 查找 所有 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pager", pager);
        map.put("parentbagsid", parentbagsid); 
		// 构建结果对象
		EasyUIDataGridResult result = new EasyUIDataGridResult();
		// 计算分页参数
		pager.setPagerParams();
		// 计算总共记录数
		long total = songbagsMapper.selectAll(map);
		// 查询数据列表信息
		List<Sonbags> rows = songbagsMapper.showAllsonbag(map);
		// 构建返回结果
		result.setRows(rows);
		result.setTotal(total);
		return result;
	}

	public boolean selectsoid(long sonbagid) {
		// TODO 查找柜子是否存在 
		if(songbagsMapper.selectsoid(sonbagid)<1)
			
			return false;
			else
			{
				return true;
			}
	}

	public void addSonBag(Sonbags sonbags) {
		// TODO 插入子柜子数据 
		songbagsMapper.insert(sonbags);
		
	}

	public Sonbags getSonbagByid(long sonbagid) {
		// TODO getbyid  
		return songbagsMapper.getSonbagByid(sonbagid);
	}

	public void editSonBag(Sonbags sonbags) {
		// TODO 修改 柜子 信息 
		songbagsMapper.editSonBag(sonbags);
		
	}
 
}
