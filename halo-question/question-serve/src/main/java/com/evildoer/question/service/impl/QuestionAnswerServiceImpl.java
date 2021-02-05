package com.evildoer.question.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.evildoer.question.dao.QuestionAnswerMapper;
import com.evildoer.question.model.entity.QuestionAnswer;
import com.evildoer.question.service.IQuestionAnswerService;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author evildoer
 * @since 2021-02-05
 */
@Service
public class QuestionAnswerServiceImpl extends ServiceImpl<QuestionAnswerMapper, QuestionAnswer> implements IQuestionAnswerService {

}
