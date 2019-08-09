package com.ikats.log.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ikats.core.log.model.LogUsual;
import com.ikats.core.log.model.LogUsualVo;
import com.ikats.core.mp.support.Condition;
import com.ikats.core.mp.support.Query;
import com.ikats.core.tool.api.R;
import com.ikats.core.tool.utils.BeanUtil;
import com.ikats.core.tool.utils.Func;
import com.ikats.log.service.ILogUsualService;
import lombok.AllArgsConstructor;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.annotations.ApiIgnore;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 控制器
 */
@RestController
@AllArgsConstructor
@RequestMapping("/usual")
public class LogUsualController {

	private ILogUsualService logService;

	/**
	 * 查询单条
	 */
		@GetMapping("/detail")
		public R<LogUsual> detail(LogUsual log) {
		return R.data(logService.getOne(Condition.getQueryWrapper(log)));
	}

	/**
	 * 查询多条(分页)
	 */
	@GetMapping("/list")
	public R<IPage<LogUsualVo>> list(@ApiIgnore @RequestParam Map<String, Object> log, Query query) {
		IPage<LogUsual> pages = logService.page(Condition.getPage(query), Condition.getQueryWrapper(log, LogUsual.class));
		List<LogUsualVo> records = pages.getRecords().stream().map(logApi -> {
			LogUsualVo vo = BeanUtil.copy(logApi, LogUsualVo.class);
			vo.setStrId(Func.toStr(logApi.getId()));
			return vo;
		}).collect(Collectors.toList());
		IPage<LogUsualVo> pageVo = new Page<>(pages.getCurrent(), pages.getSize(), pages.getTotal());
		pageVo.setRecords(records);
		return R.data(pageVo);
	}

}
