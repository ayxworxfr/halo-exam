package com.evildoer.examination.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.evildoer.examination.model.entity.Exam;
import com.evildoer.examination.dao.ExamMapper;
import com.evildoer.examination.model.query.ExamQuery;
import com.evildoer.examination.service.IExamService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

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
public class ExamServiceImpl extends ServiceImpl<ExamMapper, Exam> implements IExamService {
    
    @Override
    public PageInfo<Exam> list(ExamQuery query) {
        LambdaQueryWrapper<Exam> queryWrapper = new LambdaQueryWrapper<Exam>()
                .eq(query.getPublish() != null, Exam::getPublish, query.getPublish())
                .orderByAsc(Exam::getStartTime);
        PageHelper.startPage(query.getPage(), query.getPageSize());
        List<Exam> list = this.list(queryWrapper);
        return new PageInfo<Exam>(list);
    }


}
