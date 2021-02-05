package com.evildoer.examination.service.impl;

import com.evildoer.examination.model.entity.Exam;
import com.evildoer.examination.dao.ExamMapper;
import com.evildoer.examination.service.IExamService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
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
public class ExamServiceImpl extends ServiceImpl<ExamMapper, Exam> implements IExamService {

}
