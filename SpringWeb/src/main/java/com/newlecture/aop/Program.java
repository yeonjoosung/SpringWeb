package com.newlecture.aop;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

public class Program {
	public static void main(String[] args) {
		Calculator origin = new NewlecCalculator();
		
		
		//proxy를 생성해서 실제 주업무 로직을 위임
		Calculator proxy = (Calculator) Proxy.newProxyInstance(
				NewlecCalculator.class.getClassLoader(), new Class[] {Calculator.class}, new InvocationHandler() {
			
			@Override
			public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
				
				System.out.println("사전처리 보조업무");
				
				//호출해서 result에 반환
				Object result = method.invoke(origin, args);
				
				System.out.println("eee");
				
				return result;
			}
		});
		//handler - 보조업무
		//int data = cal.add(3, 4);
		int data = proxy.add(3, 4);
		//data = proxy.sub(3, 4);
		System.out.println(data);
	}

}
