
package com.ikats.system.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ikats.core.tool.node.ForestNodeMerger;
import com.ikats.system.entity.Dept;
import com.ikats.system.mapper.DeptMapper;
import com.ikats.system.service.IDeptService;
import com.ikats.system.vo.DeptVO;


import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 服务实现类
 */
@Service
public class DeptServiceImpl extends ServiceImpl<DeptMapper, Dept> implements IDeptService {

	@Override
	public IPage<DeptVO> selectDeptPage(IPage<DeptVO> page, DeptVO dept) {
		return page.setRecords(baseMapper.selectDeptPage(page, dept));
	}

	@Override
	public List<DeptVO> tree(String tenantCode) {
		return ForestNodeMerger.merge(baseMapper.tree(tenantCode));
	}

}
