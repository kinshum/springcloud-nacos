
package com.ikats.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.ikats.system.entity.Dept;
import com.ikats.system.vo.DeptVO;
import org.apache.ibatis.annotations.Mapper;


import java.util.List;

/**
 * Mapper 接口
 */

public interface DeptMapper extends BaseMapper<Dept> {

	/**
	 * 自定义分页
	 *
	 * @param page
	 * @param dept
	 * @return
	 */
	List<DeptVO> selectDeptPage(IPage page, DeptVO dept);

	/**
	 * 获取树形节点
	 *
	 * @param tenantCode
	 * @return
	 */
	List<DeptVO> tree(String tenantCode);

}
