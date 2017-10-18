package com.newlecture.aop.spring;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Program {
	public static void main(String[] args) {
		//Calculator origin = new NewlecCalculator();
		
		
		//proxy�� �����ؼ� ���� �־��� ������ ����
		
		//int data = proxy.add(3, 4);
		
		//System.out.println(data);
		ApplicationContext context = new ClassPathXmlApplicationContext("com/newlecture/aop/spring/aop-context.xml");
		Calculator cal = (Calculator) context.getBean("cal");
		
		
		int data = cal.add(3, 4);
		data = cal.div(3, 0);
		
		//System.out.println(data);
		
	}

}
