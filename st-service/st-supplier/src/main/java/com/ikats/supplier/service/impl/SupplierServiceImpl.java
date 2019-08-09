package com.ikats.supplier.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.ikats.supplier.entity.StSupplier;
import com.ikats.supplier.mapper.SupplierMapper;
import com.ikats.supplier.service.SupplierService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *
 * @author shenjian26@hotmail.com
 * @date 2019-07-25 11:44
 */
@Service
public class SupplierServiceImpl extends ServiceImpl<SupplierMapper, StSupplier> implements SupplierService {


    @Override
    public List<StSupplier> getList(String code) {
        return null;
    }

    @Override
    public void delete(String id) {

    }

    @Override
    public int update(String id) {
        return 0;
    }
}