package com.qdu.aop;

import java.lang.annotation.*;

/**
 * @author Juin
 * @Date: 2017/10/26
 * @Time: 01:09
 * @annotation OperationLogger
 */
@Retention(RetentionPolicy.RUNTIME)//注解会在class中存在，运行时可通过反射获取
@Target(ElementType.METHOD)//目标是方法
@Documented//文档生成时，该注解将被包含在javadoc中，可去掉
public @interface SystemLog
{
    /**
     * 模块名字
     */
    String module()  default "";  

    /**
     * 操作类型
     */
    String methods()  default ""; 

}