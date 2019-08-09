package com.ikats.system.feign;

import com.ikats.system.entity.Dept;
import com.ikats.system.entity.Role;
import org.springframework.stereotype.Component;

/**
 * Feign失败配置
 */
@Component
public class ISysClientFallback implements ISysClient {
	@Override
	public String getDeptName(Integer id) {
		return null;
	}

	@Override
	public Dept getDept(Integer id) {
		return null;
	}

	@Override
	public String getRoleName(Integer id) {
		return null;
	}

	@Override
	public String getRoleAlias(Integer id) {
		return null;
	}

	@Override
	public Role getRole(Integer id) {
		return null;
	}
}
