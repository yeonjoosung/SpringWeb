package com.newlecture.aop.spring;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

public class Program {
	public static void main(String[] args) {
		Calculator origin = new NewlecCalculator();
		
		
		//proxy�� �����ؼ� ���� �־��� ������ ����
		
		int data = proxy.add(3, 4);
		
		System.out.println(data);
	}

}
