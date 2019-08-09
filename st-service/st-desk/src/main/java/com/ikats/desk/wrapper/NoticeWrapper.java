
package com.ikats.desk.wrapper;

import com.ikats.core.mp.support.BaseEntityWrapper;
import com.ikats.core.tool.api.R;
import com.ikats.core.tool.utils.BeanUtil;
import com.ikats.core.tool.utils.SpringUtil;
import com.ikats.desk.entity.Notice;
import com.ikats.desk.vo.NoticeVO;
import com.ikats.dict.feign.IDictClient;



/**
 * Notice包装类,返回视图层所需的字段
 */
public class NoticeWrapper extends BaseEntityWrapper<Notice, NoticeVO> {

	private static IDictClient dictClient;

	static {
		dictClient = SpringUtil.getBean(IDictClient.class);
	}

	public static NoticeWrapper build() {
		return new NoticeWrapper();
	}

	@Override
	public NoticeVO entityVO(Notice notice) {
		NoticeVO noticeVO = BeanUtil.copy(notice, NoticeVO.class);
		R<String> dict = dictClient.getValue("notice", noticeVO.getCategory());
		if (dict.isSuccess()) {
			String categoryName = dict.getData();
			noticeVO.setCategoryName(categoryName);
		}
		return noticeVO;
	}

}
