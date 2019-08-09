package com.ikats.desk.feign;

import com.ikats.core.launch.constant.AppConstant;
import com.ikats.core.tool.api.R;
import com.ikats.desk.entity.Notice;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;


/**
 * Notice Feign接口类
 */
@FeignClient(
	value = AppConstant.APPLICATION_DESK_NAME
)
public interface INoticeClient {

	String API_PREFIX = "/dashboard";

	/**
	 * 获取notice列表
	 *
	 * @param number
	 * @return
	 */
	@GetMapping(API_PREFIX + "/top")
	R<List<Notice>> top(@RequestParam("number") Integer number);

}
