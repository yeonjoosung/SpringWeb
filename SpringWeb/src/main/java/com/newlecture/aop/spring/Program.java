package com.newlecture.aop.spring;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

public class Program {
	public static void main(String[] args) {
		Calculator origin = new NewlecCalculator();
		
		
		//proxy를 생성해서 실제 주업무 로직을 위임
		
		int data = proxy.add(3, 4);
		
		System.out.println(data);
	}

}
