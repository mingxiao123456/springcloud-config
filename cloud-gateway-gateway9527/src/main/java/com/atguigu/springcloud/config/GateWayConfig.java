package com.atguigu.springcloud.config;

import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author mingxiao
 * @create 2022-04-24 9:13 AM
 */
@Configuration
public class GateWayConfig {
    @Bean
    public RouteLocator customrouteLocator(RouteLocatorBuilder routeLocatorBuilder){
        RouteLocatorBuilder.Builder routes = routeLocatorBuilder.routes();
        routes.route("path_route_atguigu",r -> r.path("/guonei").uri("http://news.baidu.com/guonei"));
        return routes.build();
    }

    @Bean
    public RouteLocator customrouteLocator2(RouteLocatorBuilder routeLocatorBuilder){
        RouteLocatorBuilder.Builder routes = routeLocatorBuilder.routes();
        routes.route("path_route_atguigu2",r -> r.path("/guoji").uri("http://news.baidu.com/guoji"));
        return routes.build();
    }
}
