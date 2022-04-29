package com.atguigu.springcloud.alibaba.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;

/**
 * @author mingxiao
 * @create 2022-04-29 2:12 PM
 */
@Mapper
public interface AccountDao {

    /**
     * 扣件余额账户
     * @param userId
     * @param money
     */
    void decrease(@Param("userId") Long userId, @Param("money") BigDecimal money);
}

