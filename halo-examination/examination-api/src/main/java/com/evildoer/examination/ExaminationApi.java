package com.evildoer.examination;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * @author: evildoer
 * @datetime: 2021/1/27 16:51
 */
@EnableFeignClients
@EnableDiscoveryClient
@SpringBootApplication
public class ExaminationApi {
    public static void main(String[] args) {
        SpringApplication.run(ExaminationApi.class, args);
    }
}
