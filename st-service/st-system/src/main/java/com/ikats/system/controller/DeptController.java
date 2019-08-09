
package com.ikats.system.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ikats.core.boot.ctrl.STController;
import com.ikats.core.mp.support.Condition;
import com.ikats.core.secure.STUser;
import com.ikats.core.tool.api.R;
import com.ikats.core.tool.constant.STConstant;
import com.ikats.core.tool.node.INode;
import com.ikats.core.tool.utils.Func;
import com.ikats.system.entity.Dept;
import com.ikats.system.service.IDeptService;
import com.ikats.system.vo.DeptVO;
import com.ikats.system.wrapper.DeptWrapper;
import io.swagger.annotations.*;
import lombok.AllArgsConstructor;


import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

/**
 * 控制器
 */
@RestController
@AllArgsConstructor
@RequestMapping("/dept")
@Api(value = "部门", tags = "部门")
public class DeptController extends STController {

	private IDeptService deptService;

	/**
	 * 详情
	 */
	@GetMapping("/detail")
	@ApiOperationSupport(order = 1)
	@ApiOperation(value = "详情", notes = "传入dept")
	public R<DeptVO> detail(Dept dept) {
		Dept detail = deptService.getOne(Condition.getQueryWrapper(dept));
		return R.data(DeptWrapper.build().entityVO(detail));
	}

	/**
	 * 列表
	 */
	@GetMapping("/list")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "deptName", value = "部门名称", paramType = "query", dataType = "string"),
		@ApiImplicitParam(name = "fullName", value = "部门全称", paramType = "query", dataType = "string")
	})
	@ApiOperationSupport(order = 2)
	@ApiOperation(value = "列表", notes = "传入dept")
	public R<List<INode>> list(@ApiIgnore @RequestParam Map<String, Object> dept, STUser bladeUser) {
		QueryWrapper<Dept> queryWrapper = Condition.getQueryWrapper(dept, Dept.class);
		List<Dept> list = deptService.list((!bladeUser.getTenantCode().equals(STConstant.ADMIN_TENANT_CODE)) ? queryWrapper.lambda().eq(Dept::getTenantCode, bladeUser.getTenantCode()) : queryWrapper);
		return R.data(DeptWrapper.build().listNodeVO(list));
	}

	/**
	 * 获取部门树形结构
	 *
	 * @return
	 */
	@GetMapping("/tree")
	@ApiOperationSupport(order = 3)
	@ApiOperation(value = "树形结构", notes = "树形结构")
	public R<List<DeptVO>> tree(String tenantCode, STUser stUser) {
		List<DeptVO> tree = deptService.tree(Func.toStr(tenantCode, stUser.getTenantCode()));
		return R.data(tree);
	}

	/**
	 * 新增或修改
	 */
	@PostMapping("/submit")
	@ApiOperationSupport(order = 4)
	@ApiOperation(value = "新增或修改", notes = "传入dept")
	public R submit(@Valid @RequestBody Dept dept, STUser user) {
		if (Func.isEmpty(dept.getId())) {
			dept.setTenantCode(user.getTenantCode());
		}
		return R.status(deptService.saveOrUpdate(dept));
	}

	/**
	 * 删除
	 */
	@PostMapping("/remove")
	@ApiOperationSupport(order = 5)
	@ApiOperation(value = "删除", notes = "传入ids")
	public R remove(@ApiParam(value = "主键集合", required = true) @RequestParam String ids) {
		return R.status(deptService.removeByIds(Func.toIntList(ids)));
	}


}
