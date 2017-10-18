package com.newlecture.aop.spring;

import org.springframework.aop.ThrowsAdvice;

public class ThrowingHandler implements ThrowsAdvice{
	
	public void afterThrowing(ArithmeticException e) throws Throwable{
		System.out.println("���ܰ� �߻��Ͽ����ϴ�. : "+e.getMessage());
	}

}
