
package com.ikats.system.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ikats.core.secure.STUser;
import com.ikats.core.tool.constant.STConstant;
import com.ikats.core.tool.node.ForestNodeMerger;
import com.ikats.core.tool.support.Kv;
import com.ikats.core.tool.utils.Func;
import com.ikats.system.dto.MenuDTO;
import com.ikats.system.entity.Menu;
import com.ikats.system.entity.RoleMenu;
import com.ikats.system.mapper.MenuMapper;
import com.ikats.system.service.IMenuService;
import com.ikats.system.service.IRoleMenuService;
import com.ikats.system.vo.MenuVO;
import com.ikats.system.wrapper.MenuWrapper;
import lombok.AllArgsConstructor;


import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

/**
 * 服务实现类
 */
@Service
@AllArgsConstructor
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements IMenuService {

	IRoleMenuService roleMenuService;

	@Override
	public IPage<MenuVO> selectMenuPage(IPage<MenuVO> page, MenuVO menu) {
		return page.setRecords(baseMapper.selectMenuPage(page, menu));
	}

	@Override
	public List<MenuVO> routes(String roleId) {
		List<Menu> allMenus = baseMapper.allMenu();
		List<Menu> roleMenus = baseMapper.roleMenu(Func.toIntList(roleId));
		List<Menu> routes = new LinkedList<>(roleMenus);
		roleMenus.forEach(roleMenu -> recursion(allMenus, routes, roleMenu));
		routes.sort(Comparator.comparing(Menu::getSort));
		MenuWrapper menuWrapper = new MenuWrapper();
		List<Menu> collect = routes.stream().filter(x -> Func.equals(x.getCategory(), 1)).collect(Collectors.toList());
		return menuWrapper.listNodeVO(collect);
	}

	public void recursion(List<Menu> allMenus, List<Menu> routes, Menu roleMenu) {
		Optional<Menu> menu = allMenus.stream().filter(x -> Func.equals(x.getId(), roleMenu.getParentId())).findFirst();
		if (menu.isPresent() && !routes.contains(menu.get())) {
			routes.add(menu.get());
			recursion(allMenus, routes, menu.get());
		}
	}

	@Override
	public List<MenuVO> buttons(String roleId) {
		List<Menu> buttons = baseMapper.buttons(Func.toIntList(roleId));
		MenuWrapper menuWrapper = new MenuWrapper();
		return menuWrapper.listNodeVO(buttons);
	}

	@Override
	public List<MenuVO> tree() {
		return ForestNodeMerger.merge(baseMapper.tree());
	}

	@Override
	public List<MenuVO> grantTree(STUser user) {
		return ForestNodeMerger.merge(user.getTenantCode().equals(STConstant.ADMIN_TENANT_CODE) ? baseMapper.grantTree() : baseMapper.grantTreeByRole(Func.toIntList(user.getRoleId())));
	}

	@Override
	public List<String> roleTreeKeys(String roleIds) {
		List<RoleMenu> roleMenus = roleMenuService.list(Wrappers.<RoleMenu>query().lambda().in(RoleMenu::getRoleId, Func.toIntList(roleIds)));
		return roleMenus.stream().map(roleMenu -> Func.toStr(roleMenu.getMenuId())).collect(Collectors.toList());
	}

	@Override
	public List<Kv> authRoutes(STUser user) {
		if (Func.isEmpty(user)) {
			return null;
		}
		List<MenuDTO> routes = baseMapper.authRoutes(Func.toIntList(user.getRoleId()));
		List<Kv> list = new ArrayList<>();
		routes.forEach(route -> list.add(Kv.init().set(route.getPath(), Kv.init().set("authority", Func.toStrArray(route.getAlias())))));
		return list;
	}

}
