
package com.ikats.system.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.ikats.core.mp.base.BaseService;
import com.ikats.system.entity.Tenant;



/**
 * 服务类
 */
public interface ITenantService extends BaseService<Tenant> {

	/**
	 * 自定义分页
	 *
	 * @param page
	 * @param tenant
	 * @return
	 */
	IPage<Tenant> selectTenantPage(IPage<Tenant> page, Tenant tenant);

	/**
	 * 新增
	 *
	 * @param tenant
	 * @return
	 */
	boolean saveTenant(Tenant tenant);

}
