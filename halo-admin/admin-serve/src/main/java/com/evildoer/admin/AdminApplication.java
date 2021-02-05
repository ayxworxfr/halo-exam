package com.evildoer.admin;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@EnableDiscoveryClient
@MapperScan("com.evildoer.admin.dao")
@EnableSwagger2
@SpringBootApplication(exclude= {DataSourceAutoConfiguration.class})
public class AdminApplication {
    public static void main(String[] args) {
        SpringApplication.run(com.evildoer.admin.AdminApplication.class);
    }
}
