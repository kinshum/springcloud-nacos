
package com.ikats.system.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ikats.system.entity.Dept;
import com.ikats.system.vo.DeptVO;

import java.util.List;

/**
 * 服务类
 */
public interface IDeptService extends IService<Dept> {

	/**
	 * 自定义分页
	 *
	 * @param page
	 * @param dept
	 * @return
	 */
	IPage<DeptVO> selectDeptPage(IPage<DeptVO> page, DeptVO dept);

	/**
	 * 树形结构
	 *
	 * @param tenantCode
	 * @return
	 */
	List<DeptVO> tree(String tenantCode);

}
