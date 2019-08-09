
package com.ikats.system.feign;


import com.ikats.core.tool.api.R;
import com.ikats.dict.entity.Dict;
import com.ikats.dict.feign.IDictClient;
import com.ikats.system.service.IDictService;
import lombok.AllArgsConstructor;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.annotations.ApiIgnore;

import java.util.List;


/**
 * 字典服务Feign实现类
 */
@ApiIgnore
@RestController
@AllArgsConstructor
public class DictClient implements IDictClient {

	IDictService service;

	@Override
	@GetMapping(API_PREFIX + "/getValue")
	public R<String> getValue(String code, Integer dictKey) {
		return R.data(service.getValue(code, dictKey));
	}

	@Override
	@GetMapping(API_PREFIX + "/getList")
	public R<List<Dict>> getList(String code) {
		return R.data(service.getList(code));
	}

}
