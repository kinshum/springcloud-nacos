
package com.ikats.desk;


import com.ikats.core.launch.STApplication;
import com.ikats.core.launch.constant.AppConstant;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * Desk启动器
 */
@SpringCloudApplication
@EnableFeignClients(AppConstant.BASE_PACKAGES)
public class DeskApplication {

	public static void main(String[] args) {
		STApplication.run(AppConstant.APPLICATION_DESK_NAME, DeskApplication.class, args);
	}

}

