package com.ikats.sys.user.feign;

import com.ikats.core.tool.api.R;
import com.ikats.sys.user.service.IUserService;
import com.ikats.user.entity.UserInfo;
import com.ikats.user.feign.IUserClient;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 用户服务Feign实现类
 */
@RestController
@AllArgsConstructor
public class UserClient implements IUserClient {

    private IUserService service;

    @Override
    public R<UserInfo> userInfo(Long userId) {
        return R.data(service.userInfo(userId));
    }

    @Override
    @GetMapping(API_PREFIX + "/user-info")
    public R<UserInfo> userInfo(String tenantCode, String account, String password) {
        UserInfo userInfo = service.userInfo(tenantCode,account,password);
        return R.data(userInfo);
    }
}
