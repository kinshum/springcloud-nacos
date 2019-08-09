
package com.ikats.system.vo;

import com.ikats.system.entity.Param;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;


/**
 * 视图实体类
 */
@Data
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "ParamVO对象", description = "ParamVO对象")
public class ParamVO extends Param {
	private static final long serialVersionUID = 1L;

}
