package com.ikats.auth.granter;

import com.ikats.core.secure.exception.SecureException;
import com.ikats.core.tool.utils.Func;
import com.ikats.core.tool.utils.SpringUtil;
import lombok.AllArgsConstructor;


import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * TokenGranterBuilder
 */
@AllArgsConstructor
public class TokenGranterBuilder {

	/**
	 * TokenGranter缓存池
	 */
	private static Map<String, ITokenGranter> granterPool = new ConcurrentHashMap<>();

	static {
		granterPool.put(PasswordTokenGranter.GRANT_TYPE, SpringUtil.getBean(PasswordTokenGranter.class));
		granterPool.put(RefreshTokenGranter.GRANT_TYPE, SpringUtil.getBean(RefreshTokenGranter.class));
	}

	/**
	 * 获取TokenGranter
	 *
	 * @param grantType 授权类型
	 * @return ITokenGranter
	 */
	public static ITokenGranter getGranter(String grantType) {
		ITokenGranter tokenGranter = granterPool.get(Func.toStr(grantType, PasswordTokenGranter.GRANT_TYPE));
		if (tokenGranter == null) {
			throw new SecureException("no grantType was found");
		} else {
			return tokenGranter;
		}
	}

}
