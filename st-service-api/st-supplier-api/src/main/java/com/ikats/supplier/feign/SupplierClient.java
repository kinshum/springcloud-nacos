package com.ikats.supplier.feign;

import com.ikats.common.constant.CommonConstant;
import com.ikats.core.tool.api.R;
import com.ikats.supplier.entity.StSupplier;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author shenjian26@hotmail.com
 * @date 2019-07-26 19:48
 */
@FeignClient(
        //定义Feign指向的service-id
        value = CommonConstant.APPLICATION_SUPPLIER_NAME
)
public interface SupplierClient {

    /**
     * 接口前缀
     */
    String API_PREFIX = "/equipment/supplier";

    /**
     * 获取详情
     *
     * @param id 主键
     * @return
     */
    @GetMapping(API_PREFIX + "/detail")
    R<StSupplier> detail(@RequestParam("id") Integer id);


}
