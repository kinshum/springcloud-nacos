
package com.ikats.desk.feign;

import com.ikats.core.tool.api.R;
import com.ikats.desk.entity.Notice;
import com.ikats.desk.mapper.NoticeMapper;
import lombok.AllArgsConstructor;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.annotations.ApiIgnore;

import java.util.List;

/**
 * Notice Feign
 */
@ApiIgnore()
@RestController
@AllArgsConstructor
public class NoticeClient implements INoticeClient {

	NoticeMapper mapper;

	@Override
	@GetMapping(API_PREFIX + "/top")
	public R<List<Notice>> top(Integer number) {
		return R.data(mapper.topList(number));
	}

}
