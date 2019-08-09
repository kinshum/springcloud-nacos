package com.ikats.system.dto;

import com.ikats.system.entity.Role;
import lombok.Data;
import lombok.EqualsAndHashCode;


/**
 * 数据传输对象实体类
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class RoleDTO extends Role {
	private static final long serialVersionUID = 1L;

}
