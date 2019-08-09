package com.ikats.auth.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 用户类型枚举
 */
@Getter
@AllArgsConstructor
public enum  STUserEnum {
    /**
     * web
     */
    WEB("web", 1),

    /**
     * app
     */
    APP("app", 2),
    ;

    final String name;
    final int category;
}
