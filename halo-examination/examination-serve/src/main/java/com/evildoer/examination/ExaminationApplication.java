package com.evildoer.examination;

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
@MapperScan("com.evildoer.examination.dao")
@EnableSwagger2
public class ExaminationApplication {

    public static void main(String[] args) {
        SpringApplication.run(ExaminationApplication.class);
    }
}
