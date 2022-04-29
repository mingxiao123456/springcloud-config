package com.atguigu.springcloud.lb;

import org.springframework.cloud.client.ServiceInstance;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * @author mingxiao
 * @create 2022-04-21 4:04 PM
 */
@Component
public class MyLB implements LoadBalancer {

    private AtomicInteger automicInteger = new AtomicInteger(0);
    
    public final int getAndIncrement(){
        int current;
        int next;

        do{
            current = this.automicInteger.get();
            // 2147483647:整型的最大值
            next = current >= 2147483647 ? 0: current + 1;
        }while(!this.automicInteger.compareAndSet(current,next));
        System.out.println("第几次访问，次数next: " + next);
        return next;
    }

    // 负载均衡算法：rest接口第几次请求数 % 服务器集群总数量 = 实际调用服务器位置下标，每次服务重启动后rest接口计数从1开始。
    @Override
    public ServiceInstance instances(List<ServiceInstance> serviceInstances) {
        int index = getAndIncrement() % serviceInstances.size();
        return serviceInstances.get(index);
    }
}
