package com.ikats.system.vo;

import com.ikats.system.entity.RoleMenu;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 视图实体类
 */
@Data
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "RoleMenuVO对象", description = "RoleMenuVO对象")
public class RoleMenuVO extends RoleMenu {
	private static final long serialVersionUID = 1L;

}
