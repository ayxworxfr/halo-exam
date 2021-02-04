package com.evildoer.admin.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.evildoer.admin.model.entity.SysPermission;
import com.evildoer.admin.model.entity.SysRolePermission;
import com.evildoer.admin.model.vo.PermissionVO;
import com.evildoer.admin.service.ISysPermissionService;
import com.evildoer.admin.service.ISysRolePermissionService;
import com.evildoer.common.core.enums.QueryModeEnum;
import com.evildoer.common.core.result.Result;
import com.evildoer.common.core.result.ResultCode;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Api(tags = "权限接口")
@RestController
@RequestMapping("/api.admin/v1/permissions")
@AllArgsConstructor
public class PermissionController {

    private ISysPermissionService iSysPermissionService;

    private ISysRolePermissionService iSysRolePermissionService;

    @ApiOperation(value = "列表分页", httpMethod = "GET")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "queryMode", paramType = "query", dataType = "QueryModeEnum"),
            @ApiImplicitParam(name = "page", defaultValue = "1", value = "页码", paramType = "query", dataType = "Integer"),
            @ApiImplicitParam(name = "limit", defaultValue = "10", value = "每页数量", paramType = "query", dataType = "Integer"),
            @ApiImplicitParam(name = "name", value = "权限名称", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = "permission", value = "权限标识", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = "roleId", value = "角色ID", paramType = "query", dataType = "Long"),
            @ApiImplicitParam(name = "type", value = "权限类型", paramType = "query", dataType = "Integer"),
            @ApiImplicitParam(name = "menuId", value = "菜单ID", paramType = "query", dataType = "Long")
    })
    @GetMapping
    public Result list(
            String queryMode,
            Integer page,
            Integer limit,
            String name,
            String permission,
            Long roleId,
            Long menuId,
            Integer type
    ) {
        QueryModeEnum queryModeEnum = QueryModeEnum.getValue(queryMode);

        switch (queryModeEnum) {
            case TREE:
                LambdaQueryWrapper<SysPermission> queryWrapper = new LambdaQueryWrapper<SysPermission>()
                        .like(StrUtil.isNotBlank(name), SysPermission::getName, name)
                        .like(StrUtil.isNotBlank(permission), SysPermission::getPermission, permission)
                        .orderByDesc(SysPermission::getGmtModified)
                        .orderByDesc(SysPermission::getGmtCreate);

                List list = iSysPermissionService.listForTree(queryWrapper);
                PermissionVO permissionVO = new PermissionVO();
                permissionVO.setPermissions(list);
                List<Long> checkedKeys = iSysRolePermissionService.list(
                        new LambdaQueryWrapper<SysRolePermission>()
                                .eq(SysRolePermission::getRoleId, roleId)
                ).stream().map(item -> item.getPermissionId()).collect(Collectors.toList());
                permissionVO.setCheckedKeys(checkedKeys);
                return Result.success(permissionVO);
            case PAGE:
                IPage<SysPermission> result = iSysPermissionService.list(
                        new Page<>(page, limit),
                        new SysPermission()
                                .setPermission(permission)
                                .setMenuId(menuId)
                                .setName(name)
                                .setType(type)
                );
                return Result.success(result.getRecords(), result.getTotal());
            default:
                return Result.failed(ResultCode.QUERY_MODE_IS_NULL);
        }
    }

    @ApiOperation(value = "权限详情", httpMethod = "GET")
    @ApiImplicitParam(name = "id", value = "权限ID", required = true, paramType = "path", dataType = "Long")
    @GetMapping("/{id}")
    public Result detail(@PathVariable Long id) {
        SysPermission permission = iSysPermissionService.getById(id);
        return Result.success(permission);
    }

    @ApiOperation(value = "新增权限", httpMethod = "POST")
    @ApiImplicitParam(name = "permission", value = "实体JSON对象", required = true, paramType = "body", dataType = "SysPermission")
    @PostMapping
    public Result add(@RequestBody SysPermission permission) {
        boolean status = iSysPermissionService.save(permission);
        return Result.judge(status);
    }

    @ApiOperation(value = "修改权限", httpMethod = "PUT")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "权限id", required = true, paramType = "path", dataType = "Long"),
            @ApiImplicitParam(name = "permission", value = "实体JSON对象", required = true, paramType = "body", dataType = "SysPermission")
    })
    @PutMapping(value = "/{id}")
    public Result update(
            @PathVariable Long id,
            @RequestBody SysPermission permission) {
        boolean status = iSysPermissionService.updateById(permission);
        return Result.judge(status);
    }

    @ApiOperation(value = "删除权限", httpMethod = "DELETE")
    @ApiImplicitParam(name = "ids", value = "id集合", required = true, paramType = "query", allowMultiple = true, dataType = "Long")
    @DeleteMapping("/{ids}")
    public Result delete(@PathVariable String ids) {
        boolean status = iSysPermissionService.removeByIds(Arrays.asList(ids.split(",")));
        return Result.judge(status);
    }
}
