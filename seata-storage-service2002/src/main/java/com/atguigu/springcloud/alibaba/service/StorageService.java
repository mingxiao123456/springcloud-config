package com.atguigu.springcloud.alibaba.service;

/**
 * @author mingxiao
 * @create 2022-04-29 11:26 AM
 */
public interface StorageService {
    /**
     * 扣减库存
     */
    void decrease(Long productId,Integer count);
}
