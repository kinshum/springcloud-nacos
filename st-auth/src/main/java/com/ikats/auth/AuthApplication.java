package com.ikats.auth;




import com.ikats.core.launch.STApplication;
import com.ikats.core.launch.constant.AppConstant;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * 用户认证服务器
 *
 * @author shenjian26@hotmail.com
 */
@SpringCloudApplication
@EnableFeignClients(AppConstant.BASE_PACKAGES)
public class AuthApplication {

	public static void main(String[] args) {
		STApplication.run(AppConstant.APPLICATION_AUTH_NAME, AuthApplication.class, args);
	}

}
