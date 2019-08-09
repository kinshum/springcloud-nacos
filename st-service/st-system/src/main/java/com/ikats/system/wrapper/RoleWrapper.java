
package com.ikats.system.wrapper;

import com.ikats.common.constant.CommonConstant;
import com.ikats.core.mp.support.BaseEntityWrapper;
import com.ikats.core.tool.node.ForestNodeMerger;
import com.ikats.core.tool.node.INode;
import com.ikats.core.tool.utils.BeanUtil;
import com.ikats.core.tool.utils.Func;
import com.ikats.core.tool.utils.SpringUtil;
import com.ikats.system.entity.Role;
import com.ikats.system.service.IRoleService;
import com.ikats.system.vo.RoleVO;


import java.util.List;
import java.util.stream.Collectors;

/**
 * 包装类,返回视图层所需的字段
 */
public class RoleWrapper extends BaseEntityWrapper<Role, RoleVO> {

	private static IRoleService roleService;

	static {
		roleService = SpringUtil.getBean(IRoleService.class);
	}

	public static RoleWrapper build() {
		return new RoleWrapper();
	}

	@Override
	public RoleVO entityVO(Role role) {
		RoleVO roleVO = BeanUtil.copy(role, RoleVO.class);
		if (Func.equals(role.getParentId(), CommonConstant.TOP_PARENT_ID)) {
			roleVO.setParentName(CommonConstant.TOP_PARENT_NAME);
		} else {
			Role parent = roleService.getById(role.getParentId());
			roleVO.setParentName(parent.getRoleName());
		}
		return roleVO;
	}

	public List<INode> listNodeVO(List<Role> list) {
		List<INode> collect = list.stream().map(this::entityVO).collect(Collectors.toList());
		return ForestNodeMerger.merge(collect);
	}

}
