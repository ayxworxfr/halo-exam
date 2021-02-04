package com.evildoer.admin.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.evildoer.admin.mapper.OauthClientDetailsMapper;
import com.evildoer.admin.model.entity.OauthClientDetails;
import com.evildoer.admin.service.IOauthClientDetailsService;
import org.springframework.stereotype.Service;

/**
 * @author haoxr
 * @date 2020-11-06
 */
@Service
public class OauthClientDetailsServiceImpl extends ServiceImpl<OauthClientDetailsMapper, OauthClientDetails> implements IOauthClientDetailsService {
}
