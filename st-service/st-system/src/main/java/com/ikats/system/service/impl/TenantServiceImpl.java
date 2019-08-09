
package com.ikats.system.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.ikats.core.boot.tenant.TenantId;
import com.ikats.core.mp.base.BaseServiceImpl;
import com.ikats.core.tool.constant.STConstant;
import com.ikats.core.tool.utils.Func;
import com.ikats.system.entity.Dept;
import com.ikats.system.entity.Role;
import com.ikats.system.entity.Tenant;
import com.ikats.system.mapper.DeptMapper;
import com.ikats.system.mapper.RoleMapper;
import com.ikats.system.mapper.TenantMapper;
import com.ikats.system.service.ITenantService;
import lombok.AllArgsConstructor;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 服务实现类
 */
@Service
@AllArgsConstructor
public class TenantServiceImpl extends BaseServiceImpl<TenantMapper, Tenant> implements ITenantService {

	private final TenantId tenantId;
	private final RoleMapper roleMapper;
	private final DeptMapper deptMapper;

	@Override
	public IPage<Tenant> selectTenantPage(IPage<Tenant> page, Tenant tenant) {
		return page.setRecords(baseMapper.selectTenantPage(page, tenant));
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public boolean saveTenant(Tenant tenant) {
		if (Func.isEmpty(tenant.getId())) {
			List<Tenant> tenants = baseMapper.selectList(Wrappers.<Tenant>query().lambda().eq(Tenant::getIsDeleted, STConstant.DB_NOT_DELETED));
			List<String> codes = tenants.stream().map(Tenant::getTenantCode).collect(Collectors.toList());
			String tenantCode = getTenantCode(codes);
			tenant.setTenantCode(tenantCode);
			// 新建租户对应的默认角色
			Role role = new Role();
			role.setTenantCode(tenantCode);
			role.setParentId(0);
			role.setRoleName("管理员");
			role.setRoleAlias("admin");
			role.setSort(2);
			role.setIsDeleted(0);
			roleMapper.insert(role);
			// 新建租户对应的默认部门
			Dept dept = new Dept();
			dept.setTenantCode(tenantCode);
			dept.setParentId(0);
			dept.setDeptName(tenant.getTenantName());
			dept.setFullName(tenant.getTenantName());
			dept.setSort(2);
			dept.setIsDeleted(0);
			deptMapper.insert(dept);
		}
		return super.saveOrUpdate(tenant);
	}

	private String getTenantCode(List<String> codes) {
		String code = tenantId.generate();
		if (codes.contains(code)) {
			return getTenantCode(codes);
		}
		return code;
	}

}
