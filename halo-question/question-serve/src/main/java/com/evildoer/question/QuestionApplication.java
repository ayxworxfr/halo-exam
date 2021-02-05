package com.evildoer.question;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * @author: evildoer
 * @datetime: 2021/2/5 16:30
 */
@SpringBootApplication
@EnableDiscoveryClient
@MapperScan("com.evildoer.question.dao")
@EnableSwagger2
public class QuestionApplication {

    public static void main(String[] args) {
        SpringApplication.run(QuestionApplication.class);
    }
}
