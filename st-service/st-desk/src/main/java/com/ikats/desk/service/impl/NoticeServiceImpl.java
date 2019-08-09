
package com.ikats.desk.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.ikats.core.mp.base.BaseServiceImpl;
import com.ikats.desk.entity.Notice;
import com.ikats.desk.mapper.NoticeMapper;
import com.ikats.desk.service.INoticeService;


import org.springframework.stereotype.Service;

/**
 * 服务实现类
 */
@Service
public class NoticeServiceImpl extends BaseServiceImpl<NoticeMapper, Notice> implements INoticeService {

	@Override
	public IPage<Notice> selectNoticePage(IPage<Notice> page, Notice notice) {
		return page.setRecords(baseMapper.selectNoticePage(page, notice));
	}

}
