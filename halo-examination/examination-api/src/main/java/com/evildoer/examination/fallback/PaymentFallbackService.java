package com.evildoer.examination.fallback;

import com.evildoer.common.core.result.Result;
import com.evildoer.examination.api.PaymentService;
import org.springframework.stereotype.Component;

/**
 * @author: evildoer
 * @datetime: 2021/2/2 16:46
 */
@Component
public class PaymentFallbackService implements PaymentService {

    @Override
    public Result paymentSQL(Long id) {
        return Result.failed("服务降级返回，---PaymentFallbackService");
    }
}
