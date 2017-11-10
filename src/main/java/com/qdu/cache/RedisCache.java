 package com.qdu.cache;

import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;
import org.apache.ibatis.cache.Cache;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 
 * @描述: 使用第三方内存数据库Redis作为二级缓存
 * @版权: Copyright (c) 2017
 * @作者: juin
 * @版本: 1.0 
 * @创建日期: 2017年10月30日 
 * @创建时间: 下午8:02:57
 */
public class RedisCache implements Cache 
{
	private static Logger logger = LoggerFactory.getLogger(RedisCache.class); 

    /** The ReadWriteLock. */ 

    private final ReadWriteLock readWriteLock = new ReentrantReadWriteLock();

     

    private String id;

     

    public RedisCache(final String id) {  

        if (id == null) {

            throw new IllegalArgumentException("Cache instances require an ID");

        }

        logger.debug(">>>>>>>>>>>>>>>>>>>>>>>>MybatisRedisCache:id="+id);

        this.id = id;

    }  

     

    public String getId() {

        return this.id;

    }

 

    public void putObject(Object key, Object value) {

        logger.debug(">>>>>>>>>>>>>>>>>>>>>>>>putObject:"+key+"="+value);

        RedisUtil.getJedis().set(SerializeUtil.serialize(key.toString()), SerializeUtil.serialize(value));

    }

 

    public Object getObject(Object key) {

        Object value = SerializeUtil.unserialize(RedisUtil.getJedis().get(SerializeUtil.serialize(key.toString())));

        logger.debug(">>>>>>>>>>>>>>>>>>>>>>>>getObject:"+key+"="+value);
        return value;
        

    }

 

    public Object removeObject(Object key) {

        return RedisUtil.getJedis().expire(SerializeUtil.serialize(key.toString()),0);

    }

 

    public void clear() {
    	System.out.println("clear");
        RedisUtil.getJedis().flushDB();

    }

 

    public int getSize() {

        return Integer.valueOf(RedisUtil.getJedis().dbSize().toString());

    }

 

    public ReadWriteLock getReadWriteLock() {

        return readWriteLock;

    }
     

}

