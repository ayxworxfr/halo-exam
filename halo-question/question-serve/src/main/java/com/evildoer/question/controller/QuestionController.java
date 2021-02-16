package com.evildoer.question.controller;


import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.evildoer.common.core.enums.QueryMode;
import com.evildoer.common.core.result.Result;
import com.evildoer.question.model.entity.Question;
import com.evildoer.question.model.query.QuestionQuery;
import com.evildoer.question.service.IQuestionService;
import com.github.pagehelper.PageInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;


@Api(tags = "题目接口")
@RestController
@RequestMapping("/api.admin/v1/question")
@Slf4j
@AllArgsConstructor
public class QuestionController {

    private IQuestionService questionService;

    @ApiOperation(value = "列表分页", httpMethod = "GET")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "queryMode", value = "查询模式", paramType = "query", dataType = "QueryModeEnum"),
            @ApiImplicitParam(name = "page", value = "页码", paramType = "query", dataType = "Long"),
            @ApiImplicitParam(name = "limit", value = "每页数量", paramType = "query", dataType = "Long"),
            @ApiImplicitParam(name = "title", value = "题目标题", paramType = "query", dataType = "String")
    })
    @GetMapping
    public Result list(@RequestBody QuestionQuery query) {
        QueryMode mode = QueryMode.getValue(query.getQueryMode());
        List<Question> list;
        switch (mode) {
            //case CASCADER:
            //    list = questionService.listForCascader(query);
            //    return Result.success(list);
            //case TREE:
            //    list = questionService.listForTree(query);
            //    return Result.success(list);
            default:
                PageInfo<Question> result = questionService.list(query);
                return Result.success(result);
        }
    }

    @ApiOperation(value = "题目详情", httpMethod = "GET")
    @ApiImplicitParam(name = "id", value = "题目id", required = true, paramType = "path", dataType = "Long")
    @GetMapping("/{id}")
    public Result detail(@PathVariable Long id) {
        Question result = questionService.getById(id);
        return Result.success(result);
    }


    @ApiOperation(value = "新增题目", httpMethod = "POST")
    @ApiImplicitParam(name = "spuBO", value = "实体JSON对象", required = true, paramType = "body", dataType = "QuestionBO")
    @PostMapping
    public Result add(@RequestBody Question question) {
        boolean status = questionService.saveOrUpdate(question);
        return Result.judge(status);
    }

    @ApiOperation(value = "修改题目", httpMethod = "PUT")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "题目id", required = true, paramType = "path", dataType = "Long"),
            @ApiImplicitParam(name = "spu", value = "实体JSON对象", required = true, paramType = "body", dataType = "Question")
    })
    @PutMapping(value = "/{id}")
    public Result update(
            @PathVariable Long id,
            @RequestBody Question question) {
        boolean status = questionService.updateById(question);
        return Result.judge(status);
    }

    @ApiOperation(value = "删除题目", httpMethod = "DELETE")
    @ApiImplicitParam(name = "ids", value = "id集合,以英文逗号','分隔", required = true, paramType = "query", allowMultiple = true, dataType = "String")
    @DeleteMapping("/{ids}")
    public Result delete(@PathVariable String ids) {
        questionService.removeByIds(Arrays.asList(ids.split(",")).stream().map(id -> Long.parseLong(id)).collect(Collectors.toList()));
        return Result.success();
    }

    @ApiOperation(value = "修改题目(部分更新)", httpMethod = "PATCH")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "用户id", required = true, paramType = "path", dataType = "Long"),
            @ApiImplicitParam(name = "spu", value = "实体JSON对象", required = true, paramType = "body", dataType = "Question")
    })
    @PatchMapping(value = "/{id}")
    public Result patch(@PathVariable Integer id, @RequestBody Question spu) {
        LambdaUpdateWrapper<Question> updateWrapper = new LambdaUpdateWrapper<Question>().eq(Question::getId, id);
        if (spu.getStatus() != null) { // 状态更新
            updateWrapper.set(Question::getStatus, spu.getStatus());
        }
        boolean update = questionService.update(updateWrapper);
        return Result.success(update);
    }
}
