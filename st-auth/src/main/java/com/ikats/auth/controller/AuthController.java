package com.ikats.auth.controller;

import com.ikats.auth.granter.ITokenGranter;
import com.ikats.auth.granter.TokenGranterBuilder;
import com.ikats.auth.granter.TokenParameter;
import com.ikats.auth.utils.TokenUtil;
import com.ikats.core.secure.AuthInfo;
import com.ikats.core.tool.api.R;
import com.ikats.core.tool.utils.Func;
import com.ikats.core.tool.utils.WebUtil;
import com.ikats.user.entity.UserInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.AllArgsConstructor;



import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * 认证模块
 *
 * @author shenjian26@hotmail.com
 */
@RestController
@AllArgsConstructor
@Api(value = "用户授权认证", tags = "授权接口")
public class AuthController {

	@PostMapping("token")
	@ApiOperation(value = "获取认证token", notes = "传入租户编号:tenantCode,账号:account,密码:password")
	public R<AuthInfo> token(@ApiParam(value = "授权类型", required = true) @RequestParam(defaultValue = "password", required = false) String grantType,
							 @ApiParam(value = "刷新令牌") @RequestParam(required = false) String refreshToken,
							 @ApiParam(value = "租户编号", required = true) @RequestParam(defaultValue = "000000", required = false) String tenantCode,
							 @ApiParam(value = "账号") @RequestParam(required = false) String account,
							 @ApiParam(value = "密码") @RequestParam(required = false) String password) {

		String userType = Func.toStr(WebUtil.getRequest().getHeader(TokenUtil.USER_TYPE_HEADER_KEY), TokenUtil.DEFAULT_USER_TYPE);

		TokenParameter tokenParameter = new TokenParameter();
		tokenParameter.getArgs().set("tenantCode", tenantCode).set("account", account).set("password", password).set("grantType", grantType).set("refreshToken", refreshToken).set("userType", userType);

		ITokenGranter granter = TokenGranterBuilder.getGranter(grantType);
		UserInfo userInfo = granter.grant(tokenParameter);

		if (userInfo == null || userInfo.getUser() == null || userInfo.getUser().getId() == null) {
			return R.fail(TokenUtil.USER_NOT_FOUND);
		}

		return R.data(TokenUtil.createAuthInfo(userInfo));
	}

}
