package com.evildoer.examination.handler;

import com.evildoer.common.core.result.Result;
import com.alibaba.csp.sentinel.slots.block.BlockException;


public class GlobalBlockHandler {

    public static Result handlerException(BlockException exception) {
        return  Result.success("按照客户自定义的Global 全局异常处理 ---- 1");
    }
}
