package com.evildoer.examination.handler;

import com.alibaba.csp.sentinel.slots.block.BlockException;
import com.evildoer.common.core.result.Result;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PathVariable;

@Component
public class GlobalFallback {

    public Result handlerFallback2(@PathVariable Long id, Throwable e) {
        return Result.failed("GlobalFallback，exception内容： " + e.getMessage());
    }

    public static Result handlerFallback(Object... objects) {
        return  Result.success("按照客户自定义的Glogal 全局降级处理 ---- 1");
    }
}
