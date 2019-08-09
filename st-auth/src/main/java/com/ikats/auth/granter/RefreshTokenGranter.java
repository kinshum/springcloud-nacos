package com.ikats.auth.granter;

import com.ikats.core.launch.constant.TokenConstant;
import com.ikats.core.secure.utils.SecureUtil;
import com.ikats.core.tool.api.R;
import com.ikats.core.tool.utils.Func;
import com.ikats.user.entity.UserInfo;
import com.ikats.user.feign.IUserClient;
import io.jsonwebtoken.Claims;
import lombok.AllArgsConstructor;

import org.springframework.stereotype.Component;

import java.util.Objects;

/**
 * RefreshTokenGranter
 *
 * @author shenjian
 */
@Component
@AllArgsConstructor
public class RefreshTokenGranter implements ITokenGranter {

	public static final String GRANT_TYPE = "refresh_token";

	private IUserClient userClient;

	@Override
	public UserInfo grant(TokenParameter tokenParameter) {
		String grantType = tokenParameter.getArgs().getStr("grantType");
		String refreshToken = tokenParameter.getArgs().getStr("refreshToken");
		UserInfo userInfo = null;
		if (Func.isNoneBlank(grantType, refreshToken) && grantType.equals(TokenConstant.REFRESH_TOKEN)) {
			Claims claims = SecureUtil.parseJWT(refreshToken);
			String tokenType = Func.toStr(Objects.requireNonNull(claims).get(TokenConstant.TOKEN_TYPE));
			if (tokenType.equals(TokenConstant.REFRESH_TOKEN)) {
				R<UserInfo> result = userClient.userInfo(Func.toLong(claims.get(TokenConstant.USER_ID)));
				userInfo = result.isSuccess() ? result.getData() : null;
			}
		}
		return userInfo;
	}
}
