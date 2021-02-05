package com.evildoer.examination.service.impl;

import com.evildoer.examination.model.entity.UndoLog;
import com.evildoer.examination.dao.UndoLogMapper;
import com.evildoer.examination.service.IUndoLogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * AT transaction mode undo table 服务实现类
 * </p>
 *
 * @author evildoer
 * @since 2021-02-05
 */
@Service
public class UndoLogServiceImpl extends ServiceImpl<UndoLogMapper, UndoLog> implements IUndoLogService {

}
