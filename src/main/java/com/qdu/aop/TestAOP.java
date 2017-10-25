package com.qdu.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

//@Aspect
//@Component
public class TestAOP {
	//@Pointcut("execution(* com.qdu.controller.StudentController.confirmExitsStudent(..))")
	public void aspect() {

	}// 定义一个切入点，方便后面引入

	/**
	 * 前置通知
	 */
//	@Before("aspect()")
//	public String doBefore() {
//		System.out.println("前置通知");
//		return "heheda";
//	}
//
//	/**
//	 * 后置通知（连接点退出后通知，方法执行完毕）
//	 */
//	@After("aspect()")
//	public void doAfter() {
//		System.out.println("后置通知");
//	}
//
//	/**
//	 * 返回后通知（返回后通知）
//	 */
//	@AfterReturning("aspect()")
//	public void doAfterReturning() {
//		System.out.println("操作成功");
//	}
//
//	/**
//	 * 异常通知（当出现异常的时候通知）
//	 */
//	@AfterThrowing("aspect()")
//	public void doAfterThrowing() {
//		System.out.println("异常通知");
//	}

	/**
	 * 环绕通知，环绕通知可以使用ProceedingJoinPoint作为方法参数
	 */
//	@Around("aspect()")
//	public void doAround(ProceedingJoinPoint point) throws Throwable {
//		System.out.println("进入环绕方法");
//		// for (int i = 0; i < point.getArgs().length; i++) {  
//	            System.out.println("获取的参数： "+point.getArgs()[0]);  
//	       // }  
//		 
//	}

}
