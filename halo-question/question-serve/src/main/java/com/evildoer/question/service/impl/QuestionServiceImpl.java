package com.evildoer.question.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.evildoer.question.dao.QuestionMapper;
import com.evildoer.question.service.IQuestionService;
import org.springframework.stereotype.Service;
import com.evildoer.question.model.entity.Question;

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

}
