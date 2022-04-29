package com.atguigu.springcloud.alibaba.service;

import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;

/**
 * @author mingxiao
 * @create 2022-04-29 2:14 PM
 */
public interface AccountService {
    void decrease(@Param("userId") Long userId, @Param("BigDecimal") BigDecimal money);
}
