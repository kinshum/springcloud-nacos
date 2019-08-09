package com.ikats.dict.dto;

import com.ikats.dict.entity.Dict;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 数据传输对象实体类
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class DictDTO extends Dict {
	private static final long serialVersionUID = 1L;

}
