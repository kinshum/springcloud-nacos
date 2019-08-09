
package com.ikats.system.wrapper;

import com.ikats.common.constant.CommonConstant;
import com.ikats.core.mp.support.BaseEntityWrapper;
import com.ikats.core.tool.node.ForestNodeMerger;
import com.ikats.core.tool.node.INode;
import com.ikats.core.tool.utils.BeanUtil;
import com.ikats.core.tool.utils.Func;
import com.ikats.core.tool.utils.SpringUtil;
import com.ikats.dict.entity.Dict;
import com.ikats.dict.vo.DictVO;
import com.ikats.system.service.IDictService;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 包装类,返回视图层所需的字段
 */
public class DictWrapper extends BaseEntityWrapper<Dict, DictVO> {

	private static IDictService dictService;

	static {
		dictService = SpringUtil.getBean(IDictService.class);
	}

	public static DictWrapper build() {
		return new DictWrapper();
	}

	@Override
	public DictVO entityVO(Dict dict) {
		DictVO dictVO = BeanUtil.copy(dict, DictVO.class);
		if (Func.equals(dict.getParentId(), CommonConstant.TOP_PARENT_ID)) {
			dictVO.setParentName(CommonConstant.TOP_PARENT_NAME);
		} else {
			Dict parent = dictService.getById(dict.getParentId());
			dictVO.setParentName(parent.getDictValue());
		}
		return dictVO;
	}

	public List<INode> listNodeVO(List<Dict> list) {
		List<INode> collect = list.stream().map(dict -> BeanUtil.copy(dict, DictVO.class)).collect(Collectors.toList());
		return ForestNodeMerger.merge(collect);
	}

}
