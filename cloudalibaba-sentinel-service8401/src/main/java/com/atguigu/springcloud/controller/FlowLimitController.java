package com.atguigu.springcloud.controller;

import com.alibaba.csp.sentinel.annotation.SentinelResource;
import com.alibaba.csp.sentinel.slots.block.BlockException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.concurrent.TimeUnit;

/**
 * @author mingxiao
 * @create 2022-04-27 3:18 PM
 */
@RestController
@Slf4j
public class FlowLimitController {
    @GetMapping("/testA")
    public String testA(){
//        try {
//            TimeUnit.MILLISECONDS.sleep(800);
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//        }
        return "------testA";
    }

    @GetMapping("/testB")
    public String testB(){
        log.info(Thread.currentThread().getName() + "\t" +"......testB");
        return "------testB";
    }

//    @RequestMapping("/testD")
//    public String testD(){
//        try {
//            TimeUnit.SECONDS.sleep(6);
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//        }
//        return "testD 测试RT-------";
//    }

    @RequestMapping("/testD")
    public String testD(){
        System.out.println("testD 异常比例");
        int age = 10/0;
        return "testD-------";
    }

    @RequestMapping("/testE")
    public String testE(){
        System.out.println("testE 测试异常数");
        int age = 10/0;
        return "testE-------";
    }

    @RequestMapping("testHotKey")
    @SentinelResource(value = "testHotKey",blockHandler = "deal_testHotKet")
    public String testHotKey(
            @RequestParam(value = "p1",required = false) String p1,
            @RequestParam(value = "p2",required = false) String p2
    ){
        System.out.println("testHotKey 热点Key--测试");
        int age = 10/0;
        return "-------testHotKey";
    }

    public String deal_testHotKet(String p1, String p2, BlockException e) {
        return "----deal_testHotKet,wuwuwuwuwuuw"; //sentinel系统默认的提示:Blocked by sentinel(flow limiting)
    }
}
