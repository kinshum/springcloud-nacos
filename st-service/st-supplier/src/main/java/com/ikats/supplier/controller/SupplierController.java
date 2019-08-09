package com.ikats.supplier.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.ikats.core.mp.support.Condition;
import com.ikats.core.mp.support.Query;
import com.ikats.core.tool.api.R;
import com.ikats.core.tool.utils.Func;
import com.ikats.supplier.entity.StSupplier;
import com.ikats.supplier.service.SupplierService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import java.util.List;
import java.util.Map;

/**
 * 供应商
 * @author shenjian26@hotmail.com
 * @date 2019-07-14 23:38
 */
@RestController
@RequestMapping("equipment/supplier")
@AllArgsConstructor
public class SupplierController {

    public SupplierService service;

    @PostMapping("/add")
    public R info(@RequestBody StSupplier stSupplier) {
        return R.data(service.save(stSupplier));
    }


    /**
     * 修改
     */
    @PostMapping("/edit")
    public R edit(@RequestBody StSupplier stSupplier) {
        return R.status(service.updateById(stSupplier));
    }

    /**
     * 删除
     */
    @PostMapping("/del")
    public R remove(@RequestParam String ids) {
        return R.status(service.removeByIds(Func.toIntList(ids)));
    }

    /**
     * 详情
     */
    @GetMapping("/detail")
    public R<StSupplier> detail(Integer id) {
        StSupplier stSupplier = service.getById(id);
        return R.data(stSupplier);
    }

    /**
     * 查询多条
     */
    @GetMapping("/list")
    public R<List<StSupplier>> list(StSupplier stSupplier) {
        List<StSupplier> list = service.list((Wrappers.query(stSupplier)));
        return R.data(list);
    }

    /**
     * 分页
     */
    @GetMapping("/page")
    public R<IPage<StSupplier>> page(@ApiIgnore @RequestParam Map<String, Object> blog, Query query) {
        IPage<StSupplier> pages = service.page(Condition.getPage(query), Condition.getQueryWrapper(blog, StSupplier.class));
        return R.data(pages);
    }

}
