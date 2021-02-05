package com.evildoer.admin.service.impl;

import com.evildoer.admin.dao.ClassUserMapper;
import com.evildoer.admin.model.entity.ClassUser;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.evildoer.admin.service.IClassUserService;
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
public class ClassUserServiceImpl extends ServiceImpl<ClassUserMapper, ClassUser> implements IClassUserService {

}
