
package com.ikats.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.ikats.system.entity.Role;
import com.ikats.system.vo.RoleVO;



import java.util.List;

/**
 * Mapper 接口
 */

public interface RoleMapper extends BaseMapper<Role> {

	/**
	 * 自定义分页
	 *
	 * @param page
	 * @param role
	 * @return
	 */
	List<RoleVO> selectRolePage(IPage page, RoleVO role);

	/**
	 * 获取树形节点
	 *
	 * @param tenantCode
	 * @param excludeRole
	 * @return
	 */
	List<RoleVO> tree(String tenantCode, String excludeRole);

}
