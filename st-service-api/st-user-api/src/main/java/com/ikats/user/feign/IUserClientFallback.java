package com.ikats.user.feign;

import com.ikats.core.tool.api.R;
import com.ikats.user.entity.UserInfo;

import org.springframework.stereotype.Component;

/**
 * Feign失败配置
 */
@Component
public class IUserClientFallback implements IUserClient {

	@Override
	public R<UserInfo> userInfo(Long userId) {
		return R.fail("未获取到账号信息");
	}

	@Override
	public R<UserInfo> userInfo(String tenantCode, String account, String password) {
		return R.fail("未获取到账号信息");
	}
}
