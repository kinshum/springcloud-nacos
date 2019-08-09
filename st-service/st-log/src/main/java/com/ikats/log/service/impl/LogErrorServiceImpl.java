
package com.ikats.log.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ikats.core.log.model.LogError;
import com.ikats.log.mapper.LogErrorMapper;
import com.ikats.log.service.ILogErrorService;


import org.springframework.stereotype.Service;

/**
 * 服务实现类
 */
@Service
public class LogErrorServiceImpl extends ServiceImpl<LogErrorMapper, LogError> implements ILogErrorService {

}
