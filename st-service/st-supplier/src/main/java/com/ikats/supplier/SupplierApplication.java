package com.ikats.supplier;

import com.ikats.common.constant.AppServiceConstant;
import com.ikats.core.launch.STApplication;
import com.ikats.core.launch.constant.AppConstant;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * 供应商已启类
 * @author shenjian26@hotmail.com
 * @date 2019-07-14 23:17
 */
@SpringCloudApplication
@EnableFeignClients(AppConstant.BASE_PACKAGES)
public class SupplierApplication {

    public static void main(String[] args) {
        STApplication.run(AppServiceConstant.APPLICATION_SUPPLIER_NAME,SupplierApplication.class,args);
    }

}
