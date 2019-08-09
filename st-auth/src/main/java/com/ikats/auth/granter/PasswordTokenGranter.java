package com.ikats.auth.granter;

import com.ikats.auth.enums.STUserEnum;
import com.ikats.core.tool.api.R;
import com.ikats.core.tool.utils.DigestUtil;
import com.ikats.core.tool.utils.Func;
import com.ikats.user.entity.UserInfo;
import com.ikats.user.feign.IUserClient;
import lombok.AllArgsConstructor;

import org.springframework.stereotype.Component;

/**
 * PasswordTokenGranter
 * @author shenjian26@hotmail.com
 */
@Component
@AllArgsConstructor
public class PasswordTokenGranter implements ITokenGranter {

	public static final String GRANT_TYPE = "password";

	private IUserClient userClient;

	@Override
	public UserInfo grant(TokenParameter tokenParameter) {
		String tenantCode = tokenParameter.getArgs().getStr("tenantCode");
		String account = tokenParameter.getArgs().getStr("account");
		String password = tokenParameter.getArgs().getStr("password");
		UserInfo userInfo = null;
		if (Func.isNoneBlank(account, password)) {
			// 获取用户类型
			String userType = tokenParameter.getArgs().getStr("userType");
			R<UserInfo> result;
			// 根据不同用户类型调用对应的接口返回数据，用户可自行拓展
			if (userType.equals(STUserEnum.WEB.getName())) {
				result = userClient.userInfo(tenantCode, account, DigestUtil.encrypt(password));
			} else if (userType.equals(STUserEnum.APP.getName())) {
				result = userClient.userInfo(tenantCode, account, DigestUtil.encrypt(password));
			} else {
				result = userClient.userInfo(tenantCode, account, DigestUtil.encrypt(password));
			}
			userInfo = result.isSuccess() ? result.getData() : null;
		}
		return userInfo;
	}

}
