
package com.ikats.system;


import com.ikats.core.launch.STApplication;

import com.ikats.core.launch.constant.AppConstant;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * 系统模块启动器
 */
@SpringCloudApplication
@EnableFeignClients(AppConstant.BASE_PACKAGES)
public class SystemApplication {

	public static void main(String[] args) {
		STApplication.run(AppConstant.APPLICATION_SYSTEM_NAME, SystemApplication.class, args);
	}

}

