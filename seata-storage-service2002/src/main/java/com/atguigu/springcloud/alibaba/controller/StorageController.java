package com.atguigu.springcloud.alibaba.controller;

import com.atguigu.springcloud.alibaba.domain.Storage;
import com.atguigu.springcloud.alibaba.service.StorageService;
import com.atguigu.springcloud.entities.CommonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author mingxiao
 * @create 2022-04-29 1:46 PM
 */
@RestController
public class StorageController {
    @Autowired
    private StorageService storageService;

    @RequestMapping(value = "/storage/decrease",produces = "application/json; charset=utf-8")
    public CommonResult decrease(@RequestParam("productId") Long productId, @RequestParam("count") Integer count){
        storageService.decrease(productId,count);
        return new CommonResult(200,"扣减库存成功！");
    }
}
