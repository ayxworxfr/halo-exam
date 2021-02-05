package com.evildoer.examination.service.impl;

import com.evildoer.examination.model.entity.Subject;
import com.evildoer.examination.dao.SubjectMapper;
import com.evildoer.examination.service.ISubjectService;
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
public class SubjectServiceImpl extends ServiceImpl<SubjectMapper, Subject> implements ISubjectService {

}
