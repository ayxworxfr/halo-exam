package com.evildoer.examination.service;

import com.evildoer.examination.model.entity.Exam;
import com.baomidou.mybatisplus.extension.service.IService;
import com.evildoer.examination.model.query.ExamQuery;
import com.github.pagehelper.PageInfo;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author evildoer
 * @since 2021-02-05
 */
public interface IExamService extends IService<Exam> {

    PageInfo<Exam> list(ExamQuery query);
}
