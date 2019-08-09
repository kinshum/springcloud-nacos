
package com.ikats.system.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.ikats.core.mp.base.BaseService;
import com.ikats.system.entity.Param;
import com.ikats.system.vo.ParamVO;



/**
 * 服务类
 *
 * @author shenjian
 */
public interface IParamService extends BaseService<Param> {

	/***
	 * 自定义分页
	 * @param page
	 * @param param
	 * @return
	 */
	IPage<ParamVO> selectParamPage(IPage<ParamVO> page, ParamVO param);

}
