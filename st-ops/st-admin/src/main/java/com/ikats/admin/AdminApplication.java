package com.ikats.admin;

import com.ikats.core.launch.STApplication;
import com.ikats.core.launch.constant.AppConstant;
import de.codecentric.boot.admin.server.config.EnableAdminServer;
import org.springframework.cloud.client.SpringCloudApplication;

/**
 * admin启动器
 *
 * @author shenjian
 */
@EnableAdminServer
@SpringCloudApplication
public class AdminApplication {

	public static void main(String[] args) {
		STApplication.run(AppConstant.APPLICATION_ADMIN_NAME, AdminApplication.class, args);
	}

}
