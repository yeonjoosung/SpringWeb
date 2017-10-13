package com.newlecture.aop;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

public class Program {
	public static void main(String[] args) {
		Calculator origin = new NewlecCalculator();
		
		
		//proxy�� �����ؼ� ���� �־��� ������ ����
		Calculator proxy = (Calculator) Proxy.newProxyInstance(
				NewlecCalculator.class.getClassLoader(), new Class[] {Calculator.class}, new InvocationHandler() {
			
			@Override
			public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
				
				System.out.println("����ó�� ��������");
				
				//ȣ���ؼ� result�� ��ȯ
				Object result = method.invoke(origin, args);
				
				System.out.println("eee");
				
				return result;
			}
		});
		//handler - ��������
		//int data = cal.add(3, 4);
		int data = proxy.add(3, 4);
		//data = proxy.sub(3, 4);
		System.out.println(data);
	}

}
