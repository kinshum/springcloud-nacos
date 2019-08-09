package com.ikats.sys.user.wrapper;

import com.ikats.core.mp.support.BaseEntityWrapper;
import com.ikats.core.tool.api.R;
import com.ikats.core.tool.utils.BeanUtil;
import com.ikats.core.tool.utils.Func;
import com.ikats.core.tool.utils.SpringUtil;
import com.ikats.dict.feign.IDictClient;
import com.ikats.sys.user.service.IUserService;
import com.ikats.user.entity.User;
import com.ikats.user.vo.UserVO;


import java.util.List;

/**
 * 包装类,返回视图层所需的字段
 */
public class UserWrapper extends BaseEntityWrapper<User, UserVO> {

	private static IUserService userService;

	private static IDictClient dictClient;

	static {
		userService = SpringUtil.getBean(IUserService.class);
		dictClient = SpringUtil.getBean(IDictClient.class);
	}

	public static UserWrapper build() {
		return new UserWrapper();
	}

	@Override
	public UserVO entityVO(User user) {
		UserVO userVO = BeanUtil.copy(user, UserVO.class);
		List<String> roleName = userService.getRoleName(user.getRoleId());
		List<String> deptName = userService.getDeptName(user.getDeptId());
		userVO.setRoleName(Func.join(roleName));
		userVO.setDeptName(Func.join(deptName));
		R<String> dict = dictClient.getValue("sex", Func.toInt(user.getSex()));
		if (dict.isSuccess()) {
			userVO.setSexName(dict.getData());
		}
		return userVO;
	}

}
