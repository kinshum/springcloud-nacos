
package com.ikats.sys.user;


import com.ikats.core.launch.STApplication;
import com.ikats.core.launch.constant.AppConstant;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * 用户启动器
 */
@SpringCloudApplication
@EnableFeignClients(AppConstant.BASE_PACKAGES)
public class UserApplication {

	public static void main(String[] args) {
		STApplication.run(AppConstant.APPLICATION_USER_NAME, UserApplication.class, args);
	}

}
