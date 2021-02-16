package com.evildoer.examination.controller;


import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.evildoer.common.core.enums.QueryMode;
import com.evildoer.common.core.result.Result;
import com.evildoer.examination.model.entity.Exam;
import com.evildoer.examination.model.query.ExamQuery;
import com.evildoer.examination.model.vo.ExamVo;
import com.evildoer.examination.service.IExamService;
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

@Api(tags = "考试接口")
@RestController
@RequestMapping("/categories")
@Slf4j
@AllArgsConstructor
public class ExamController {

    private IExamService examService;

    @ApiOperation(value = "试卷分页", httpMethod = "GET")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "queryMode", paramType = "query", dataType = "String"),
    })
    @GetMapping
    public Result list(@RequestBody ExamQuery query) {
        QueryMode mode = QueryMode.getValue(query.getQueryMode());
        Exam exam = new Exam();
        PageInfo<Exam> list;
        switch (mode) {
            default:
                list = examService.list(query);
                return Result.success(list);
        }
    }

    @ApiOperation(value = "考试详情", httpMethod = "GET")
    @ApiImplicitParam(name = "id", value = "考试id", required = true, paramType = "path", dataType = "Long")
    @GetMapping("/{id}")
    public Result detail(@PathVariable Integer id) {
        Exam exam = examService.getById(id);
        return Result.success(exam);
    }

    @ApiOperation(value = "新增考试", httpMethod = "POST")
    @ApiImplicitParam(name = "exam", value = "实体JSON对象", required = true, paramType = "body", dataType = "Exam")
    @PostMapping
    public Result add(@RequestBody Exam exam) {
        examService.save(exam);
        ExamVo examVO = new ExamVo();
        BeanUtil.copyProperties(exam, examVO);
        return Result.success(examVO);
    }

    @ApiOperation(value = "修改考试", httpMethod = "PUT")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "考试id", required = true, paramType = "path", dataType = "Long"),
            @ApiImplicitParam(name = "exam", value = "实体JSON对象", required = true, paramType = "body", dataType = "Exam")
    })
    @PutMapping(value = "/{id}")
    public Result update(
            @PathVariable Integer id,
            @RequestBody Exam exam) {
        examService.updateById(exam);
        return Result.success(exam);
    }

    @ApiOperation(value = "删除考试", httpMethod = "DELETE")
    @ApiImplicitParam(name = "ids", value = "id集合,以英文逗号','分隔", required = true, paramType = "query", allowMultiple = true, dataType = "String")
    @DeleteMapping
    public Result delete(@RequestParam String ids) {
        examService.removeByIds(Arrays.asList(ids.split(",")).stream().map(id -> Long.parseLong(id)).collect(Collectors.toList()));
        return Result.success();
    }

    @ApiOperation(value = "修改考试(部分更新)", httpMethod = "PATCH")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "用户id", required = true, paramType = "path", dataType = "Long"),
            @ApiImplicitParam(name = "exam", value = "实体JSON对象", required = true, paramType = "body", dataType = "Exam")
    })
    @PatchMapping(value = "/{id}")
    public Result patch(@PathVariable Integer id, @RequestBody Exam exam) {
        LambdaUpdateWrapper<Exam> luw = new LambdaUpdateWrapper<Exam>().eq(Exam::getId, id);
        if (exam.getPublish() != null) { // 状态更新
            luw.set(Exam::getPublish, exam.getPublish());
        }
        boolean update = examService.update(luw);
        return Result.success(update);
    }
}
