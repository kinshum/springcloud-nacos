
package com.ikats.log;



import com.ikats.core.launch.STApplication;
import com.ikats.core.launch.constant.AppConstant;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * 日志服务

 */
@SpringCloudApplication
@EnableFeignClients(AppConstant.BASE_PACKAGES)
public class LogApplication {

	public static void main(String[] args) {
		STApplication.run(AppConstant.APPLICATION_LOG_NAME, LogApplication.class, args);
	}

}
