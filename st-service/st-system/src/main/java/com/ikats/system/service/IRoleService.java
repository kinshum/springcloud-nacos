
package com.ikats.system.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ikats.system.entity.Role;
import com.ikats.system.vo.RoleVO;


import javax.validation.constraints.NotEmpty;
import java.util.List;

/**
 * 服务类
 *
 * @author Chill
 */
public interface IRoleService extends IService<Role> {

	/**
	 * 自定义分页
	 *
	 * @param page
	 * @param role
	 * @return
	 */
	IPage<RoleVO> selectRolePage(IPage<RoleVO> page, RoleVO role);

	/**
	 * 树形结构
	 *
	 * @param tenantCode
	 * @return
	 */
	List<RoleVO> tree(String tenantCode);

	/**
	 * 权限配置
	 *
	 * @param roleIds 角色id集合
	 * @param menuIds 菜单id集合
	 * @return 是否成功
	 */
	boolean grant(@NotEmpty List<Integer> roleIds, @NotEmpty List<Integer> menuIds);

}
