
package com.ikats.log.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.ikats.core.log.model.LogApi;
import com.ikats.log.mapper.LogApiMapper;
import com.ikats.log.service.ILogApiService;


import org.springframework.stereotype.Service;

/**
 * 服务实现类
 */
@Service
public class LogApiServiceImpl extends ServiceImpl<LogApiMapper, LogApi> implements ILogApiService {


}
