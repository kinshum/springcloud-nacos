
package com.ikats.system.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.ikats.core.boot.ctrl.STController;
import com.ikats.core.mp.support.Condition;
import com.ikats.core.mp.support.Query;
import com.ikats.core.secure.STUser;
import com.ikats.core.tool.api.R;
import com.ikats.core.tool.constant.STConstant;
import com.ikats.core.tool.utils.Func;
import com.ikats.system.entity.Tenant;
import com.ikats.system.service.ITenantService;
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
@RequestMapping("/tenant")
@ApiIgnore
@Api(value = "租户管理", tags = "接口")
public class TenantController extends STController {

	private ITenantService tenantService;

	/**
	 * 详情
	 */
	@GetMapping("/detail")
	@ApiOperation(value = "详情", notes = "传入tenant")
	public R<Tenant> detail(Tenant tenant) {
		Tenant detail = tenantService.getOne(Condition.getQueryWrapper(tenant));
		return R.data(detail);
	}

	/**
	 * 分页
	 */
	@GetMapping("/list")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "tenantCode", value = "参数名称", paramType = "query", dataType = "string"),
		@ApiImplicitParam(name = "tenantName", value = "角色别名", paramType = "query", dataType = "string"),
		@ApiImplicitParam(name = "contactNumber", value = "联系电话", paramType = "query", dataType = "string")
	})
	@ApiOperation(value = "分页", notes = "传入tenant")
	public R<IPage<Tenant>> list(@ApiIgnore @RequestParam Map<String, Object> tenant, Query query, STUser bladeUser) {
		QueryWrapper<Tenant> queryWrapper = Condition.getQueryWrapper(tenant, Tenant.class);
		IPage<Tenant> pages = tenantService.page(Condition.getPage(query), (!bladeUser.getTenantCode().equals(STConstant.ADMIN_TENANT_CODE)) ? queryWrapper.lambda().eq(Tenant::getTenantCode, bladeUser.getTenantCode()) : queryWrapper);
		return R.data(pages);
	}

	/**
	 * 下拉数据源
	 */
	@GetMapping("/select")
	@ApiOperation(value = "下拉数据源", notes = "传入tenant")
	public R<List<Tenant>> select(Tenant tenant, STUser bladeUser) {
		QueryWrapper<Tenant> queryWrapper = Condition.getQueryWrapper(tenant);
		List<Tenant> list = tenantService.list((!bladeUser.getTenantCode().equals(STConstant.ADMIN_TENANT_CODE)) ? queryWrapper.lambda().eq(Tenant::getTenantCode, bladeUser.getTenantCode()) : queryWrapper);
		return R.data(list);
	}

	/**
	 * 自定义分页
	 */
	@GetMapping("/page")
	@ApiOperation(value = "分页", notes = "传入tenant")
	public R<IPage<Tenant>> page(Tenant tenant, Query query) {
		IPage<Tenant> pages = tenantService.selectTenantPage(Condition.getPage(query), tenant);
		return R.data(pages);
	}

	/**
	 * 新增或修改
	 */
	@PostMapping("/submit")
	@ApiOperation(value = "新增或修改", notes = "传入tenant")
	public R submit(@Valid @RequestBody Tenant tenant) {
		return R.status(tenantService.saveTenant(tenant));
	}


	/**
	 * 删除
	 */
	@PostMapping("/remove")
	@ApiOperation(value = "逻辑删除", notes = "传入ids")
	public R remove(@ApiParam(value = "主键集合", required = true) @RequestParam String ids) {
		return R.status(tenantService.deleteLogic(Func.toIntList(ids)));
	}


}
