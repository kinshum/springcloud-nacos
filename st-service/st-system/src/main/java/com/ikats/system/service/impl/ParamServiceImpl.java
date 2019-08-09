
package com.ikats.system.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.ikats.core.mp.base.BaseServiceImpl;
import com.ikats.system.entity.Param;
import com.ikats.system.mapper.ParamMapper;
import com.ikats.system.service.IParamService;
import com.ikats.system.vo.ParamVO;

import org.springframework.stereotype.Service;

/**
 * 服务实现类
 */
@Service
public class ParamServiceImpl extends BaseServiceImpl<ParamMapper, Param> implements IParamService {

	@Override
	public IPage<ParamVO> selectParamPage(IPage<ParamVO> page, ParamVO param) {
		return page.setRecords(baseMapper.selectParamPage(page, param));
	}

}
