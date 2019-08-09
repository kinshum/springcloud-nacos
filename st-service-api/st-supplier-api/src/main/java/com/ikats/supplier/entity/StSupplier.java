package com.ikats.supplier.entity;

import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import com.ikats.core.mp.base.BaseEntity;
import io.swagger.annotations.ApiModel;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;


/**
 * 供应商实体类
 * st_supplier
 * @author 
 */
@Data
@TableName("st_supplier")
@ApiModel(value = "Supplier对象", description = "Supplier对象")
public class StSupplier implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;

    private String number;

    private String supplierName;

    private String supplierCode;

    private Integer status;

    private String appkey;

    private String createUser;

    private Date createTime;

    private String updateUser;

    private Date updateTime;

    /**
     * 是否已删除
     */
    @TableLogic
    private Integer isDeleted;


}