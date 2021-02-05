package com.evildoer.admin.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.evildoer.admin.model.entity.OauthClientDetails;
import com.evildoer.admin.service.IOauthClientDetailsService;
import com.evildoer.common.core.result.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Api(tags = "客户端接口")
@RestController
@RequestMapping("/api.admin/v1/clients")
@Slf4j
@AllArgsConstructor
public class OauthClientDetailsController {

    private IOauthClientDetailsService iOauthClientDetailsService;

    @ApiOperation(value = "列表分页", httpMethod = "GET")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "page", value = "页码", paramType = "query", dataType = "Long"),
            @ApiImplicitParam(name = "limit", value = "每页数量", paramType = "query", dataType = "Long"),
            @ApiImplicitParam(name = "clientId", value = "客户端ID", paramType = "query", dataType = "String")
    })
    @GetMapping
    public Result list(Integer page,
                       Integer limit,
                       String clientId) {
        IPage<OauthClientDetails> result = iOauthClientDetailsService.page(
                new Page<>(page, limit),
                new LambdaQueryWrapper<OauthClientDetails>()
                        .like(StrUtil.isNotBlank(clientId), OauthClientDetails::getClientId, clientId));
        return Result.success(result.getRecords(), result.getTotal());
    }

    @ApiOperation(value = "客户端详情", httpMethod = "GET")
    @ApiImplicitParam(name = "clientId", value = "客户端id", required = true, paramType = "path", dataType = "String")
    @GetMapping("/{clientId}")
    public Result detail(@PathVariable String clientId) {
        OauthClientDetails client = iOauthClientDetailsService.getById(clientId);
        return Result.success(client);
    }

    @ApiOperation(value = "新增客户端", httpMethod = "POST")
    @ApiImplicitParam(name = "client", value = "实体JSON对象", required = true, paramType = "body", dataType = "OauthClientDetails")
    @PostMapping
    public Result add(@RequestBody OauthClientDetails client) {
        boolean status = iOauthClientDetailsService.save(client);
        return Result.judge(status);
    }

    @ApiOperation(value = "修改客户端", httpMethod = "PUT")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "clientId", value = "客户端id", required = true, paramType = "path", dataType = "String"),
            @ApiImplicitParam(name = "client", value = "实体JSON对象", required = true, paramType = "body", dataType = "OauthClientDetails")
    })
    @PutMapping(value = "/{clientId}")
    public Result update(
            @PathVariable String clientId,
            @RequestBody OauthClientDetails client) {
        boolean status = iOauthClientDetailsService.updateById(client);
        return Result.judge(status);
    }

    @ApiOperation(value = "删除客户端", httpMethod = "DELETE")
    @ApiImplicitParam(name = "ids[]", value = "id集合", required = true, paramType = "query", allowMultiple = true, dataType = "Long")
    @DeleteMapping
    public Result delete(@RequestParam("ids") List<String> ids) {
        boolean status = iOauthClientDetailsService.removeByIds(ids);
        return Result.judge(status);
    }
}
