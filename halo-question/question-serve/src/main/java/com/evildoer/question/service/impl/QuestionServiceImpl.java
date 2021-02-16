package com.evildoer.question.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.evildoer.question.dao.QuestionMapper;
import com.evildoer.question.model.query.QuestionQuery;
import com.evildoer.question.service.IQuestionService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import com.evildoer.question.model.entity.Question;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author evildoer
 * @since 2021-02-05
 */
@Service
public class QuestionServiceImpl extends ServiceImpl<QuestionMapper, Question> implements IQuestionService {

    @Override
    public PageInfo<Question> list(QuestionQuery query) {
        LambdaQueryWrapper<Question> queryWrapper = new LambdaQueryWrapper<Question>()
                .eq(query.getStatus() != null, Question::getStatus, query.getStatus())
                .orderByDesc(Question::getGmtCreate);
        PageHelper.startPage(query.getPage(), query.getPageSize());
        List<Question> list = this.list(queryWrapper);
        return new PageInfo<Question>(list);
    }
}
