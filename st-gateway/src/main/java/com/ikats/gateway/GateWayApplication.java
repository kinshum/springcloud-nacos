
package com.ikats.gateway;



import com.ikats.core.launch.STApplication;
import com.ikats.core.launch.constant.AppConstant;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * 项目启动
 */
@EnableHystrix
@EnableScheduling
@SpringCloudApplication
public class GateWayApplication {

	public static void main(String[] args) {
		STApplication.run(AppConstant.APPLICATION_GATEWAY_NAME, GateWayApplication.class, args);
	}

}
