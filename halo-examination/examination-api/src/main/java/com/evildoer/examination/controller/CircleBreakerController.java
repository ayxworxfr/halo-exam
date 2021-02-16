package com.evildoer.examination.controller;

import com.alibaba.csp.sentinel.annotation.SentinelResource;
import com.alibaba.csp.sentinel.slots.block.BlockException;
import com.evildoer.common.core.result.Result;
import com.evildoer.examination.api.PaymentService;
import com.evildoer.examination.handler.GlobalBlockHandler;
import com.evildoer.examination.handler.GlobalFallback;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import javax.annotation.Resource;


/**
 * @author: evildoer
 * @datetime: 2021/2/2 16:46
 */
@RestController
@Slf4j
public class CircleBreakerController {

    @Value("${service-url.nacos-service}")
    private String SERVICE_URL;

    @Resource
    private RestTemplate restTemplate;


    @GetMapping("/testA")
    @SentinelResource(value = "testA")
    //@SentinelResource(value = "testA",blockHandler = "handleException")
    public Result testA() {
        return Result.success("/testA");
    }

    //public Result handleException(BlockException exception) {
    //    return  Result.failed(exception.getClass().getCanonicalName() + " 服务不可用");
    //}

    /**
     * fallback 处理Java异常(可以使用exceptionsToIgnore忽略Java异常)
     * blockHandler处理Sentinel配置异常
     * @author: evildoer
     * @datetime: 2021/2/2 18:47
     */
    @RequestMapping("/consumer/fallback/{id}")
    //@SentinelResource(value = "fallback")
    //@SentinelResource(value = "fallback",fallback ="handlerFallback")
    @SentinelResource(value = "fallback",fallback ="handlerFallback",blockHandler = "blockHandler")
    //@SentinelResource(value = "fallback",
    //        fallbackClass = GlobalFallback.class, fallback = "handlerFallback2",
    //        blockHandlerClass = GlobalBlockHandler.class,blockHandler = "handlerException")
    //@SentinelResource(value = "fallback",fallback ="handlerFallback",blockHandler = "blockHandler", exceptionsToIgnore = {IllegalArgumentException.class})
    public Result fallback(@PathVariable Long id) {
        Result result = restTemplate.getForObject(SERVICE_URL + "/paymentSQL/" + id, Result.class,id);

        if(id == 4){
            throw new IllegalArgumentException("IllegalArgument ,非法参数异常...");
        }else if(result.getData() == null) {
            throw new NullPointerException("NullPointerException,该ID没有对应记录，空指针异常");
        }

        return  result;
    }


    public Result handlerFallback(@PathVariable Long id, Throwable e) {
        return Result.failed("异常handlerFallback，exception内容： " + e.getMessage());
    }


    public Result blockHandler(@PathVariable Long id, BlockException e) {
        return Result.failed("blockHandler-sentinel 限流，BlockException： " + e.getMessage());
    }


    //======= OpenFeign
    @Resource
    private PaymentService paymentService;

    @GetMapping(value = "/consumer/paymentSQL/{id}")
    public Result paymentSQL(@PathVariable("id") Long id){
        return paymentService.paymentSQL(id);
    }

}
