package com.atguigu.springcloud.config;

import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

/**
 * @author mingxiao
 * @create 2022-04-20 5:04 PM
 */
@Configuration
public class ApplicationContextConfig {

    @Bean
    @LoadBalanced //让这个RestTemplate在请求时拥有客户端负载均衡的能力
    public RestTemplate getRestTemplate(){
        return new RestTemplate();
    }

}
