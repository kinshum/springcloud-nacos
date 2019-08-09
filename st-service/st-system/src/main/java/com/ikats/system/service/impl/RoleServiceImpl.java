
package com.ikats.system.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ikats.core.secure.utils.SecureUtil;
import com.ikats.core.tool.constant.RoleConstant;
import com.ikats.core.tool.node.ForestNodeMerger;
import com.ikats.core.tool.utils.CollectionUtil;
import com.ikats.core.tool.utils.Func;
import com.ikats.system.entity.Role;
import com.ikats.system.entity.RoleMenu;
import com.ikats.system.mapper.RoleMapper;
import com.ikats.system.service.IRoleMenuService;
import com.ikats.system.service.IRoleService;
import com.ikats.system.vo.RoleVO;
import lombok.AllArgsConstructor;


import org.springframework.stereotype.Service;
import org.springframework.validation.annotation.Validated;

import javax.validation.constraints.NotEmpty;
import java.util.ArrayList;
import java.util.List;

/**
 * 服务实现类
 */
@Service
@Validated
@AllArgsConstructor
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements IRoleService {

	IRoleMenuService roleMenuService;

	@Override
	public IPage<RoleVO> selectRolePage(IPage<RoleVO> page, RoleVO role) {
		return page.setRecords(baseMapper.selectRolePage(page, role));
	}

	@Override
	public List<RoleVO> tree(String tenantCode) {
		String userRole = SecureUtil.getUserRole();
		String excludeRole = null;
		if (!CollectionUtil.contains(Func.toStrArray(userRole), RoleConstant.ADMIN)) {
			excludeRole = RoleConstant.ADMIN;
		}
		return ForestNodeMerger.merge(baseMapper.tree(tenantCode, excludeRole));
	}

	@Override
	public boolean grant(@NotEmpty List<Integer> roleIds, @NotEmpty List<Integer> menuIds) {
		// 删除角色配置的菜单集合
		roleMenuService.remove(Wrappers.<RoleMenu>update().lambda().in(RoleMenu::getRoleId, roleIds));
		// 组装配置
		List<RoleMenu> roleMenus = new ArrayList<>();
		roleIds.forEach(roleId -> menuIds.forEach(menuId -> {
			RoleMenu roleMenu = new RoleMenu();
			roleMenu.setRoleId(roleId);
			roleMenu.setMenuId(menuId);
			roleMenus.add(roleMenu);
		}));
		// 新增配置
		return roleMenuService.saveBatch(roleMenus);
	}

}
