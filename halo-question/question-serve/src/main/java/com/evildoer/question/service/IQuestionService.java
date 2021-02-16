package com.evildoer.question.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.evildoer.question.model.entity.Question;
import com.evildoer.question.model.query.QuestionQuery;
import com.github.pagehelper.PageInfo;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author evildoer
 * @since 2021-02-05
 */
public interface IQuestionService extends IService<Question> {

     PageInfo<Question> list(QuestionQuery query);

     //List<Question> listForCascader(QuestionQuery query);

     //List<Question> listForTree(QuestionQuery query);
}
