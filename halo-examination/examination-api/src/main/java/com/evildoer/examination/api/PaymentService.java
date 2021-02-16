package com.evildoer.examination.api;

import com.evildoer.common.core.result.Result;
import com.evildoer.examination.fallback.PaymentFallbackService;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;


/**
 * @author: evildoer
 * @datetime: 2021/2/2 16:46
 */
@FeignClient(value = "halo-examination",fallback = PaymentFallbackService.class)
public interface PaymentService {

    @GetMapping(value = "/paymentSQL/{id}")
    public Result paymentSQL(@PathVariable("id") Long id);

}
