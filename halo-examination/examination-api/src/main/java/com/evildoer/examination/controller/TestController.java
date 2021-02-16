package com.evildoer.examination.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

/**
 * @description: 接口测试类
 * @author: evildoer
 * @datetime: 2021/2/16 13:24
 */
@Slf4j
@RestController
@Api(tags = "test-接口文档")
public class TestController {


    @ApiOperation(value = "test-测试接口", notes = "测试接口")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "a", paramType = "path", value = "数字a", required = true, dataType = "path"),
            @ApiImplicitParam(name = "b", paramType = "path", value = "数字b", required = true, dataType = "path")
    })
    @GetMapping("/test/{a}/{b}")
    public Integer get(@PathVariable Integer a, @PathVariable Integer b) {
        log.info("test文档访问");
        return a + b;
    }
}