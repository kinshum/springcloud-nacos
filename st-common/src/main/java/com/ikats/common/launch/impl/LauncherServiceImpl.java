package com.ikats.common.launch.impl;

import com.ikats.common.constant.CommonConstant;

import com.ikats.core.launch.service.LauncherService;
import org.springframework.boot.builder.SpringApplicationBuilder;

import java.util.Properties;

/**
 * 启动参数扩展
 * @author shnejian26@hotmail.com
 * @date 2019/7/11 12:52
 */

public class LauncherServiceImpl implements LauncherService {

    @Override
    public void launcher(SpringApplicationBuilder builder, String appName, String profile) {
        Properties props = System.getProperties();
        props.setProperty("spring.cloud.nacos.discovery.server-addr", CommonConstant.nacosAddr(profile));
        props.setProperty("spring.cloud.nacos.config.server-addr", CommonConstant.nacosAddr(profile));
        props.setProperty("spring.cloud.sentinel.transport.dashboard", CommonConstant.sentinelAddr(profile));
    }
}