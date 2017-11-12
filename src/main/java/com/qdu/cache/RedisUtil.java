package com.qdu.cache;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

public final class RedisUtil { 

	// Redis服务器IP
	 private static String ADDR = "127.0.0.1";
	// 测试服务器
	//private static String ADDR = "192.168.12.134";
	// Redis的端口号
	private static int PORT = 6379;

	// 访问密码
	private static String AUTH = "123456";

    
    //访问密码
    
    //可用连接实例的最大数目，默认值为8； 
    //如果赋值为-1，则表示不限制；如果pool已经分配了maxActive个jedis实例，则此时pool的状态为exhausted(耗尽)。
    private static int MAX_ACTIVE = 1024;
    
    //控制一个pool最多有多少个状态为idle(空闲的)的jedis实例，默认值也是8。
    private static int MAX_IDLE = 8;
    
    //等待可用连接的最大时间，单位毫秒，默认值为-1，表示永不超时。如果超过等待时间，则直接抛出JedisConnectionException；
    private static int MAX_WAIT = 10000;
    
    private static int TIMEOUT = 10000;
    
    //在borrow一个jedis实例时，是否提前进行validate操作；如果为true，则得到的jedis实例均是可用的；
    private static boolean TEST_ON_BORROW = true;
    
    private static JedisPool jedisPool = null;
    
    /**
     * 初始化Redis连接池
     */
    static {
        try {
            JedisPoolConfig config = new JedisPoolConfig();
            config.setMaxTotal(8);
            config.setMaxIdle(8);
            config.setMinIdle(0);//设置最小空闲数
            config.setMaxWaitMillis(10000);
            config.setTestOnBorrow(true);
            config.setJmxNamePrefix("pool");
            config.setTestOnReturn(true);
            //Idle时进行连接扫描
            config.setTestWhileIdle(true);
            //表示idle object evitor两次扫描之间要sleep的毫秒数
            config.setTimeBetweenEvictionRunsMillis(3000);
            //表示idle object evitor每次扫描的最多的对象数
            config.setNumTestsPerEvictionRun(10);
            //表示一个对象至少停留在idle状态的最短时间，然后才能被idle object evitor扫描并驱逐；这一项只有在timeBetweenEvictionRunsMillis大于0时才有意义
            config.setMinEvictableIdleTimeMillis(1000);
            jedisPool = new JedisPool(config, ADDR, PORT, 1000, AUTH,0);
            System.out.println("redis连接池初始化完成");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    /**
     * 获取Jedis实例
     * @return
     */
    public synchronized static Jedis getJedis() {
    	Jedis jedis = null;
        try {
                jedis = jedisPool.getResource();
                return jedis;
           
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }finally {
           // if(null != jedisPool) {
              returnResource(jedis);
              System.out.println("连接池释放");
          // }
        }
    }
    
    /**
     * 释放jedis资源
     * @param jedis
     */
	public static void returnResource(final Jedis jedis) {
        if (jedis != null) {
            jedisPool.returnResource(jedis);
        }
    }

	/**
	 * 
	 * 判断用户是否过期
	 * 
	 * @param jedis
	 */

	public static boolean VerifyUser(String id) {

		String key = RedisUtil.getJedis().get(id);
		if (key == null) {
			return false;
		}
		return true;
	}
}

