package com.newlecture.aop.spring;

import java.lang.reflect.Method;

import org.springframework.aop.MethodBeforeAdvice;

public class BeforeHandler implements MethodBeforeAdvice{

	@Override
	public void before(Method method, Object[] arg, Object target) throws Throwable {
		
		System.out.println("before handler");
		
		
	}

}
