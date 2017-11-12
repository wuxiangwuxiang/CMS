package com.qdu.ClassManageSys;

import org.junit.Before;
import org.junit.Test;

import com.qdu.cache.RedisUtil;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

public class RedisTest {

    JedisPool pool;
    Jedis jedis;

    @Before
    public void start() {
    	jedis =  RedisUtil.getJedis();

//        // 初始化Redis连接池
//        pool = new JedisPool(new JedisPoolConfig(), "127.0.0.1");
//        // 从Redis连接池中获取一个连接
//        jedis = pool.getResource();
//        // Redis的密码，对应redis.windows.conf中的masterauth
//        jedis.auth("123456");

    }

    /**
     * 添加测试
     */
    @Test
    public void putTest() {

        jedis.set("user", "adwina");
        System.out.println(jedis.get("user"));


    }

    /**
     * 覆盖测试
     */
    @Test
    public void overWriteTest() {

        jedis.set("user", "Juin");
        System.out.println(jedis.get("user"));


    }

    /**
     * 追加测试
     */
    @Test
    public void appendTest() {

        jedis.append("user", "侯亚军");
        System.out.println(jedis.get("user"));


    }

    /**
     * 删除测试
     */
    @Test
    public void deleteTest() {

        jedis.del("user");
        System.out.println(jedis.get("user"));

        // 输出结果：null

    }

}
