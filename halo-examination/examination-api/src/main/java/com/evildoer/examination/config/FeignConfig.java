package com.evildoer.examination.config;

import feign.Logger;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @description: FeignConfig
 * @author: evildoer
 * @datetime: 2021/1/27 19:46
 */
@Configuration
public class FeignConfig {

    @Bean
    Logger.Level feignLoggerLevel() {
        return  Logger.Level.FULL;
    }

}
