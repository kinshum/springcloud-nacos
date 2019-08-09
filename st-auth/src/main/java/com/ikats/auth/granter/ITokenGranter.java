package com.ikats.auth.granter;


import com.ikats.user.entity.UserInfo;

/**
 * 授权认证统一接口.
 *
 * @author shenjian26@hotmail.com
 */
public interface ITokenGranter {

	/**
	 * 获取用户信息
	 *
	 * @param tokenParameter 授权参数
	 * @return UserInfo
	 */
	UserInfo grant(TokenParameter tokenParameter);

}
