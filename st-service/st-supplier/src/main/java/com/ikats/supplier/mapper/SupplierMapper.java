package com.ikats.supplier.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ikats.supplier.entity.StSupplier;

/**
 * 供应商
 */
public interface SupplierMapper extends BaseMapper<StSupplier> {
    int deleteByPrimaryKey(Integer id);

    int insert(StSupplier record);

    int insertSelective(StSupplier record);

    StSupplier selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(StSupplier record);

    int updateByPrimaryKey(StSupplier record);
}