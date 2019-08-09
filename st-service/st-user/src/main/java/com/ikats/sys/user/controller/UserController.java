package com.ikats.sys.user.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.ikats.core.mp.support.Condition;
import com.ikats.core.mp.support.Query;
import com.ikats.core.secure.STUser;
import com.ikats.core.tool.api.R;
import com.ikats.core.tool.constant.STConstant;
import com.ikats.core.tool.utils.Func;
import com.ikats.sys.user.service.IUserService;
import com.ikats.sys.user.wrapper.UserWrapper;
import com.ikats.user.entity.User;
import com.ikats.user.vo.UserVO;
import io.swagger.annotations.*;
import lombok.AllArgsConstructor;

import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import javax.validation.Valid;
import java.util.Map;

/**
 * @author shnejian26@hotmail.com
 * @date 2019/7/11 18:34
 */
@RestController
@RequestMapping
@AllArgsConstructor
public class UserController {

    private IUserService userService;

    /**
     * 查询单条
     */
    @ApiOperationSupport(order = 1)
    @ApiOperation(value = "查看详情", notes = "传入id")
    @GetMapping("/detail")
    public R<UserVO> detail(User user) {
        User detail = userService.getOne(Condition.getQueryWrapper(user));
        return R.data(UserWrapper.build().entityVO(detail));
    }

    /**
     * 用户列表
     */
    @GetMapping("/list")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "account", value = "账号名", paramType = "query", dataType = "string"),
            @ApiImplicitParam(name = "realName", value = "姓名", paramType = "query", dataType = "string")
    })
    @ApiOperationSupport(order = 2)
    @ApiOperation(value = "列表", notes = "传入account和realName")
    public R<IPage<UserVO>> list(@ApiIgnore @RequestParam Map<String, Object> user, Query query, STUser bladeUser) {
        QueryWrapper<User> queryWrapper = Condition.getQueryWrapper(user, User.class);
        IPage<User> pages = userService.page(Condition.getPage(query), (!bladeUser.getTenantCode().equals(STConstant.ADMIN_TENANT_CODE)) ? queryWrapper.lambda().eq(User::getTenantCode, bladeUser.getTenantCode()) : queryWrapper);
        return R.data(UserWrapper.build().pageVO(pages));
    }

    /**
     * 新增或修改
     */
    @PostMapping("/submit")
    @ApiOperationSupport(order = 3)
    @ApiOperation(value = "新增或修改", notes = "传入User")
    public R submit(@Valid @RequestBody User user) {
        return R.status(userService.submit(user));
    }

    /**
     * 修改
     */
    @PostMapping("/update")
    @ApiOperationSupport(order = 4)
    @ApiOperation(value = "修改", notes = "传入User")
    public R update(@Valid @RequestBody User user) {
        return R.status(userService.updateById(user));
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ApiOperationSupport(order = 5)
    @ApiOperation(value = "删除", notes = "传入地基和")
    public R remove(@RequestParam String ids) {
        return R.status(userService.deleteLogic(Func.toIntList(ids)));
    }


    /**
     * 设置菜单权限
     *
     * @param userIds
     * @param roleIds
     * @return
     */
    @PostMapping("/grant")
    @ApiOperationSupport(order = 6)
    @ApiOperation(value = "权限设置", notes = "传入roleId集合以及menuId集合")
    public R grant(@ApiParam(value = "userId集合", required = true) @RequestParam String userIds,
                   @ApiParam(value = "roleId集合", required = true) @RequestParam String roleIds) {
        boolean temp = userService.grant(userIds, roleIds);
        return R.status(temp);
    }

    @PostMapping("/reset-password")
    @ApiOperationSupport(order = 7)
    @ApiOperation(value = "初始化密码", notes = "传入userId集合")
    public R resetPassword(@ApiParam(value = "userId集合", required = true) @RequestParam String userIds) {
        boolean temp = userService.resetPassword(userIds);
        return R.status(temp);
    }

}