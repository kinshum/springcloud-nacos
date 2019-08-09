
package com.ikats.desk.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.ikats.core.mp.base.BaseService;
import com.ikats.desk.entity.Notice;


/**
 * 服务类
 */
public interface INoticeService extends BaseService<Notice> {

	/**
	 * 自定义分页
	 * @param page
	 * @param notice
	 * @return
	 */
	IPage<Notice> selectNoticePage(IPage<Notice> page, Notice notice);

}
