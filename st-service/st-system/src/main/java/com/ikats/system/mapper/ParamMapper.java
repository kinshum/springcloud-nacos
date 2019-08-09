
package com.ikats.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.ikats.system.entity.Param;
import com.ikats.system.vo.ParamVO;
import org.apache.ibatis.annotations.Mapper;


import java.util.List;

/**
 * Mapper 接口
 */

public interface ParamMapper extends BaseMapper<Param> {

	/**
	 * 自定义分页
	 *
	 * @param page
	 * @param param
	 * @return
	 */
	List<ParamVO> selectParamPage(IPage page, ParamVO param);

}
