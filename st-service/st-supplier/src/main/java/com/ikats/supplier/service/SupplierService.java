package com.ikats.supplier.service;

import com.baomidou.mybatisplus.extension.service.IService;

import com.ikats.supplier.entity.StSupplier;

import java.util.List;


/**
 * @author shenjian26@hotmail.com
 * @date 2019-07-15 19:12
 */
public interface SupplierService extends IService<StSupplier> {

    /**
     * 获取供应商列表
     *
     * @param code 字典编号
     * @return
     */
    List<StSupplier> getList(String code);

    /**
     * 供应商删除
     * @param id
     * @return
     */
    void delete(String id);

    /**
     * 供应商更新
     * @param id
     * @return
     */
    int update(String id);




}
