
package com.ikats.system.wrapper;


import com.ikats.common.constant.CommonConstant;
import com.ikats.core.mp.support.BaseEntityWrapper;
import com.ikats.core.tool.node.ForestNodeMerger;
import com.ikats.core.tool.node.INode;
import com.ikats.core.tool.utils.BeanUtil;
import com.ikats.core.tool.utils.Func;
import com.ikats.core.tool.utils.SpringUtil;
import com.ikats.system.entity.Dept;
import com.ikats.system.service.IDeptService;
import com.ikats.system.vo.DeptVO;


import java.util.List;
import java.util.stream.Collectors;

/**
 * 包装类,返回视图层所需的字段

 */
public class DeptWrapper extends BaseEntityWrapper<Dept, DeptVO> {

	private static IDeptService deptService;

	static {
		deptService = SpringUtil.getBean(IDeptService.class);
	}

	public static DeptWrapper build() {
		return new DeptWrapper();
	}

	@Override
	public DeptVO entityVO(Dept dept) {
		DeptVO deptVO = BeanUtil.copy(dept, DeptVO.class);
		if (Func.equals(dept.getParentId(), CommonConstant.TOP_PARENT_ID)) {
			deptVO.setParentName(CommonConstant.TOP_PARENT_NAME);
		} else {
			Dept parent = deptService.getById(dept.getParentId());
			deptVO.setParentName(parent.getDeptName());
		}
		return deptVO;
	}

	public List<INode> listNodeVO(List<Dept> list) {
		List<INode> collect = list.stream().map(dept -> BeanUtil.copy(dept, DeptVO.class)).collect(Collectors.toList());
		return ForestNodeMerger.merge(collect);
	}

}
